import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double dashSpacing;
  final double height;

  const DashedLine({
    Key? key,
    this.strokeWidth = 1.5,
    this.color = const Color.fromARGB(255, 204, 204, 204),
    this.dashLength = 10.0,
    this.dashSpacing = 5.0,
    this.height = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 1.0,
        child: CustomPaint(
          painter: _DashedLinePainter(
            strokeWidth: strokeWidth,
            color: color,
            dashLength: dashLength,
            dashSpacing: dashSpacing,
          ),
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double dashSpacing;

  _DashedLinePainter({
    required this.strokeWidth,
    required this.color,
    required this.dashLength,
    required this.dashSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final space = dashLength + dashSpacing;

    double startX = 0;
    while (startX < size.width) {
      final endX = startX + dashLength;
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(endX, size.height / 2), paint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        dashLength != oldDelegate.dashLength ||
        dashSpacing != oldDelegate.dashSpacing;
  }
}
