import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class CustomDividerFoodView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final String text;

  const CustomDividerFoodView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
    required this.text,
  }) : assert(dividerHeight != 0.0);

  @override
  _CustomDividerFoodViewState createState() => _CustomDividerFoodViewState();
}

class _CustomDividerFoodViewState extends State<CustomDividerFoodView> {
  bool _click = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.dividerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.color ?? GreethyColor.mossGreen,
            border: Border(
              top: BorderSide(color: Colors.grey, width: 1.0),
              bottom: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle,
                    size: 25.0,
                    color: GreethyColor.pakistanGreen,
                  ),
                ],
              ),
            ),
            onTap: () {
              print("press late");
              setState(() {
                _click = !_click;
              });
            },
          ),
        ),
      ],
    );
  }
}
