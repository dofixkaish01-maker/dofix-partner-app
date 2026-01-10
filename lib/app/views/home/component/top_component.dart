import 'dart:math';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopComponent extends StatefulWidget {
  const TopComponent({
    super.key,
  });

  @override
  _TopComponentState createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent> {
  @override
  Widget build(BuildContext context) {
    hideLoading();
    return GetBuilder<DashBoardController>(builder: (controller) {
      final pendingBookings = (controller.bookingModel.data ?? [])
          .where((b) => b.bookingStatus == "accepted")
          .toList();
      debugPrint(
          "TopComponent: ${controller.providerModel.content?.avgRating}");
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 5),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50.0,
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Apni performance dekhein",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.find<DashBoardController>().getReviews();
                        },
                        child: Text(
                          "SeeAll",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              RatingGauge(
                rating: double.parse(
                    (controller.providerModel.content?.avgRating ?? 0)
                        .toString()),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE9F2F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: controller.bookingCountResponse
                                          .content?.bookingsCount?.completed
                                          .toString(),
                                      style: TextStyle(
                                        color: const Color(0xFF207FA7),
                                        fontSize: 30,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w800,
                                        height: 1.40,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '/${controller.bookingCountResponse.content?.bookingsCount?.total.toString() == "null" ? "0" : controller.bookingCountResponse.content?.bookingsCount?.total.toString()}',
                                      style: TextStyle(
                                        color: const Color(0xFF207FA7),
                                        fontSize: 16,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w800,
                                        height: 1.40,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Jobs Delivered',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF212121),
                                  fontSize: 14,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 1.40,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE9F2F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: controller.bookingCountResponse
                                          .content?.bookingsCount?.canceled
                                          .toString(),
                                      style: TextStyle(
                                        color: const Color(0xFF207FA7),
                                        fontSize: 30,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w800,
                                        height: 1.40,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '/${controller.bookingCountResponse.content?.bookingsCount?.total.toString() == "null" ? "0" : controller.bookingCountResponse.content?.bookingsCount?.total.toString()}',
                                      style: TextStyle(
                                        color: const Color(0xFF207FA7),
                                        fontSize: 16,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w800,
                                        height: 1.40,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Jobs Cancelled',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF212121),
                                  fontSize: 14,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 1.40,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Visibility(
                visible: pendingBookings.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aaj ke ${pendingBookings.length ?? 0} kaam pending hai',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFC61414),
                        fontSize: 14,
                        fontFamily: 'Albert Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class RatingGauge extends StatelessWidget {
  final double rating; // Rating value (e.g., 4.5)
  final double maxRating; // Maximum rating (e.g., 5.0)
  final double strokeWidth;

  const RatingGauge({
    Key? key,
    required this.rating,
    this.maxRating = 5.0,
    this.strokeWidth = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(150, 150),
            painter: GaugePainter(
              rating,
              maxRating,
              strokeWidth,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Rating", style: TextStyle(fontSize: 14)),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double rating;
  final double maxRating;
  final double strokeWidth;

  GaugePainter(this.rating, this.maxRating, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.5;

    final startAngle = pi; // Left side (180 degrees)
    final sweepAngle = pi; // Semi-circle (180 degrees)

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = primaryAppColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    double progressAngle = (rating / maxRating) * sweepAngle;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
