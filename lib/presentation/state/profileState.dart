import 'package:greethy_application/presentation/state/appState.dart';

import '../helper/utility.dart';
import '../model/user_model/networking.dart';
import '../model/user_model/user.dart';

class ProfileState extends AppState {
  ProfileState(this.profileId) {
    databaseInit();
    userId = profileId;
    _getloggedInUserProfile(userId);
    _getProfileUser(profileId);
  }

  /// user who is logged into the app
  ///
  /// This is the id of user who is logged into the app.
  /// Profile and Networking dataDev of logged in user.
  late String userId;
  late UserModel _userModel;
  late NetworkingModel _networkingModel;

  UserModel get userModel => _userModel;

  NetworkingModel get networkingModel => _networkingModel;

  /// user whose profile is open
  ///
  /// This is the id of user whose profile is open.
  /// Profile and Networking dataDev of user whose profile is open.
  final String profileId;
  late UserModel _profileUserModel;
  late NetworkingModel _profileNetworkingModel;

  UserModel get profileUserModel => _profileUserModel;

  NetworkingModel get profileNetworking => _profileNetworkingModel;

  databaseInit() {
    //
    // todo: đoạn này sẽ kiểm tra thông tin của người dùng trên máy xem người dùng đăng
    //  nhập đã follow người dùng được xem profile chưa
    //
    //
  }

  bool get isMyProfile => profileId == userId;

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

  /// Fetch profile dataDev of user whoose profile is opened
  void _getProfileUser(String? userProfileId) {
    // try {
    //
    //   kDatabase
    //       .child("profile")
    //       .child(userProfileId!)
    //       .once()
    //       .then((DatabaseEvent event) {
    //     final snapshot = event.snapshot;
    //     if (snapshot.value != null) {
    //       var map = snapshot.value as Map;
    //       // ignore: unnecessary_null_comparison
    //       if (map != null) {
    //         _profileUserModel = UserModel.fromJson(map);
    //         Utility.logEvent('get_profile', parameter: {});
    //       }
    //     }
    //     loading = false;
    //   });
    // } catch (error) {
    //   loading = false;
    //   cprint(error, errorIn: 'getProfileUser');
    //   }
    isBusy = true;
    _profileUserModel = UserModel.fromJson({
      "id": "1",
      "email": "chung@gmail.com",
      "password": "123456",
      "nickName": "ChunhThanhDe",
      "avatar": "https://lh3.googleusercontent.com/a/ACg8ocKqhrG9LEclwdnAPAUWi_To05F6N9Xq_h2OZ8VwmuyoiQ",
      "bio": "chunglaca Dear anh chị em Trung tâm Công nghệ Điện tử, Công đoàn HEC đã gửi số lượng CĐV của HEC tham gia cuộc thi Chung tay vì an toàn giao thông năm 2023 đến Công đoàn cấp trên",
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

    _profileNetworkingModel = NetworkingModel.fromJson({
      "id": 1,
      "userId": 1,
      "following": [1, 2, 3],
      "followers": [4, 5],
      "resFollowing": [6, 7],
      "resFollower": [8, 9],
      "relatives": {
        "resHomieSend": [
          {
            "position": "Con trai",
            "userId": 3,
          },
          {
            "position": "Con gái",
            "userId": 7,
          }
        ],
        "resHomieGet": [
          {
            "position": "Bồ",
            "userId": 5,
          }
        ],
        "homieList": [
          {"position": "Vợ", "userId": 1}
        ]
      },
      "clubGroup": {
        "topClub": [
          {"club_name": "Club ăn chơi nhảy múa", "club_profile_pic": "bababab.com.vn", "club_star": 1000, "club_plays_personal_id": 1, "club_id": 2},
          {"club_name": "lối sống healthy", "club_profile_pic": "bababab.com.vn", "club_star": 1000, "club_plays_personal_id": 1, "club_id": 2},
        ],
        "clubList": [
          {"club_id": 1, "club_plays_personal_id": 1},
          {"club_id": 2, "club_plays_personal_id": 2},
          {"club_id": 3, "club_plays_personal_id": 3}
        ]
      },
      "challengesTrophy": {
        "presentChallenge": [
          {"challenges_name": "chạy bộ trên đường trường sơn", "challenges_image": "chung.com.vn", "challenges_time_start": "12:00 12/12/2002", "challenges_time_close": "12:00 13/12/2002", "challenge_id": 2}
        ],
        "trophyChallenge": [
          {"challenges_name": "Đạp xe trên đường quốc lộ", "challenges_image": "chung.com.vn", "challenge_trophy": "vàng", "challenge_id": 1}
        ],
        "challengesJoinList": [1, 2, 3, 4, 5]
      }
    });

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

  @override
  void dispose() {
    super.dispose();
  }
}
