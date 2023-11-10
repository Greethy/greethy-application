import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/helper/enum.dart';
import 'package:greethy_application/helper/shared_prefrence_helper.dart';
import 'package:greethy_application/helper/utility.dart';
import 'package:greethy_application/model/user.dart';
import 'package:greethy_application/ui/page/common/locator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' as path;

import 'appState.dart';

class AuthState extends AppState {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  bool isSignInWithGoogle = false;
  GoogleSignInAccount? user;
  late String userId;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // List<UserModel> _profileUserModelList;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  UserModel? get profileUserModel => _userModel;

  /// Logout from device
  void logoutCallback() async {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    userId = '';
    _userModel = null;
    user = null;
    // todo: delete info from share_pref
    // _profileQuery!.onValue.drain();
    // _profileQuery = null;
    if (isSignInWithGoogle) {
      _googleSignIn.signOut();
      Utility.logEvent('google_logout', parameter: {});
      isSignInWithGoogle = false;
    }
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
  /// If user is old then it just `authenticate` user and return google user data
  Future<GoogleSignInAccount?> handleGoogleSignIn() async {
    try {
      print("google login");
      user = await _googleSignIn.signIn();
      if (user == null) {
        throw Exception('Google login cancelled by user');
      }
      // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      // googleAuth.accessToken;
      authStatus = AuthStatus.LOGGED_IN;
      userId = user!.id;
      isSignInWithGoogle = true;
      createUserFromGoogleSignIn(user!);
      notifyListeners();
      return user;
    } on PlatformException catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    } on Exception catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    } catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    }
  }

  /// Create user profile from google login
  void createUserFromGoogleSignIn(GoogleSignInAccount user) {
    // todo: add api to check if user is new or old
    // var diff = DateTime.now().difference(user.metadata!.creationTime!);
    // Check if user is new or old
    // If user is new then add new user to firebase realtime kDatabase
    // if (diff < const Duration(seconds: 15)) {
      UserModel model = UserModel(
        bio: 'Edit profile to update bio',
        dob: DateTime(1950, DateTime.now().month, DateTime.now().day + 3).toString(),
        location: 'Somewhere in universe',
        profilePic: user.photoUrl!,
        displayName: user.displayName!,
        email: user.email,
        key: user.id,
        userId: user.id,
        // contact: user.!,
        // isVerified: user.emailVerified,
      );

      print("chunhthanhde create new user: $model");
      createUser(model, newUser: true);
    // } else {
    //   cprint('Last login at: ${user.metadata.lastSignInTime}');
    // }
  }

  /// Create new user's profile in db
  Future<String?> signUp(UserModel userModel, {required BuildContext context, required String password}) async {
    // try {
    //   isBusy = true;
    //   // var result = await _firebaseAuth.createUserWithEmailAndPassword(
    //   //   email: userModel.email!,
    //   //   password: password,
    //   // );
    //   user = result.user;
    //   authStatus = AuthStatus.LOGGED_IN;
    //
    //   result.user!.updateDisplayName(
    //     userModel.displayName,
    //   );
    //   result.user!.updatePhotoURL(userModel.profilePic);
    //
    //   _userModel = userModel;
    //   _userModel!.key = user!.id;
    //   _userModel!.userId = user!.id;
    //   createUser(_userModel!, newUser: true);
    //   return user!.id;
    // } catch (error) {
    //   isBusy = false;
    //   cprint(error, errorIn: 'signUp');
    //   Utility.customSnackBar(context, error.toString());
      return null;

  }

  /// `Create` and `Update` user
  /// IF `newUser` is true new user is created
  /// Else existing user will update with new values
  void createUser(UserModel user, {bool newUser = false}) {
    if (newUser) {
      // Create username by the combination of name and id
      user.userName = Utility.getUserName(id: user.userId!, name: user.displayName!);
      print(' create_newUser');

      // Time at which user is created
      user.createdAt = DateTime.now().toUtc().toString();
    }

    // kDatabase.child('profile').child(user.userId!).set(user.toJson());
    // _userModel = user;
    // isBusy = false;
  }

  /// Fetch current user profile
  Future<GoogleSignInAccount?> getCurrentUser() async {
    try {
      isBusy = true;
      Utility.logEvent('get_currentUSer', parameter: {});
      // todo add api get CurrenUser from server
      user = _googleSignIn.currentUser;
      if (user != null) {
        await getProfileUser();
        authStatus = AuthStatus.LOGGED_IN;
        userId = user!.id;
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      isBusy = false;
      return user;
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'getCurrentUser');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }

  /// Reload user to get refresh user data
  void reloadUser() async {
    // await user!.reload();
    // user = _firebaseAuth.currentUser;
    // if (user!.emailVerified) {
    //   userModel!.isVerified = true;
    //   // If user verified his email
    //   // Update user in firebase realtime kDatabase
    //   createUser(userModel!);
    //   cprint('UserModel email verification complete');
    //   Utility.logEvent('email_verification_complete', parameter: {userModel!.userName!: user!.email});
    // }
  }

  /// Send email verification link to email2
  Future<void> sendEmailVerification(BuildContext context) async {
    // User user = _firebaseAuth.currentUser!;
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
  Future<void> updateUserProfile(UserModel? userModel, {File? image, File? bannerImage}) async {
    try {
      if (image == null && bannerImage == null) {
        createUser(userModel!);
      } else {
        /// upload profile image if not null
        if (image != null) {
          /// get image storage path from server
          userModel!.profilePic = await _uploadFileToStorage(image, 'user/profile/${userModel.userName}/${path.basename(image.path)}');
          // print(fileURL);
          var name = userModel.displayName ?? user!.displayName;
          // _firebaseAuth.currentUser!.updateDisplayName(name);
          // _firebaseAuth.currentUser!.updatePhotoURL(userModel.profilePic);
          Utility.logEvent('user_profile_image');
        }

        /// upload banner image if not null
        if (bannerImage != null) {
          /// get banner storage path from server
          userModel!.bannerImage = await _uploadFileToStorage(bannerImage, 'user/profile/${userModel.userName}/${path.basename(bannerImage.path)}');
          Utility.logEvent('user_banner_image');
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
  Future<UserModel?> getUserDetail(String userId) async {
    UserModel user;

    // todo: add api get userDetail
    // var event = await kDatabase.child('profile').child(userId).once();

    // final map = event.snapshot.value as Map?;
    // if (map != null) {
    //   user = UserModel.fromJson(map);
    //   user.key = event.snapshot.key!;
    //   return user;
    // } else {
    //   return null;
    // }
  }

  /// Fetch user profile
  /// If `userProfileId` is null then logged in user's profile will fetched
  FutureOr<void> getProfileUser({String? userProfileId}) {
    try {
      // userProfileId = userProfileId ?? user!.uid;
      // kDatabase.child("profile").child(userProfileId).once().then((DatabaseEvent event) async {
      //   final snapshot = event.snapshot;
      //   if (snapshot.value != null) {
      //     var map = snapshot.value as Map<dynamic, dynamic>?;
      //     if (map != null) {
      //       if (userProfileId == user!.uid) {
      //         _userModel = UserModel.fromJson(map);
      //         _userModel!.isVerified = user!.emailVerified;
      //         if (!user!.emailVerified) {
      //           // Check if logged in user verified his email address or not
      //           // reloadUser();
      //         }
      //         if (_userModel!.fcmToken == null) {
      //           updateFCMToken();
      //         }
      //
      //         getIt<SharedPreferenceHelper>().saveUserProfile(_userModel!);
      //       }
      //
      //       Utility.logEvent('get_profile', parameter: {});
      //     }
      //   }
      //   isBusy = false;
      // });
    } catch (error) {
      isBusy = false;
      cprint(error, errorIn: 'getProfileUser');
    }
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

}
