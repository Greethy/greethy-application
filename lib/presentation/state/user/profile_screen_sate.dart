import 'dart:io';

import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/user_dto/networking_dto.dart';
import 'package:greethy_application/data/dto/user_dto/user_dto.dart';
import 'package:greethy_application/domain/entities/user_entities/networking.dart';
import 'package:greethy_application/domain/usecase/user_usercase/get_user.dart';
import 'package:greethy_application/domain/usecase/user_usercase/put_user.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/helper/utility.dart';
import 'package:greethy_application/presentation/state/appState.dart';

import 'package:greethy_application/domain/entities/user_entities/user.dart';

class ProfileScreenState extends AppState {
  ProfileScreenState(this.profileId) {
    databaseInit();
    userId = profileId;
    _getloggedInUserProfile(userId);
    _getProfileUser(profileId);
  }

  // ---------------------------------------------------------------------------
  // required
  // ---------------------------------------------------------------------------

  final String profileId;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetUser _getBodySpecsManagement = DependencyInjection().getUser;
  final PutUser _postBodySpecs = DependencyInjection().putUser;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  /// user who is logged into the app
  ///
  /// This is the id of user who is logged into the app.
  /// Profile and Networking dataDev of logged in user.
  late String userId;
  late User _userModel;
  late Networking _networkingModel;

  User get userModel => _userModel;

  Networking get networkingModel => _networkingModel;

  /// user whose profile is open
  ///
  /// This is the id of user whose profile is open.
  /// Profile and Networking dataDev of user whose profile is open.
  late User _profileUserModel;
  late Networking _profileNetworkingModel;

  User get profileUserModel => _profileUserModel;

  Networking get profileNetworking => _profileNetworkingModel;

  bool get isMyProfile => profileId == userId;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  databaseInit() {
    //
    // todo: đoạn này sẽ kiểm tra thông tin của người dùng trên máy xem người dùng đăng
    //  nhập đã follow người dùng được xem profile chưa
    //
    //
  }

  /// Fetch profile of logged in  user
  void _getloggedInUserProfile(String userId) async {
    // kDatabase.child("profile").child(userId).once().then((DatabaseEvent event) {
    //   final snapshot = event.snapshot;
    //   if (snapshot.value != null) {
    //     var map = snapshot.value as Map<dynamic, dynamic>?;
    //     if (map != null) {
    //       _userModel = UserModel.fromJson(map);
    //     }
    //   }
    // });

    //
    // todo: add api to get get profile của người dùng đăng nhập
    //
  }

  /// Fetch profile dataDev of user whose profile is opened
  Future<void> _getProfileUser(String? userProfileId) async {
    isBusy = true;
    _profileUserModel = UserDto.fromMap({
      "id": "1",
      "email": "chung@gmail.com",
      "password": "123456",
      "nickName": "ChunhThanhDe",
      "avatar": "https://lh3.googleusercontent.com/a/ACg8ocKqhrG9LEclwdnAPAUWi_To05F6N9Xq_h2OZ8VwmuyoiQ",
      "bio":
          "chunglaca Dear anh chị em Trung tâm Công nghệ Điện tử, Công đoàn HEC đã gửi số lượng CĐV của HEC tham gia cuộc thi Chung tay vì an toàn giao thông năm 2023 đến Công đoàn cấp trên",
      "personal_info": {
        "name": "Nguyễn Thành Chung",
        "location": "Ha Noi",
        "webSite": "facebook.com.vn",
        "dob": {"date": "20/3", "year": "2020"},
        "gender": 1
      },
      "premiumUser": {
        // thông tin về tham gia gói premium
        "isPremium": true,
        "startTime": "10:22 12/10/2023",
        "endTime": "10:22 12/11/2023"
      },
      "isVerified": true, // đã xác thực email chưa
      "financial_management_id": "1",
      "nutritional_management_id": "1",
      "fitness_management_id": "1",
      "networking_id": "1",
      "plays_user_management_id": "1", // thông tin về mạng xã hội plays của người dùng
      "created_date": "20230212",
    });

    _profileNetworkingModel = await NetworkingDto.fromRawJson(await rootBundle.loadString('assets/database_sample/user/networking_final.json'));

    //
    // todo: add api to get get profile của người dùng được xem profile
    //
    isBusy = false;
  }

  /// Follow / Unfollow user
  ///
  /// If `removeFollower` is true then remove user from follower list
  ///
  /// If `removeFollower` is false then add user to follower list
  followUser({bool removeFollower = false}) {
    /// `userModel` is user who is logged-in app.
    /// `profileUserModel` is user whoose profile is open in app.
    try {
      if (removeFollower) {
        /// remove user from follower list, "Unfollow"
        ///
        /// If logged-in user `alredy follow `profile user then
        /// 1.Remove logged-in user from profile user's `follower` list
        /// 2.Remove profile user from logged-in user's `following` list
        // profileUserModel.followersList!.remove(userModel.userId);

        //
        // todo: thêm api unfollow -> bên phía người được ăn follow tự động bỏ follower
        //

        cprint('user removed from following list', event: 'remove_follow');
      } else {
        /// add user to follower list, "request follower"
        ///
        /// if logged in user is `not following` profile user then
        /// 1.Add logged in user to profile user's `follower` list
        /// 2. Add profile user to logged in user's `following` list
        // profileUserModel.followersList ??= [];
        // profileUserModel.followersList!.add(userModel.userId!);
        // // Adding profile user to logged-in user's following list
        // userModel.followingList ??= [];
        // addFollowNotification();
        // userModel.followingList!.add(profileUserModel.userId!);

        //
        // todo: thêm api gửi request follow tới người khác server sẽ tạo thông báo cho người dùng đó
        //
      }
      notifyListeners();
    } catch (error) {
      cprint(error, errorIn: 'followUser');
    }
  }

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

// void addFollowNotification() {
// Sends notification to user who created tweet
// UserModel owner can see notification on notification page
// kDatabase.child('notification').child(profileId).child(userId).set({
//   'type': NotificationType.Follow.toString(),
//   'createdAt': DateTime.now().toUtc().toString(),
//   'dataDev': UserModel(
//           displayName: userModel.displayName,
//           profilePic: userModel.profilePic,
//           isVerified: userModel.isVerified,
//           userId: userModel.userId,
//           bio: userModel.bio == "Edit profile to update bio"
//               ? ""
//               : userModel.bio,
//           userName: userModel.userName)
//       .toJson()
// });
// }

  /// Trigger when logged-in user's profile change or updated
  /// Firebase event callback for profile update
// void _onProfileChanged(DatabaseEvent event) {
//   // final updatedUser = UserModel.fromJson(event.snapshot.value as Map);
//
//   if (updatedUser.userId == profileId) {
//     _profileUserModel = updatedUser;
//   }
//   notifyListeners();
// }
}
