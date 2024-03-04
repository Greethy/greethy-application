import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../profile/profile_page.dart';
import 'state/feed_viewmodel.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class BottomBar extends StatelessWidget {
  static const double NavigationIconSize = 20.0;
  static const double CreateButtonWidth = 38.0;

  // BottomBar({Key? key}) : super(key: key);

  FeedViewModel _feedViewModel = GetIt.instance<FeedViewModel>();
  final BuildContext context;

  BottomBar({Key? key, required this.context}) : super(key: key);

  Widget get customCreateIcon => Container(
        width: 45.0,
        height: 27.0,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              width: CreateButtonWidth,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              width: CreateButtonWidth,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            Center(
              child: Container(
                height: double.infinity,
                width: CreateButtonWidth,
                decoration: BoxDecoration(
                  // color: GetIt.instance<FeedViewModel>().actualScreen == 0 ? Colors.white : Colors.black,
                  color: _feedViewModel.actualScreen == 0 ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Icon(
                  Icons.add,
                  // color: GetIt.instance<FeedViewModel>().actualScreen == 0 ? Colors.black : Colors.white,

                  color: _feedViewModel.actualScreen == 0 ? Colors.black : Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuButton('Plays', TikTokIcons.home, 0),
              menuButton('Search', TikTokIcons.search, 1),
              SizedBox(
                width: 15,
              ),
              customCreateIcon,
              SizedBox(
                width: 15,
              ),
              menuButton('Clubs', Icons.abc, 2),
              menuButton('Profile', TikTokIcons.profile, 3)
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 40 : 10,
          )
        ],
      ),
    );
  }

  Widget menuButton(String text, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 3) {
          Navigator.push(context, ProfilePage.getRoute(profileId: "1"));
        }
        _feedViewModel.setActualScreen(index);
      },
      child: Container(
        height: 45,
        width: 70,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: _feedViewModel.actualScreen == 0
                    ? _feedViewModel.actualScreen == index
                        ? Colors.white
                        : Colors.white70
                    : _feedViewModel.actualScreen == index
                        ? Colors.black
                        : Colors.black54,
                size: NavigationIconSize,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: _feedViewModel.actualScreen == index ? FontWeight.bold : FontWeight.normal,
                  color: _feedViewModel.actualScreen == 0
                      ? _feedViewModel.actualScreen == index
                          ? Colors.white
                          : Colors.white70
                      : _feedViewModel.actualScreen == index
                          ? Colors.black
                          : Colors.black54,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
