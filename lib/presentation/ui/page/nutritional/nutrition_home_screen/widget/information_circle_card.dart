import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:greethy_application/presentation/theme/theme.dart';

class InformationCircle extends StatelessWidget {
  final List<Color> colors;
  final String value;
  final String text;
  final int percent;

  const InformationCircle({
    Key? key,
    this.colors = const [AppTheme.nearlyDarkBlue, Color(0xff8A98E8), Color(0xff8A98E8)],
    required this.text,
    required this.value, required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                border: new Border.all(
                  width: 4,
                  color: AppTheme.nearlyDarkBlue.withOpacity(0.2),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                      letterSpacing: 0.0,
                      color: AppTheme.nearlyDarkBlue,
                    ),
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 0.0,
                      color: AppTheme.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomPaint(
              painter: CurvePainter(
                colors: colors,
                angle: percent * 3.6,
              ),
              child: SizedBox(
                width: 108,
                height: 108,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius = math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
      new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
      degreeToRadians(278),
      degreeToRadians(360 - (365 - angle!)),
      false,
      shdowPaint,
    );

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
      new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
      degreeToRadians(278),
      degreeToRadians(360 - (365 - angle!)),
      false,
      shdowPaint,
    );

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
      new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
      degreeToRadians(278),
      degreeToRadians(360 - (365 - angle!)),
      false,
      shdowPaint,
    );

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
      new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
      degreeToRadians(278),
      degreeToRadians(360 - (365 - angle!)),
      false,
      shdowPaint,
    );

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
      new Rect.fromCircle(center: center, radius: radius),
      degreeToRadians(278),
      degreeToRadians(360 - (365 - angle!)),
      false,
      paint,
    );

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}

