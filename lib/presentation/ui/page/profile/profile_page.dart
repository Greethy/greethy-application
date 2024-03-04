import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_image_view.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_page_top_club_scroll_view.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_page_trophy_scroll_view.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_page_user_detail_view.dart';
import 'package:provider/provider.dart';

import '../../../state/profileState.dart';
import '../../../widgets/cache_image.dart';
import '../../../widgets/customWidgets.dart';
import '../../../widgets/newWidget/rippleButton.dart';
import '../../theme/theme.dart';
import 'local_widgets/circular_image.dart';
import 'local_widgets/title_with_all_btn.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.profileId}) : super(key: key);

  final String profileId;

  static MaterialPageRoute getRoute({required String profileId}) {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => ProfileState(profileId),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ProfileState(profileId),
          builder: (_, child) => ProfilePage(
            profileId: profileId,
          ),
        ),
      ),
    );
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  bool isMyProfile = false;
  int pageIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var profileState = Provider.of<ProfileState>(context, listen: false);

      isMyProfile = profileState.isMyProfile;
    });
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  SliverAppBar getAppbar() {
    var profileState = Provider.of<ProfileState>(context);
    return SliverAppBar(
      forceElevated: false,
      expandedHeight: 250,
      elevation: 0,
      stretch: true,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: GreethyColor.mystic,
      actions: <Widget>[
        profileState.isbusy
            ? const SizedBox.shrink()

            /// pop up menu choice
            : PopupMenuButton<Choice>(
                onSelected: (d) {
                  if (d.title == "Share") {
                    shareProfile(context);
                  } else if (d.title == "QR code") {
                    // Navigator.push(context, ScanScreen.getRoute(profileState.profileUserModel));
                  }
                },
                itemBuilder: (BuildContext context) {
                  return choices.map((Choice choice) {
                    return PopupMenuItem<Choice>(
                      value: choice,
                      child: Text(
                        choice.title,
                        style: TextStyles.textStyle14.copyWith(
                          color: choice.isEnable ? AppColor.secondary : AppColor.lightGrey,
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
        background: profileState.isbusy
            ? const SizedBox.shrink()
            : Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  SizedBox.expand(
                    child: Container(
                      // padding: const EdgeInsets.only(top: 50),
                      height: 30,
                      color: Colors.transparent,
                    ),
                  ),

                  /// banner img
                  Container(
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: profileState.profileUserModel.bannerImage != null
                            ? CacheImage(
                                path: profileState.profileUserModel.bannerImage,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/banner_default.jpg",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),

                  /// avatar
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 5),
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: GreethyColor.kawa_green,
                                    width: 4.0,
                                  ), // Inner green border
                                  shape: BoxShape.circle,
                                ),
                                child: RippleButton(
                                  child: CircularImage(
                                    path: profileState.profileUserModel.avatar,
                                    height: 150,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      ProfileImageView.getRoute(profileState.profileUserModel.avatar!),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/CreateFeedPage');
      },
      child: customIcon(
        context,
        icon: AppIcon.fabTweet,
        isTwitterIcon: true,
        iconColor: Theme.of(context).colorScheme.onPrimary,
        size: 25,
      ),
    );
  }

  Widget _emptyBox() {
    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }

  bool isFollower() {
    var profileState = Provider.of<ProfileState>(context, listen: false);
    // if (profileState.profileUserModel.followersList != null && profileState.profileUserModel.followersList!.isNotEmpty) {
    //   return (profileState.profileUserModel.followersList!.any((x) => x == profileState.userId));
    // } else {
    return false;
    // }
  }

  /// This method called when user pressed back button
  /// When profile page is about to close
  /// Maintain minimum user's profile in profile page list
  Future<bool> _onWillPop() async {
    return true;
  }

  late TabController _tabController;

  void shareProfile(BuildContext context) async {
    var profileState = context.read<ProfileState>();
    var user = profileState.profileUserModel;
    // Utility.createLinkAndShare(
    //   context,
    //   "profilePage/${widget.profileId}/",
    //   socialMetaTagParameters: SocialMetaTagParameters(
    //     description: !user.bio!.contains("Edit profile") ? user.bio : "Checkout ${user.displayName}'s profile on Fwitter app",
    //     title: "${user.displayName} is on Fwitter app",
    //     imageUrl: Uri.parse(user.profilePic!),
    //   ),
    // );
  }

  @override
  build(BuildContext context) {
    // var state = Provider.of<FeedState>(context);
    var profileState = Provider.of<ProfileState>(context);
    // List<FeedModel>? list;
    String id = widget.profileId;

    /// Filter user's tweet among all tweets available in home page tweets list
    // if (state.feedList != null && state.feedList!.isNotEmpty) {
    //   list = state.feedList!.where((x) => x.userId == id).toList();
    // }
    return Scaffold(
      // backgroundColor: Colors.transparent,
      key: scaffoldKey,
      floatingActionButton: !isMyProfile ? null : _floatingActionButton(),
      backgroundColor: GreethyColor.mystic,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            /// app bar - avatar - banner img
            getAppbar(),

            /// profile User - name follower
            profileState.isbusy
                ? _emptyBox()
                : SliverToBoxAdapter(
                    child: Container(
                      // color: Colors.white,
                      child: profileState.isbusy
                          ? const SizedBox.shrink()
                          : UserNameRowWidget(
                              user: profileState.profileUserModel,
                              isMyProfile: isMyProfile,
                              networking: profileState.profileNetworking,
                            ),
                    ),
                  ),

            /// Tab bar
            // SliverList(
            //   delegate: SliverChildListDelegate(
            //     [
            //       Container(
            //         color: GreethyColor.white,
            //         child: RecomendsPlants(),
            //       ),
            //     ],
            //   ),
            // )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TitleWithAllBtn(
                title: "Trophy Challenger",
                press: () {},
              ),
              TrophyChallenger(),
              TitleWithAllBtn(
                title: "Clubs",
                press: () {},
              ),
              FeaturedTopClubs(),
              SizedBox(height: 20),
            ],
          ),
        ),

        // TabBarView(
        //   controller: _tabController,
        //   children: [
        //     /// Display all independent tweets list
        //     // _tweetList(context, profileState, list, false, false),
        //     //
        //     // /// Display all reply tweet list
        //     // _tweetList(context, profileState, list, true, false),
        //     //
        //     // /// Display all reply and comments tweet list
        //     // _tweetList(context, profileState, list, false, true)
        //   ],
        // ),
      ),
    );
  }

// Widget _tweetList(BuildContext context, ProfileState profileState, List<FeedModel>? tweetsList, bool isReply, bool isMedia) {
//   List<FeedModel>? list;
//
//   /// If user hasn't tweeted yet
//   if (tweetsList == null) {
//     // cprint('No Tweet available');
//   } else if (isMedia) {
//     /// Display all Tweets with media file
//
//     list = tweetsList.where((x) => x.imagePath != null).toList();
//   } else if (!isReply) {
//     /// Display all independent Tweets
//     /// No comments Tweet will display
//
//     list = tweetsList.where((x) => x.parentkey == null || x.childRetwetkey != null).toList();
//   } else {
//     /// Display all reply Tweets
//     /// No independent tweet will display
//     list = tweetsList.where((x) => x.parentkey != null && x.childRetwetkey == null).toList();
//   }
//
//   /// if [profileState.isbusy] is true then an loading indicator will be displayed on screen.
//   return profileState.isbusy
//       ? SizedBox(
//           height: context.height - 180,
//           child: const CustomScreenLoader(
//             height: double.infinity,
//             width: double.infinity,
//             backgroundColor: Colors.white,
//           ),
//         )
//
//       /// if tweet list is empty or null then need to show user a message
//       : list == null || list.isEmpty
//           ? Container(
//               padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
//               child: NotifyText(
//                 title: isMyProfile
//                     ? 'You haven\'t ${isReply ? 'reply to any Tweet' : isMedia ? 'post any media Tweet yet' : 'post any Tweet yet'}'
//                     : '${profileState.profileUserModel.userName} hasn\'t ${isReply ? 'reply to any Tweet' : isMedia ? 'post any media Tweet yet' : 'post any Tweet yet'}',
//                 subTitle: isMyProfile ? 'Tap tweet button to add new' : 'Once he\'ll do, they will be shown up here',
//               ),
//             )
//
//           /// If tweets available then tweet list will displayed
//           : ListView.builder(
//               padding: const EdgeInsets.symmetric(vertical: 0),
//               itemCount: list.length,
//               itemBuilder: (context, index) => Container(
//                 color: TwitterColor.white,
//                 child: Tweet(
//                   model: list![index],
//                   isDisplayOnProfile: true,
//                   trailing: TweetBottomSheet().tweetOptionIcon(
//                     context,
//                     model: list[index],
//                     type: TweetType.Tweet,
//                     scaffoldKey: scaffoldKey,
//                   ),
//                   scaffoldKey: scaffoldKey,
//                 ),
//               ),
//             );
// }
}

class Choice {
  const Choice({required this.title, required this.icon, this.isEnable = false});

  final bool isEnable;
  final IconData icon;
  final String title;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Share', icon: Icons.directions_car, isEnable: true),
  Choice(title: 'QR code', icon: Icons.directions_railway, isEnable: true),
  Choice(title: 'Draft', icon: Icons.directions_bike),
  Choice(title: 'View Lists', icon: Icons.directions_boat),
  Choice(title: 'View Moments', icon: Icons.directions_bus),
];
