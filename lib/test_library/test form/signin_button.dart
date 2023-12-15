import 'package:flutter/material.dart';
import 'package:greethy_application/test_library/test%20form/theme.dart';

typedef PressCallback = void Function();

class SigninButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final PressCallback onPressed;

  const SigninButton({
    required this.child,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius),
          gradient: const LinearGradient(
            colors: buttonBackground,
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
