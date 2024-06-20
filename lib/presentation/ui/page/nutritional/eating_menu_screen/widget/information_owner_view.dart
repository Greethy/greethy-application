import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/eating_menu_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/customize_menu_options/custom_menu_options_screen.dart';
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
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: GreethyColor.kawa_green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 20),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "THỰC ĐƠN",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            state.eatingPlan?.eatingPlanName ?? "",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          state.eatingPlan!.bio!,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18.0,
                            letterSpacing: 0.5,
                            color: GreethyColor.kawa_green,
                          ),
                        ),
                        SizedBox(height: 25),
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
                                      border: Border.all(color: Colors.white, width: 1.0),
                                      shape: BoxShape.circle,
                                    ),
                                    child: RippleButton(
                                      child: CircularImage(
                                        path: state.eatingPlan!.owner!.avatar!,
                                        height: 50,
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
                            // owner name
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
                                  Text(
                                    "Khởi tạo: " + state.eatingPlan!.createDate!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16.0,
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
                        // Setting button and Customize button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Customize button
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: GreethyColor.kawa_green,
                                    width: 2.0,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CustomMenuOptionsScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Tùy chỉnh',
                                    style: TextStyle(
                                      color: GreethyColor.kawa_green,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            // Setting button
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: GreethyColor.kawa_green,
                                    width: 2.0,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    print("Nhấn nút Cài đặt");
                                  },
                                  child: Text(
                                    'Cài đặt',
                                    style: TextStyle(
                                      color: GreethyColor.kawa_green,
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
                ],
              )),
        );
      },
    );
  }
}
