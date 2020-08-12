import 'dart:math';

import 'package:flutter/material.dart';

class Arc extends CustomPainter {
  double percentage;

  Arc({@required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..blendMode = BlendMode.overlay;

    Offset center = Offset(size.height / 2, size.width / 2);
    double radius = min(size.height / 2, size.width / 2);

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + 0.3, arcAngle, false, paint);

    Path shadow = Path();
    shadow.moveTo(10, 10);
//    canvas.drawShadow(shadow.shift(Offset(2, 2)), Colors.orange, 4, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
