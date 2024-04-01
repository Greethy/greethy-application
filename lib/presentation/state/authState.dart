import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greethy_application/data/impl/auth_repository_impl.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/auth_api.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signin.dart';
import 'package:greethy_application/presentation/helper/constant.dart';
import 'package:greethy_application/presentation/helper/shared_prefrence_helper.dart';
import 'package:greethy_application/presentation/helper/utility.dart';
import 'package:greethy_application/presentation/state/appState.dart';
import 'package:greethy_application/presentation/ui/page/common/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState extends AppState {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  GoogleSignInAccount? googleUser;
  Map<String, dynamic>? facebookUser;
  late SignIn _signIn;
  late SharedPreferences sharedPref;

  late String userId;
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

  Future checkSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("signed_in") ?? false;
    // notifyListeners();
  }

  Future setSignIn(bool signIn) async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("signed_in", signIn);
    _isSignedIn = signIn;
    // notifyListeners();
  }

  Future checkHowToLogin() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _howToLogin = s.getString("how_to_login") ?? "";
    notifyListeners();
  }

  Future setHowToLogin(String type) async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setString("how_to_login", type);
    _howToLogin = type;
    notifyListeners();
  }

  /// Logout from device
  void logoutCallback() async {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    userId = '';
    _userModel = null;
    //
    // todo: delete info from share_pref
    //
    if (_howToLogin == "google") {
      googleUser = null;
      _googleSignIn.signOut();
      Utility.logEvent('google_logout', parameter: {});
      await setSignIn(false);
    }
    if (_howToLogin == "facebook") {
      facebookUser = null;
      _facebookAuth.logOut();
      Utility.logEvent('Facebook_logout', parameter: {});
      await setSignIn(false);
    }
    await setHowToLogin("");
    notifyListeners();
    await getIt<SharedPreferenceHelper>().clearPreferenceValues();
  }

  /// Alter select auth method, login and sign up page
  void openSignUpPage() {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    userId = '';
    notifyListeners();
  }

  void databaseInit() {
    try {
      // todo init if open app
      // if (_profileQuery == null) {
      //   _profileQuery = kDatabase.child("profile").child(user!.uid);
      //   _profileQuery!.onValue.listen(_onProfileChanged);
      //   _profileQuery!.onChildChanged.listen(_onProfileUpdated);
      // }
    } catch (error) {
      cprint(error, errorIn: 'databaseInit');
    }
  }

  /// Verify user's credentials for login
  Future<String?> signIn(String email, String password, {required BuildContext context}) async {
    try {
      isBusy = true;
      // todo: api signin
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
    try {
      print("google login");
      googleUser = await _googleSignIn.signIn();


      if (googleUser == null) {
        throw Exception('Google login cancelled by user');
      }


      var googleKey = await googleUser?.authentication;
      print("googleKey :" + googleKey!.accessToken.toString());
      sharedPref = await SharedPreferences.getInstance();

      final api = AuthApiImpl();
      final localStorage = LocalStorageUserImpl(sharedPreferences: sharedPref);
      final repo = AuthRepositoryImpl(api: api, localStorage: localStorage);
      _signIn = SignIn(repository: repo);


      //
      // todo gửi api lên server để xác nhận tài khoản đã tồn tại hay chưa nếu chưa thì tạo tài khoản mới
      //

      authStatus = AuthStatus.LOGGED_IN;
      userId = googleUser!.id;
      await setSignIn(true);
      await setHowToLogin("google");
      print("googleUser: " + googleUser.toString());
      createUserFromGoogleSignIn(googleUser!);
      notifyListeners();
      return googleUser;
    } on PlatformException catch (error) {
      googleUser = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    } on Exception catch (error) {
      googleUser = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    } catch (error) {
      googleUser = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    }
  }

  /// Create user profile from google login
  void createUserFromGoogleSignIn(GoogleSignInAccount user) {
    PersonalInfo personalModel = PersonalInfo(
      name: user.displayName,
    );

    User userModel = User(
      email: user.email,
      personalInfo: personalModel,
      avatar: user.photoUrl,
      isVerified: true,
    );

    //
    // todo: add api to check if there is already an account with this gmail account
    //
    print("chunhthanhde create new user: $userModel");
    createUser(userModel, newUser: true);
    isBusy = false;
  }

  /// Create user from `Facebook login`
  /// If user is new then it creates a new user
  /// If user is old then it just `authenticates` the user and returns Facebook user dataDev
  Future<void> handleFacebookSignIn() async {
    try {
      print("start handleFacebookSignIn");
      final facebookUser = await _facebookAuth.login(
        permissions: ['public_profile', 'email'],
      );

      if (facebookUser.status == LoginStatus.success) {
        final AccessToken accessToken = facebookUser.accessToken!;

        final userData = await _facebookAuth.getUserData();

        authStatus = AuthStatus.LOGGED_IN;
        await setSignIn(true);
        await setHowToLogin("facebook");
        createUserFromFacebookSignIn(userData);
        notifyListeners();
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
  void createUserFromFacebookSignIn(Map<String, dynamic> userData) {
    final String? email = userData['email'];
    final String? name = userData['name'];
    final String? avatar = userData['picture']['dataDev']['url'];

    PersonalInfo personalModel = PersonalInfo(
      name: name,
    );

    User userModel = User(
      email: email,
      personalInfo: personalModel,
      avatar: avatar,
      isVerified: true,
    );

    //
    // todo: add api to check if there is already an account with this gmail account
    //
    print("chunhthanhde create new user: $userModel");
    createUser(userModel, newUser: true);
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

      // nếu cưa thì sẽ đăng nhập
      createUser(_userModel!, newUser: true);

      return userModel.isVerified;
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'signUp');
      Utility.customSnackBar(context, error.toString());
      return null;
    }
  }

  /// `Create` and `Update` user
  /// IF `newUser` is true new user is created
  /// Else existing user will update with new values
  void createUser(User user, {bool newUser = false}) {
    if (newUser) {
      /// Create new user
      print(' create_newUser');
    }
    isBusy = false;
  }

  /// Fetch current user profile
  Future<User?> getCurrentUser() async {
    try {
      isBusy = true;
      Utility.logEvent('get_currentUSer', parameter: {});
      print("0");
      await checkSignInUser();
      await checkHowToLogin();
      if (_isSignedIn) {
        if (_howToLogin == "google") {
          googleUser = _googleSignIn.currentUser;
        } else if (_howToLogin == "facebook") {
          facebookUser = await _facebookAuth.getUserData();
        }

        // TODO: Thêm API để lấy thông tin người dùng vào hàm dưới đây
        print("1");
        if (await getProfileUser()) {
          print("2");
          authStatus = AuthStatus.LOGGED_IN;
        } else {
          print("3");
          authStatus = AuthStatus.NOT_LOGGED_IN;
        }
        print("4");
        isBusy = false;
      } else {
        print("5");
        authStatus = AuthStatus.NOT_LOGGED_IN;
        isBusy = false;
      }
      print("6");
      return null;
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'getCurrentUser');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }

  /// Reload user to get refresh user dataDev
  void reloadUser() async {
    // await user!.reload();
    // user = _firebaseAuth.currentUser;
    // if (user!.emailVerified) {
    //   userModel!.isVerified = true;
    //   // If user verified his email
    //   // Update user in firebase realtime kDatabase
    //   createUser(userModel!);
    //   cprint('User email verification complete');
    //   Utility.logEvent('email_verification_complete', parameter: {userModel!.userName!: user!.email});
    // }
  }

  /// Send email verification link to email2
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

  /// Check if user's email is verified
  Future<bool> emailVerified() async {
    // User user = _firebaseAuth.currentUser!;
    // return user.emailVerified;
    return true;
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
        createUser(userModel!);
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

        if (userModel != null) {
          createUser(userModel);
        } else {
          createUser(_userModel!);
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

  /// `Fetch` user `detail` whose userId is passed
  Future<User?> getUserDetail(String userId) async {
    User user;

    // todo: add api get userDetail
    // var event = await kDatabase.child('profile').child(userId).once();

    // final map = event.snapshot.value as Map?;
    // if (map != null) {
    //   user = User.fromJson(map);
    //   user.key = event.snapshot.key!;
    //   return user;
    // } else {
    //   return null;
    // }
  }

  /// Fetch user profile
  /// If `userProfileId` is null then logged in user's profile will fetched
  FutureOr<bool> getProfileUser({String? userProfileId}) {
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

  /// if firebase token not available in profile
  /// Then get token from firebase and save it to profile
  /// When someone sends you a message FCM token is used
  void updateFCMToken() {
    if (_userModel == null) {
      return;
    }
    getProfileUser();
    // _firebaseMessaging.getToken().then((String? token) {
    //   assert(token != null);
    //   _userModel!.fcmToken = token;
    //   createUser(_userModel!);
    // });
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

    return "1";
  }
}
