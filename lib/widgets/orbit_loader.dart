import 'dart:math' as math;
import 'package:flutter/material.dart';

class AppLoaderColors {
  static const Color primary = Color(0xFF207FA7);
  static const Color textDark = Color(0xFF1F2937);
}

class OrbitLoader extends StatefulWidget {
  final double size;
  final Color color;
  final String? text;
  final bool showCard;

  const OrbitLoader({
    super.key,
    this.size = 60,
    this.color = AppLoaderColors.primary,
    this.text,
    this.showCard = false,
  });

  @override
  State<OrbitLoader> createState() => _OrbitLoaderState();
}

class _OrbitLoaderState extends State<OrbitLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildLoader() {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size.square(widget.size),
            painter: _OrbitLoaderPainter(
              progress: _controller.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLoader(),
        if (widget.text != null) ...[
          const SizedBox(height: 14),
          Text(
            widget.text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppLoaderColors.textDark,
            ),
          ),
        ],
      ],
    );

    if (!widget.showCard) return content;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: content,
    );
  }
}

class _OrbitLoaderPainter extends CustomPainter {
  final double progress;
  final Color color;

  _OrbitLoaderPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final orbitRadius = size.width * 0.28;
    final baseDotRadius = size.width * 0.08;

    final ringPaint = Paint()
      ..color = color.withOpacity(0.10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03;

    canvas.drawCircle(center, orbitRadius, ringPaint);

    final angles = [
      (progress * 2 * math.pi),
      (progress * 2 * math.pi) + (2 * math.pi / 3),
      (progress * 2 * math.pi) + (4 * math.pi / 3),
    ];

    for (int i = 0; i < angles.length; i++) {
      final angle = angles[i];
      final x = center.dx + orbitRadius * math.cos(angle);
      final y = center.dy + orbitRadius * math.sin(angle);

      final pulse = 0.75 + 0.25 * math.sin((progress * 2 * math.pi) + i);
      final dotRadius = baseDotRadius * pulse;

      final paint = Paint()
        ..color = i == 0
            ? color
            : color.withOpacity(0.35 + (0.15 * i));

      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }

    final centerPaint = Paint()
      ..color = color.withOpacity(0.10)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, size.width * 0.10, centerPaint);
  }

  @override
  bool shouldRepaint(covariant _OrbitLoaderPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}



// import 'dart:math' as math;
// import 'package:flutter/material.dart';
//
// class AppLoaderColors {
//   static const Color primary = Color(0xFF207FA7);
//   static const Color primaryLight = Color(0xFF5DA9C8);
//   static const Color primaryExtraLight = Color(0xFFD9EDF5);
//   static const Color textDark = Color(0xFF1F2937);
//   static const Color textLight = Color(0xFF6B7280);
// }
//
// class SmoothCustomLoader extends StatefulWidget {
//   final double size;
//   final Color color;
//   final String? text;
//   final bool showCard;
//   final double strokeWidth;
//
//   const SmoothCustomLoader({
//     super.key,
//     this.size = 56,
//     this.color = AppLoaderColors.primary,
//     this.text,
//     this.showCard = false,
//     this.strokeWidth = 4,
//   });
//
//   @override
//   State<SmoothCustomLoader> createState() => _SmoothCustomLoaderState();
// }
//
// class _SmoothCustomLoaderState extends State<SmoothCustomLoader>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//
//   late final Animation<double> _rotation;
//   late final Animation<double> _scale;
//   late final Animation<double> _innerPulse;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1400),
//     )..repeat();
//
//     _rotation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.linear),
//     );
//
//     _scale = TweenSequence<double>([
//       TweenSequenceItem(
//         tween: Tween(begin: 0.96, end: 1.0)
//             .chain(CurveTween(curve: Curves.easeOut)),
//         weight: 50,
//       ),
//       TweenSequenceItem(
//         tween: Tween(begin: 1.0, end: 0.96)
//             .chain(CurveTween(curve: Curves.easeIn)),
//         weight: 50,
//       ),
//     ]).animate(_controller);
//
//     _innerPulse = TweenSequence<double>([
//       TweenSequenceItem(
//         tween: Tween(begin: 0.85, end: 1.0)
//             .chain(CurveTween(curve: Curves.easeOut)),
//         weight: 50,
//       ),
//       TweenSequenceItem(
//         tween: Tween(begin: 1.0, end: 0.85)
//             .chain(CurveTween(curve: Curves.easeIn)),
//         weight: 50,
//       ),
//     ]).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildAnimatedLoader() {
//     return RepaintBoundary(
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Transform.scale(
//             scale: _scale.value,
//             child: Transform.rotate(
//               angle: _rotation.value * 2 * math.pi,
//               child: CustomPaint(
//                 size: Size.square(widget.size),
//                 painter: _SmoothLoaderPainter(
//                   color: widget.color,
//                   strokeWidth: widget.strokeWidth,
//                   pulseValue: _innerPulse.value,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final content = Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         _buildAnimatedLoader(),
//         if (widget.text != null) ...[
//           const SizedBox(height: 14),
//           Text(
//             widget.text!,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: AppLoaderColors.textDark,
//             ),
//           ),
//         ],
//       ],
//     );
//
//     if (!widget.showCard) return content;
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 16,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: content,
//     );
//   }
// }
//
// class _SmoothLoaderPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//   final double pulseValue;
//
//   _SmoothLoaderPainter({
//     required this.color,
//     required this.strokeWidth,
//     required this.pulseValue,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = size.center(Offset.zero);
//     final outerRadius = size.width / 2;
//     final ringRadius = outerRadius - strokeWidth;
//
//     final bgPaint = Paint()
//       ..color = color.withOpacity(0.10)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//
//     final fgPaint = Paint()
//       ..shader = SweepGradient(
//         startAngle: 0,
//         endAngle: math.pi * 2,
//         colors: [
//           color.withOpacity(0.10),
//           color.withOpacity(0.35),
//           color,
//         ],
//         stops: const [0.15, 0.65, 1.0],
//       ).createShader(
//         Rect.fromCircle(center: center, radius: ringRadius),
//       )
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//
//     final dotPaint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;
//
//     final innerFillPaint = Paint()
//       ..color = color.withOpacity(0.08)
//       ..style = PaintingStyle.fill;
//
//     canvas.drawCircle(center, ringRadius, bgPaint);
//
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: ringRadius),
//       -math.pi / 2,
//       math.pi * 1.55,
//       false,
//       fgPaint,
//     );
//
//     canvas.drawCircle(
//       center,
//       size.width * 0.16 * pulseValue,
//       innerFillPaint,
//     );
//
//     final dotRadius = strokeWidth * 0.95;
//     final dotOffset = Offset(
//       center.dx,
//       center.dy - ringRadius,
//     );
//     canvas.drawCircle(dotOffset, dotRadius, dotPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant _SmoothLoaderPainter oldDelegate) {
//     return oldDelegate.color != color ||
//         oldDelegate.strokeWidth != strokeWidth ||
//         oldDelegate.pulseValue != pulseValue;
//   }
// }


// import 'dart:math' as math;
// import 'package:flutter/material.dart';
//
// class AppColors {
//   static const Color primary = Color(0xFF207FA7);
//   static const Color primaryLight = Color(0xFF5CA9C9);
//   static const Color background = Colors.white;
//   static const Color textDark = Color(0xFF1E293B);
//   static const Color textLight = Color(0xFF64748B);
// }
//
// class CustomLoader extends StatefulWidget {
//   final double size;
//   final double strokeWidth;
//   final Color color;
//   final String? text;
//   final bool showBackgroundCard;
//   final EdgeInsetsGeometry padding;
//
//   const CustomLoader({
//     super.key,
//     this.size = 52,
//     this.strokeWidth = 4,
//     this.color = AppColors.primary,
//     this.text,
//     this.showBackgroundCard = false,
//     this.padding = const EdgeInsets.all(16),
//   });
//
//   @override
//   State<CustomLoader> createState() => _CustomLoaderState();
// }
//
// class _CustomLoaderState extends State<CustomLoader>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1100),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildLoader() {
//     final loader = Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           height: widget.size,
//           width: widget.size,
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return Transform.rotate(
//                 angle: _controller.value * 2 * math.pi,
//                 child: CustomPaint(
//                   painter: _ArcLoaderPainter(
//                     color: widget.color,
//                     strokeWidth: widget.strokeWidth,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         if (widget.text != null) ...[
//           const SizedBox(height: 14),
//           Text(
//             widget.text!,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: AppColors.textDark,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ],
//     );
//
//     if (!widget.showBackgroundCard) {
//       return Padding(
//         padding: widget.padding,
//         child: loader,
//       );
//     }
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: loader,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildLoader();
//   }
// }
//
// class _ArcLoaderPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//
//   _ArcLoaderPainter({
//     required this.color,
//     required this.strokeWidth,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = size.center(Offset.zero);
//     final radius = (size.width / 2) - strokeWidth;
//
//     final bgPaint = Paint()
//       ..color = color.withOpacity(0.14)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//
//     final fgPaint = Paint()
//       ..shader = SweepGradient(
//         colors: [
//           color.withOpacity(0.15),
//           color.withOpacity(0.45),
//           color,
//         ],
//         stops: const [0.1, 0.6, 1.0],
//       ).createShader(
//         Rect.fromCircle(center: center, radius: radius),
//       )
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//
//     canvas.drawCircle(center, radius, bgPaint);
//
//     const startAngle = -math.pi / 2;
//     const sweepAngle = math.pi * 1.45;
//
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       sweepAngle,
//       false,
//       fgPaint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant _ArcLoaderPainter oldDelegate) {
//     return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
//   }
// }
