import 'package:flutter/cupertino.dart';
import 'package:greethy_application/ui/theme/theme.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    required this.text,
    this.lineColor = GreethyColor.kawa_green,
  }) : super();

  final String text;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0 / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 20.0 / 4),
              height: 7,
              color: lineColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
