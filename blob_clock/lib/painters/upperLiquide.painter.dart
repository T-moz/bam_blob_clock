import 'package:blob_clock/digit.dart';
import 'package:flutter/material.dart';

class Upperliquide extends CustomPainter {
  Upperliquide({
    @required this.liquidSurface,
    @required this.color,
    @required this.backgroundColor,
    @required this.viewBox,
    this.clearCanvas = false,
  })  : 
        assert(liquidSurface != null, 'liquidSurface is required'),
        assert(color != null, 'color is required'),
        assert(backgroundColor != null, 'backgroundColor is required'),
        assert(viewBox != null, 'viewBox is required');

  final double liquidSurface;
  final Color color;
  final Color backgroundColor;
  final bool clearCanvas;
  final ViewBox viewBox;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final height = 0.05 * viewBox.height;
    path.moveTo(viewBox.width, 0.0);
    path.lineTo(viewBox.width, height);
    path.quadraticBezierTo(
      viewBox.width * 3 / 4,
      height - liquidSurface,
      viewBox.width / 2,
      height,
    );
    path.quadraticBezierTo(
      viewBox.width / 4,
      height + liquidSurface * 2/3,
      0.0,
      height,
    );
    path.lineTo(0.0, 0.0);

    path.close();

    canvas.drawPath(
        path, Paint()..color = clearCanvas ? backgroundColor : color);
  }

  @override
  bool shouldRepaint(Upperliquide oldDelegate) =>
      false;
}
