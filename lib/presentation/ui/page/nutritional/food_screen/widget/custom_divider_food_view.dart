import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/food_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class CustomDividerFoodView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final FoodScreenState state;

  const CustomDividerFoodView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
    required this.state,
  }) : assert(dividerHeight != 0.0);

  @override
  _CustomDividerFoodViewState createState() => _CustomDividerFoodViewState();
}

class _CustomDividerFoodViewState extends State<CustomDividerFoodView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.color ?? GreethyColor.kawa_green,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 1.0),
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Text(
            widget.state.food?.foodName ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
