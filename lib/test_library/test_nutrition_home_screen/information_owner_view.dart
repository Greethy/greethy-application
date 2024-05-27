import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition_home_screen_state.dart';

import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/profile/local_widgets/circular_image.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_image_view.dart';
import 'package:greethy_application/presentation/widgets/newWidget/rippleButton.dart';

class InformationOwner extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final NutritionHomeScreenState state;

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
          child: new Transform(
            transform: new Matrix4.translationValues(0.0, 30 * (1.0 - animation!.value), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: AnimatedContainer(
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
                                width: 1.0,
                              ), // Inner green border
                              shape: BoxShape.circle,
                            ),
                            child: RippleButton(
                              child: CircularImage(
                                path: state.eatingPlan!.owner!.avatar!,
                                height: 35,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  ProfileImageView.getRoute(
                                    state.eatingPlan!.owner!.id!
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.eatingPlan!.owner!.name!,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: GreethyColor.kawa_green,
                            ),
                          ),
                          Text(
                            state.eatingPlan!.bio!,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: AppTheme.lightText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      onTap: () {
                        print("mở setting plan page");
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              height: 38,
                              width: 26,
                              child: Icon(
                                Icons.settings,
                                color: AppTheme.darkText,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

          ),
        );
      },
    );
  }
}
