import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/utility.dart';
import '../../../model/user_model/networking.dart';
import '../../../model/user_model/user.dart';
import '../../../state/profileState.dart';
import '../../../widgets/customWidgets.dart';
import '../../../widgets/newWidget/rippleButton.dart';
import '../../../widgets/url_text/customUrlText.dart';
import '../../theme/theme.dart';
import 'edit_profile_page/edit_profile_page.dart';

class UserNameRowWidget extends StatelessWidget {
  const UserNameRowWidget({
    required this.user,
    required this.isMyProfile,
    required this.networking,
  }) : super();

  final bool isMyProfile;
  final UserModel user;
  final NetworkingModel networking;

  String getBio(String bio) {
    if (isMyProfile) {
      return bio;
    } else if (bio == "Edit profile to update bio") {
      return "No bio available";
    } else {
      return bio;
    }
  }

  /// follower button
  Widget _textButton(BuildContext context, String count, String text, Function onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$text',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var profileState = Provider.of<ProfileState>(context);
    bool isFollower() {
      // if (profileState.profileUserModel.followersList != null && profileState.profileUserModel.followersList!.isNotEmpty) {
      //   return (profileState.profileUserModel.followersList!.any((x) => x == profileState.userId));
      // } else {
      return false;
      // }
    }

    return Padding(
      padding: EdgeInsetsDirectional.all(5),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: GreethyColor.kawa_green,
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),

            /// nick name
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: <Widget>[
                  /// name
                  UrlText(
                    text: user.nickName!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),

                  /// blue ticket
                  user.isVerified!
                      ? customIcon(
                          context,
                          icon: AppIcon.blueTick,
                          isTwitterIcon: true,
                          iconColor: AppColor.primary,
                          size: 17,
                          paddingIcon: 8,
                        )
                      : const SizedBox(width: 0),
                  Spacer(),

                  /// following
                  Container(
                    margin: const EdgeInsets.only(right: 0),
                    child: Row(
                      children: <Widget>[
                        // isMyProfile
                        //     ? Container(height: 40)
                        //     : RippleButton(
                        //         splashColor: GreethyColor.dodgeBlue_50.withAlpha(100),
                        //         borderRadius: const BorderRadius.all(
                        //           Radius.circular(20),
                        //         ),
                        //         onPressed: () {
                        //           if (!isMyProfile) {
                        //             // final chatState = Provider.of<ChatState>(context, listen: false);
                        //             // chatState.setChatUser = profileState.profileUserModel;
                        //             // Navigator.pushNamed(context, '/ChatScreenPage');
                        //           }
                        //         },
                        //         child: Container(
                        //           height: 35,
                        //           width: 35,
                        //           padding: const EdgeInsets.only(bottom: 5, top: 0, right: 0, left: 0),
                        //           decoration: BoxDecoration(border: Border.all(color: isMyProfile ? Colors.black87.withAlpha(180) : Colors.blue, width: 1), shape: BoxShape.circle),
                        //           child: const Icon(
                        //             AppIcon.messageEmpty,
                        //             color: Colors.blue,
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        // const SizedBox(width: 10),

                        /// follow - edit profile button
                        RippleButton(
                          splashColor: GreethyColor.dodgeBlue_50.withAlpha(100),
                          borderRadius: const BorderRadius.all(Radius.circular(60)),
                          onPressed: () {
                            if (isMyProfile) {
                              Navigator.push(context, EditProfilePage.getRoute());
                            } else {
                              profileState.followUser(removeFollower: isFollower());
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isMyProfile
                                  ? GreethyColor.white
                                  : isFollower()
                                      ? GreethyColor.dodgeBlue
                                      : GreethyColor.white,
                              border: Border.all(
                                color: isMyProfile ? Colors.black87.withAlpha(180) : Colors.blue,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),

                            /// If [isMyProfile] is true then Edit profile button will display
                            /// Otherwise Follow/Following button will be display
                            child: Text(
                              isMyProfile
                                  ? 'Edit Profile'
                                  : isFollower()
                                      ? 'Following'
                                      : 'Follow',
                              style: TextStyle(
                                color: isMyProfile
                                    ? Colors.black87.withAlpha(180)
                                    : isFollower()
                                        ? GreethyColor.white
                                        : Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// real name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: customText(
                '${user.personalInfo?.name}',
                style: TextStyles.subtitleStyle.copyWith(fontSize: 13),
              ),
            ),

            /// bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: customText(
                getBio(user.bio!),
              ),
            ),

            /// location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  customIcon(
                    context,
                    icon: AppIcon.locationPin,
                    size: 15,
                    isTwitterIcon: true,
                    paddingIcon: 5,
                    iconColor: AppColor.darkGrey,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: customText(
                      user.nickName,
                      style: const TextStyle(color: AppColor.darkGrey),
                    ),
                  )
                ],
              ),
            ),

            /// user create date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  customIcon(
                    context,
                    icon: AppIcon.calender,
                    size: 15,
                    isTwitterIcon: true,
                    paddingIcon: 5,
                    iconColor: AppColor.darkGrey,
                  ),
                  const SizedBox(width: 10),
                  customText(
                    Utility.getJoiningDate(user.createdDate),
                    style: const TextStyle(color: AppColor.darkGrey),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.only(start: 15, end: 15),
            //   child: Divider(
            //     color: Colors.grey,
            //   ),
            // ),
            SizedBox(height: 15),

            /// Followers - Following
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _textButton(
                    context,
                    networking.followers!.length.toString(),
                    'Số lượng Plays',
                    () {
                      var state = context.read<ProfileState>();
                      // Navigator.push(
                      //   context,
                      //   FollowerListPage.getRoute(
                      //     profile: state.profileUserModel,
                      //     userList: state.profileUserModel.followersList!,
                      //   ),
                      // );
                    },
                  ),
                  _textButton(
                    context,
                    networking.followers!.length.toString(),
                    'Người theo dõi',
                    () {
                      var state = context.read<ProfileState>();
                      // Navigator.push(
                      //   context,
                      //   FollowerListPage.getRoute(
                      //     profile: state.profileUserModel,
                      //     userList: state.profileUserModel.followersList!,
                      //   ),
                      // );
                    },
                  ),
                  _textButton(context, networking.following!.length.toString(), 'Đang theo dõi', () {
                    var state = context.read<ProfileState>();
                    // Navigator.push(
                    //   context,
                    //   FollowingListPage.getRoute(
                    //     profile: state.profileUserModel,
                    //     userList: state.profileUserModel.followingList!,
                    //   ),
                    // );
                  }),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
