import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/ui/page/character/character_screen.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

import '../custom_drawer/drawer_user_controller.dart';
import '../custom_drawer/home_drawer.dart';
import 'feedback_screen.dart';
import 'help_screen.dart';
import 'invite_friend_screen.dart';

class NavigationApp extends StatefulWidget {
  @override
  _NavigationAppState createState() => _NavigationAppState();
}

// todo kế thừa cho việc đọc bình luận của bài viết
class _NavigationAppState extends State<NavigationApp> {
  Widget? screenView;
  DrawerIndex? drawerIndex;
  bool isFirstTime = false;

  @override
  void initState() {
    print("start NavigationHomeScreen");
    drawerIndex = DrawerIndex.HOME;
    screenView = CharacterScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const CharacterScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        default:
          break;
      }
    }
  }
}
