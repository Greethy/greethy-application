import 'package:flutter/material.dart';

class TitleWithAllBtn extends StatelessWidget {
  const TitleWithAllBtn({
    required this.title,
    required this.press,
  }) : super();

  final String title;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
          ElevatedButton(
            onPressed: press,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ), backgroundColor: Color(0xFF0C9869),
            ),
            child: Text(
              "All",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    required this.text,
  }) : super();

  final String text;

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 20.0 / 4),
              height: 7,
              color: Color(0xFF0C9869).withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
