import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_image_view.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_page_top_club_scroll_view.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_page_trophy_scroll_view.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_page_user_detail_view.dart';
import 'package:provider/provider.dart';

import '../../../state/user/profile_screen_sate.dart';
import '../../../widgets/cache_image.dart';
import '../../../widgets/customWidgets.dart';
import '../../../widgets/newWidget/rippleButton.dart';
import 'local_widgets/circular_image.dart';
import 'local_widgets/title_with_all_btn.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.profileId}) : super(key: key);

  final String profileId;

  static MaterialPageRoute getRoute({required String profileId}) {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => ProfileScreenState(profileId),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ProfileScreenState(profileId),
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
      var profileState = Provider.of<ProfileScreenState>(context, listen: false);

      isMyProfile = profileState.isMyProfile;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  SliverAppBar getAppbar() {
    var profileState = Provider.of<ProfileScreenState>(context);
    return SliverAppBar(
      forceElevated: false,
      expandedHeight: 250,
      elevation: 0,
      stretch: true,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: GreethyColor.mystic,
      actions: <Widget>[
        /// pop up menu choice
        PopupMenuButton<Choice>(
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
        background: Stack(
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

  void shareProfile(BuildContext context) async {
    var profileState = context.read<ProfileScreenState>();
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
    var profileState = Provider.of<ProfileScreenState>(context);
    String id = widget.profileId;
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
            SliverToBoxAdapter(
              child: Container(
                  color: Colors.white,

                  child: UserNameRowWidget(
                      user: profileState.profileUserModel,
                      isMyProfile: isMyProfile,
                      networking: profileState.profileNetworking,
                    ),
                  ),
            ),
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
      ),
    );
  }
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
