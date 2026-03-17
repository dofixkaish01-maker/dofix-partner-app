import 'package:flutter/material.dart';
import 'orbit_loader.dart';

class ButtonLoader extends StatelessWidget {
  final double size;
  final Color color;

  const ButtonLoader({
    super.key,
    this.size = 20,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        builder: (context, value, child) {
          return Transform.rotate(
            angle: value * 6.28,
            child: CustomPaint(
              painter: _MiniLoaderPainter(color: color),
            ),
          );
        },
        onEnd: () {},
      ),
    );
  }
}

class _MiniLoaderPainter extends CustomPainter {
  final Color color;

  _MiniLoaderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width * 0.12;
    final radius = (size.width / 2) - strokeWidth;

    final paintBg = Paint()
      ..color = color.withOpacity(0.20)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final paintFg = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(size.center(Offset.zero), radius, paintBg);
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      -1.57,
      3.7,
      false,
      paintFg,
    );
  }

  @override
  bool shouldRepaint(covariant _MiniLoaderPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}