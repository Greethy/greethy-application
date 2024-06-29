import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/get_status_login.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/save_status_login.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signin.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signup.dart';
import 'package:greethy_application/presentation/helper/constant.dart';
import 'package:greethy_application/presentation/helper/shared_prefrence_helper.dart';
import 'package:greethy_application/presentation/helper/utility.dart';
import 'package:greethy_application/presentation/state/appState.dart';
import 'package:greethy_application/presentation/ui/page/common/locator.dart';

class AuthState extends AppState {
  AuthState({
    required SignIn signIn,
    required GetStatusLogin getStatusLogin,
    required SignUp signUp,
    required SaveStatusLogin saveStatusLogin,
  })  : _signIn = signIn,
        _getStatusLogin = getStatusLogin,
        _signUp = signUp,
        _saveStatusLogin = saveStatusLogin;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  final SignIn _signIn;
  final GetStatusLogin _getStatusLogin;
  final SignUp _signUp;
  final SaveStatusLogin _saveStatusLogin;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  GoogleSignInAccount? googleUser;
  Map<String, dynamic>? facebookUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  User? _userModel;

  User? get userModel => _userModel;

  String _howToLogin = "";

  String get howToLogin => _howToLogin;

  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// Logout from device
  void logoutCallback() async {
    isBusy = true;
    authStatus = AuthStatus.NOT_LOGGED_IN;
    _userModel = null;

    if (_howToLogin.contains("google")) {
      googleUser = null;
      _googleSignIn.signOut();
      Utility.logEvent('google_logout', parameter: {});
    }
    if (_howToLogin.contains("facebook")) {
      facebookUser = null;
      _facebookAuth.logOut();
      Utility.logEvent('Facebook_logout', parameter: {});
    }
    _saveStatusLogin.call("");
    isBusy = false;
    await getIt<SharedPreferenceHelper>().clearPreferenceValues();
  }

  /// Verify user's credentials for login
  Future<String?> signIn(String email, String password, {required BuildContext context}) async {
    try {
      isBusy = true;
      _userModel = await _signIn.call(gmail: email, password: password, type: "normal");
      if (_userModel?.id != null){
        authStatus = AuthStatus.LOGGED_IN;
      }
      return null;
    } catch (error) {
      Utility.customSnackBar(context, error.toString());
      cprint(error, errorIn: 'signIn');
      return null;
    } finally {
      isBusy = false;
    }
  }

  /// Create user from `google login`
  /// If user is new then it create a new user
  /// If user is old then it just `authenticate` user and return google user dataDev
  Future<GoogleSignInAccount?> handleGoogleSignIn() async {
    isBusy = true;
    try {
      googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google login cancelled by user');
      }
      await createUserFromGoogleSignIn(googleUser!);
      return googleUser;
    } on PlatformException catch (error) {
      googleUser = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn PlatformException');
      return null;
    } on Exception catch (error) {
      googleUser = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn Exception');
      return null;
    } catch (error) {
      googleUser = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn error');
      return null;
    }
  }

  /// Create user profile from google login
  Future<void> createUserFromGoogleSignIn(GoogleSignInAccount user) async {
    var googleKey = await user.authentication;
    print("googleKey :" + googleKey.accessToken.toString());
    _userModel = await _signIn.call(gmail: user.email, password: googleKey.accessToken.toString(), type: "google");

    if (_userModel?.id != null) {
      authStatus = AuthStatus.LOGGED_IN;
      String token = "";
      await _saveStatusLogin("google " + token);
    }
    isBusy = false;
  }

  /// Create user from `Facebook login`
  /// If user is new then it creates a new user
  /// If user is old then it just `authenticates` the user and returns Facebook user dataDev
  Future<void> handleFacebookSignIn() async {
    isBusy = true;
    try {
      print("start handleFacebookSignIn");
      final facebookUser = await _facebookAuth.login(
        permissions: ['public_profile', 'email'],
      );

      if (facebookUser.status == LoginStatus.success) {
        final AccessToken accessToken = facebookUser.accessToken!;
        final userData = await _facebookAuth.getUserData();
        await createUserFromFacebookSignIn(userData, accessToken);
      } else if (facebookUser.status == LoginStatus.cancelled) {
        print('Facebook login cancelled by user');
      } else {
        print('Facebook login failed. Status: ${facebookUser.status}');
      }
    } catch (e) {
      print('Error logging in with Facebook: $e');
    }
  }

  /// Create or authenticate user based on Facebook sign-in dataDev
  Future<void> createUserFromFacebookSignIn(Map<String, dynamic> userData, AccessToken accessToken) async {
    final String email = userData['email'];
    final String name = userData['name'];
    final String avatar = userData['picture']['dataDev']['url'];

    _userModel = await _signIn.call(gmail: email, password: accessToken.toString(), type: "facebook");

    if(_userModel?.id != null){
      authStatus = AuthStatus.LOGGED_IN;
      String token = "";
      await _saveStatusLogin("facebook " + token);
    }

    isBusy = false;
  }

  /// Create new user's profile in db
  Future<bool?> signUp(User userModel, {required BuildContext context, required String password}) async {
    try {
      isBusy = true;
      //
      // todo: add api to check if email is registered
      // If you have already created an account, the email notification has been registered
      //
      //

      // authStatus = AuthStatus.LOGGED_IN;
      _userModel = userModel;
      isBusy = false;
      return userModel.isVerified;
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'signUp');
      Utility.customSnackBar(context, error.toString());
      return null;
    }
  }

  /// Fetch current user profile
  Future<User?> getCurrentUser() async {
    try {
      isBusy = true;
      Utility.logEvent('get_currentUser', parameter: {});
      _howToLogin = await _getStatusLogin.call();
      if (_howToLogin != "") {
        if (_howToLogin.contains("google ") || _howToLogin.contains("facebook ") || _howToLogin.contains("normal ")) {
          authStatus = AuthStatus.LOGGED_IN;
        }
        isBusy = false;
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
        isBusy = false;
      }
      return null;
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'getCurrentUser');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }

  /// Send email verification link to email
  Future<void> sendEmailVerification(BuildContext context) async {
    //
    // todo: Add api to check mail and authenticate email via otp code
    //

    // user.sendEmailVerification().then((_) {
    //   Utility.logEvent('email_verification_sent', parameter: {userModel!.displayName!: user.email});
    //   Utility.customSnackBar(
    //     context,
    //     'An email verification link is send to your email.',
    //   );
    // }).catchError((error) {
    //   cprint(error.message, errorIn: 'sendEmailVerification');
    //   Utility.logEvent('email_verification_block', parameter: {userModel!.displayName!: user.email});
    //   Utility.customSnackBar(
    //     context,
    //     error.message,
    //   );
    // });
  }

  /// Send password reset link to email
  Future<void> forgetPassword(String email, {required BuildContext context}) async {
    try {
      // await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
      //   Utility.customSnackBar(context, 'A reset password link is sent yo your mail.You can reset your password from there');
      //   Utility.logEvent('forgot+password', parameter: {});
      // }).catchError((error) {
      //   cprint(error.message);
      // });
    } catch (error) {
      Utility.customSnackBar(context, error.toString());
      return Future.value(false);
    }
  }

  /// `Update user` profile
  Future<void> updateUserProfile(User? userModel, {File? image, File? bannerImage}) async {
    try {
      if (image == null && bannerImage == null) {
      } else {
        /// upload profile image if not null
        if (image != null) {
          /// get image storage path from server
          // userModel!.avatar = await _uploadFileToStorage(image, 'user/profile/${userModel.userName}/${path.basename(image.path)}');
          // print(fileURL);
          // var name = userModel.personalInfo?.name ?? googleUser!.displayName;
          // _firebaseAuth.currentUser!.updateDisplayName(name);
          // _firebaseAuth.currentUser!.updatePhotoURL(userModel.profilePic);
          Utility.logEvent('user_profile_image');
        }

        /// upload banner image if not null
        if (bannerImage != null) {
          /// get banner storage path from server
          // userModel!.bannerImage = await _uploadFileToStorage(bannerImage, 'user/profile/${userModel.userName}/${path.basename(bannerImage.path)}');
          // Utility.logEvent('user_banner_image');
        }
      }

      Utility.logEvent('update_user');
    } catch (error) {
      cprint(error, errorIn: 'updateUserProfile');
    }
  }

  Future<String> _uploadFileToStorage(File file, path) async {
    // var task = _firebaseStorage.ref().child(path);
    // var status = await task.putFile(file);
    // cprint(status.state.name);
    //
    // /// get file storage path from server
    // return await task.getDownloadURL();
    return "";
  }

  /// Fetch user profile
  /// If `userProfileId` is null then logged in user's profile will fetched
  FutureOr<bool> getProfileUser({String? userProfileId}) {
    isBusy = true;
    try {
      //
      // todo: thêm api get thông tin người dùng
      //
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'getProfileUser');
    }

    return true;
  }

  void startIntroduction() {
    isBusy = true;
    authStatus = AuthStatus.FIRST_TIME;
    isBusy = false;
    print('startIntroduction');
  }

  String getFinanceManagement() {
    isBusy = true;
    if (_userModel?.financialManagementId == null) {
      //
      // todo: gửi api tạo mới financialManagement và trả về lại user_model mới
      //
    }
    isBusy = false;
    return "1";
  }
}
