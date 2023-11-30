import 'package:flutter/widgets.dart';
import 'package:greethy_application/ui/page/design_course/home_design_course.dart';
import 'package:greethy_application/ui/page/hotel_booking/hotel_home_screen.dart';
import 'package:greethy_application/ui/page/introduction_animation/introduction_animation_screen.dart';

import '../ui/page/home_app/home_screen.dart';


class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
      navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
      navigateScreen: HomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/design_course/design_course.png',
      navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
