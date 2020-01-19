
import 'package:flutter/material.dart';

class OutlinePainter extends CustomPainter {
  OutlinePainter({
    @required this.path,
    @required this.color,
    @required this.offset,
  }) :
    assert(path != null, 'path is required'),
    assert(color != null, 'color is required'),
    assert(offset != null, 'offset is required');

  final Path path;
  final Color color;
  final double offset;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      path.shift(Offset(offset, offset)),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );
  }

  @override
  bool shouldRepaint(OutlinePainter oldDelegate) => oldDelegate.path != path;
}