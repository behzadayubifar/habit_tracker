import 'dart:math';

import 'package:flutter/material.dart';

class TaskCompletionRing extends StatelessWidget {
  final double progress;

  const TaskCompletionRing({super.key, required this.progress});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
          painter: RingPainter(
              progress: progress,
              taskNotCompletedColor: Colors.black87,
              taskCompletedColor: Color.fromARGB(255, 253, 208, 158)),
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;
  final Color taskNotCompletedColor;
  final Color taskCompletedColor;

  RingPainter(
      {super.repaint,
      required this.progress,
      required this.taskNotCompletedColor,
      required this.taskCompletedColor});
  @override
  void paint(Canvas canvas, Size size) {
    final notCompleted = progress < 1.0;
    final strokeWidth = size.width / 15;
    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        notCompleted ? (size.width - strokeWidth) / 2 : size.width / 2;
    if (notCompleted) {
      final backgroundPaint = Paint()
        ..isAntiAlias = true
        ..strokeWidth = strokeWidth
        ..color = taskNotCompletedColor
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }

    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = notCompleted ? PaintingStyle.stroke : PaintingStyle.fill;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi * progress, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
