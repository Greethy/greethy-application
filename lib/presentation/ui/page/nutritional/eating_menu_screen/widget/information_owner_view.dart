import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/eating_menu_screen_state.dart';
import 'package:greethy_application/presentation/state/nutrition_home_screen_state.dart';

import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/profile/local_widgets/circular_image.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_image_view.dart';
import 'package:greethy_application/presentation/widgets/newWidget/rippleButton.dart';

class InformationOwner extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final EatingMenuScreenState state;

  const InformationOwner({
    Key? key,
    this.animationController,
    this.animation,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform: Matrix4.translationValues(0.0, 30 * (1.0 - animation!.value), 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.eatingPlan?.eatingPlanName ?? "",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: GreethyColor.kawa_green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      state.eatingPlan!.bio!,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        letterSpacing: 0.5,
                        color: AppTheme.lightText,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Avatar
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: GreethyColor.kawa_green,
                                width: 2.0,
                              ), // Inner green border
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 5.0),
                                  shape: BoxShape.circle,
                                ),
                                child: RippleButton(
                                  child: CircularImage(
                                    path: state.eatingPlan!.owner!.avatar!,
                                    height: 45,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      ProfileImageView.getRoute(state.eatingPlan!.owner!.id!),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        // Tên người sở hữu
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.eatingPlan!.owner!.name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                  letterSpacing: 0.5,
                                  color: GreethyColor.kawa_green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    // Dòng chứa nút "Tùy chỉnh" và "Cài đặt"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Nút Tùy chỉnh
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.blue, width: 2.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Xử lý khi nhấn nút Tùy chỉnh
                                print("Nhấn nút Tùy chỉnh");
                              },
                              child: Text(
                                'Tùy chỉnh',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0), // Khoảng cách giữa các nút
                        // Nút Cài đặt
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.blue, width: 2.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Xử lý khi nhấn nút Cài đặt
                                print("Nhấn nút Cài đặt");
                              },
                              child: Text(
                                'Cài đặt',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
