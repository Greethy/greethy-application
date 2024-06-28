import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/food_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class CustomDividerKcalTotalView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final FoodScreenState state;

  const CustomDividerKcalTotalView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
    required this.state,
  }) : assert(dividerHeight != 0.0);

  @override
  _CustomDividerKcalTotalViewState createState() => _CustomDividerKcalTotalViewState();
}

class _CustomDividerKcalTotalViewState extends State<CustomDividerKcalTotalView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 2, 25, 2),
      child: Container(
        height: widget.dividerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.color ?? GreethyColor.kawa_green,
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.0),
            bottom: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 2, 25, 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TỔNG DINH DƯỠNG",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.state.food!.totalCalories.toString() + "Kcal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
