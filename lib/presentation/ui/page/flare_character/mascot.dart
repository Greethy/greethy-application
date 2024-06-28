import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Mascot extends StatefulWidget {
  const Mascot({super.key});

  @override
  State<Mascot> createState() => _MascotState();
}

class _MascotState extends State<Mascot> {
  late StateMachineController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.25,
      child: RiveAnimation.asset(
        'assets/cat.riv',
        fit: BoxFit.cover,
        artboard: 'main',
        onInit: _onRiveInit,
      ),
    );
  }

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'main');
    artboard.addController(controller!);
  }
}
