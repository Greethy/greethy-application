import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(this.error, {Key? key}) : super(key: key);

  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text('Somthing went wrong'),
      ],
    );
  }
}
