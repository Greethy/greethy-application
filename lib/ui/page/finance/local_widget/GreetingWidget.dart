import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    String greeting;

    if (currentHour < 12) {
      greeting = 'Good morning';
    } else if (currentHour < 18) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }

    return Text(
      greeting,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color.fromARGB(255, 224, 223, 223),
      ),
    );
  }
}