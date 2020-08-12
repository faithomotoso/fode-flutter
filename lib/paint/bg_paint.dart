import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BgPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    Paint paint = Paint();
    paint
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.84, 0);
    path.lineTo(size.width * 0.46, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.41, size.height * 0.8,
        size.width * 0.45, size.height * 0.9);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
