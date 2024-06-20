import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MaterialApp(
      home: RiveDemo()
  ));
}
class RiveDemo extends StatefulWidget {
  const RiveDemo({super.key});

  @override
  State<RiveDemo> createState() => _RiveDemoState();
}

class _RiveDemoState extends State<RiveDemo> {
  late StateMachineController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RiveAnimation.asset(
          'assets/cat.riv',
          fit: BoxFit.cover,
          artboard: 'main',
          onInit: _onRiveInit
      ),

    );
  }
  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'main');
    artboard.addController(controller!);
  }
}