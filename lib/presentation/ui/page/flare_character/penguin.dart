import 'dart:async';

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

class Penguin extends StatefulWidget {
  Penguin() : super();

  @override
  _PenguinState createState() => new _PenguinState();
}

class _PenguinState extends State<Penguin> with FlareController {
  double _rockAmount = 0.5;
  double _speed = 1.0;
  double _rockTime = 0.0;
  bool _isPaused = false;

  Timer? _longPressRockAmount;
  Timer? _longPressStartUpSpeed;

  late ActorAnimation _rock;

  @override
  void initialize(FlutterActorArtboard artboard) {
    _rock = artboard.getAnimation("music_walk")!;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _rockTime += elapsed * _speed;
    _rock.apply(_rockTime % _rock.duration, artboard, _rockAmount);
    return true;
  }

  void _startUpRockAmount() {
    print("start");
    _longPressRockAmount = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _rockAmount += 0.05;
        print("_rockAmount: $_rockAmount");
        if (_rockAmount >= 2.0) {
          _rockAmount = 2.0;
          _longPressRockAmount?.cancel();
        }
      });
    });
  }

  void _startDownRockAmount() {
    print("start");
    _longPressRockAmount = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _rockAmount -= 0.05;
        print("_rockAmount: $_rockAmount");
        if (_rockAmount <= 0.0) {
          _rockAmount = 0.0;
          _longPressRockAmount?.cancel();
        }
      });
    });
  }

  void _stopRockAmount() {
    _longPressRockAmount?.cancel();
  }

  void _startUpSpeed() {
    print("start");
    _longPressStartUpSpeed = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _speed += 0.1;
        print("_speed: $_speed");
        if (_speed >= 4.0) {
          _speed = 4.0;
          _longPressStartUpSpeed?.cancel();
        }
      });
    });
  }

  void _startDownSpeed() {
    print("start");
    _longPressStartUpSpeed = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _speed -= 0.1;
        print("_speed: $_speed");
        if (_speed <= 0.2) {
          _speed = 0.2;
          _longPressStartUpSpeed?.cancel();
        }
      });
    });
  }

  void _stopSpeed() {
    _longPressStartUpSpeed?.cancel();
  }

  @override
  void dispose() {
    _longPressStartUpSpeed?.cancel();
    _longPressRockAmount?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width_character = MediaQuery.of(context).size.width * 2 / 3;
    double height_character = MediaQuery.of(context).size.height / 3;
    double width_sensor = width_character / 3;
    double height_sensor = height_character / 3;
    return Stack(
      children: [
        Positioned(
          child: Center(
            child: Container(
              width: width_character,
              height: height_character,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: FlareActor(
                      "assets/penguin/Penguin.flr",
                      alignment: Alignment.center,
                      isPaused: _isPaused,
                      fit: BoxFit.cover,
                      animation: "walk",
                      controller: this,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      child: GestureDetector(
                        onLongPressStart: (_) {
                          print("onLongPressStart");
                          _startDownSpeed();
                        },
                        onLongPressEnd: (_) {
                          print("onLongPressEnd");
                          _stopSpeed();
                        },
                        // child: Center(child: Text("1")),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: width_sensor,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      child: GestureDetector(
                        onTap: () {
                          print("onTap");
                          setState(() {
                            _speed = 1.0;
                          });
                        },
                        // child: Center(child: Text("2")),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      child: GestureDetector(
                        onLongPressStart: (_) {
                          print("onLongPressStart");
                          _startUpSpeed();
                        },
                        onLongPressEnd: (_) {
                          print("onLongPressEnd");
                          _stopSpeed();
                        },
                        // child: Center(child: Text("3")),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height_sensor,
                    left: 0,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      // child: Center(
                      //   child: Text("4"),
                      // ),
                    ),
                  ),
                  Positioned(
                    top: height_sensor,
                    left: width_sensor,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPaused = !_isPaused;
                          });
                        },
                        // child: Center(child: Text("5")),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height_sensor,
                    right: 0,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      // child: Center(
                      //   child: Text("6"),
                      // ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      child: GestureDetector(
                        onLongPressStart: (_) {
                          print("onLongPressStart");
                          _startDownRockAmount();
                        },
                        onLongPressEnd: (_) {
                          print("onLongPressEnd");
                          _stopRockAmount();
                        },
                        // child: Center(child: Text("7")),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: width_sensor,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _rockAmount = 0.5;
                            });
                          },
                          // child: Center(child: Text("8")),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: height_sensor,
                      width: width_sensor,
                      child: GestureDetector(
                        onLongPressStart: (_) {
                          print("onLongPressStart");
                          _startUpRockAmount();
                        },
                        onLongPressEnd: (_) {
                          print("onLongPressEnd");
                          _stopRockAmount();
                        },
                        // child: Center(child: Text("9")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget operationSensor(Alignment alignment, String label) {
    return Positioned(
      child: InkWell(
        onTap: () {
          print(label);
          setState(() {
            _isPaused = !_isPaused;
          });
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Container(
              color: Colors.black,
              // child: Padding(
              //   // padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
