import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class CustomDividerView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final String text;

  const CustomDividerView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
    required this.text,
  }) : assert(dividerHeight != 0.0);

  @override
  _CustomDividerViewState createState() => _CustomDividerViewState();
}

class _CustomDividerViewState extends State<CustomDividerView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        height: widget.dividerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.color ?? GreethyColor.mossGreen,
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.0),
            bottom: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
