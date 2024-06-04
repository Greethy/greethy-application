import 'package:flutter/material.dart';

class CustomDividerView extends StatelessWidget {
  final double dividerHeight;
  final Color? color;
  final String? text;

  const CustomDividerView({
    super.key,
    this.dividerHeight = 15.0,
    this.color,
    this.text,
  }) : assert(dividerHeight != 0.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dividerHeight,
      width: double.infinity,
      color: color ?? Colors.grey[200],
      child: text == null
          ? SizedBox.shrink()
          : Center(
              child: Text(textAlign: TextAlign.center, text!),
            ),
    );
  }
}
