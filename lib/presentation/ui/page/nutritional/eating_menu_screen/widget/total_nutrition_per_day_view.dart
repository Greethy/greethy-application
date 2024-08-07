import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/eating_menu_screen_state.dart';

class TotalNutritionPerDay extends StatelessWidget {
  final String titleTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final EatingMenuScreenState state;

  const TotalNutritionPerDay({
    Key? key,
    this.titleTxt = "",
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
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Năng lượng cần thiết:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '2.405,1 Kcal',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Năng lượng thực đơn hiện tại:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${state.bmrPerDay} Kcal',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
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
