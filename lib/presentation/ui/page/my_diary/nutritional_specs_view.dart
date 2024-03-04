import 'package:flutter/material.dart';
import 'package:greethy_application/main.dart';
import 'package:greethy_application/presentation/ui/page/my_diary/widget/information_circle_card.dart';
import 'package:greethy_application/presentation/ui/page/my_diary/widget/information_horizontal_card.dart';
import 'package:greethy_application/presentation/ui/page/my_diary/widget/information_vertical_card.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class NutritionalSpecsView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const NutritionalSpecsView({Key? key, this.animationController, this.animation}) : super(key: key);

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
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            /// vertical information column
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                              child: Column(
                                children: <Widget>[
                                  SmallInformationCardWidget(
                                    image: Image.asset("assets/fitness_app/eaten.png"),
                                    title: 'Eaten',
                                    unit_type: 'Kcal',
                                    value: '100',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SmallInformationCardWidget(
                                    image: Image.asset("assets/fitness_app/burned.png"),
                                    title: 'Burned',
                                    unit_type: 'Kcal',
                                    value: '200',
                                    color: HexColor('#F56E98'),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// information circle
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: InformationCircle(
                              text: 'Kcal left',
                              value: '100',
                              percent: 60,
                            ),
                          )
                        ],
                      ),
                    ),

                    /// segment line
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),

                    /// horizontal row of information
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: VerticalInfoBar(
                              title: 'Carbs',
                              progressValue: 50,
                              left: '12g left',
                            ),
                          ),
                          Expanded(
                            child: VerticalInfoBar(
                              title: 'Fat',
                              progressValue: 50,
                              left: '10g left',
                              color: HexColor('#F1B440'),
                            ),
                          ),
                          Expanded(
                            child: VerticalInfoBar(
                              title: 'Protein',
                              progressValue: 50,
                              left: '30g left',
                              color: HexColor('#F56E98'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
