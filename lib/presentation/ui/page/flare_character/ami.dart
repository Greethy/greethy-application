import 'dart:async';
import 'package:flutter/material.dart';

class Ami extends StatefulWidget {
  Ami() : super();

  @override
  _AmiState createState() => new _AmiState();
}

class _AmiState extends State<Ami> {
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    loadGifFiles();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void loadGifFiles() async {
    setState(() {
      currentIndex = 0;
    });

    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        currentIndex = (currentIndex + 1) % 119;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.33,
        child: Center(
          child: Image.asset(
            "ami/gif/${currentIndex + 1}.gif",
            width: double.infinity, // Set width to fill the available space
            height: double.infinity, // Set height to fill the available space
            fit: BoxFit.contain, // Adjust the fit to ensure the image fits within the bounds
          ),
        ));
  }
}
