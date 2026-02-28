import 'dart:math';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopComponent extends StatefulWidget {
  const TopComponent({super.key});

  @override
  _TopComponentState createState() => _TopComponentState();
}

class _TopComponentState extends State<TopComponent> {
  @override
  Widget build(BuildContext context) {
    hideLoading();

    return GetBuilder<DashBoardController>(builder: (controller) {
      // final pendingBookings = (controller.bookingModel.data ?? [])
      //     .where((b) => b.bookingStatus == "accepted")
      //     .toList();

      debugPrint("TopComponent: ${controller.providerModel.content?.avgRating}");

      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black.withOpacity(0.06)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              /// HEADER
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: primaryAppColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.leaderboard_rounded,
                          color: primaryAppColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Apni performance dekhein",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),

                    /// SeeAll
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Get.find<DashBoardController>().getReviews();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Text(
                          "SeeAll",
                          style: TextStyle(
                            color: primaryAppColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// DIVIDER (subtle)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 1,
                  color: Colors.black.withOpacity(0.06),
                ),
              ),

              const SizedBox(height: 30),

              /// GAUGE + INFO ROW (more balanced)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Gauge
                    Expanded(
                      flex: 5,
                      child: RatingGauge(
                        rating: double.parse(
                          (controller.providerModel.content?.avgRating ?? 0)
                              .toString(),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// Quick summary (UI only)
                    // Expanded(
                    //   flex: 4,
                    //   child: Container(
                    //     padding: const EdgeInsets.all(12),
                    //     decoration: BoxDecoration(
                    //       color: primaryAppColor.withOpacity(0.06),
                    //       borderRadius: BorderRadius.circular(14),
                    //       border: Border.all(
                    //         color: primaryAppColor.withOpacity(0.14),
                    //       ),
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text(
                    //           "Overall",
                    //           style: TextStyle(
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w600,
                    //             color: Color(0xFF6B7280),
                    //             fontFamily: 'Albert Sans',
                    //           ),
                    //         ),
                    //         const SizedBox(height: 6),
                    //         Text(
                    //           "${double.parse((controller.providerModel.content?.avgRating ?? 0).toString()).toStringAsFixed(1)}/5",
                    //           style: const TextStyle(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w800,
                    //             color: primaryAppColor,
                    //             fontFamily: 'Albert Sans',
                    //             height: 1.0,
                    //           ),
                    //         ),
                    //         const SizedBox(height: 8),
                    //         Row(
                    //           children: const [
                    //             Icon(Icons.star_rounded,
                    //                 color: Colors.orange, size: 18),
                    //             SizedBox(width: 6),
                    //             Expanded(
                    //               child: Text(
                    //                 "Customer rating score",
                    //                 maxLines: 1,
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: TextStyle(
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.w600,
                    //                   color: Color(0xFF111827),
                    //                   fontFamily: 'Albert Sans',
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              /// STATS CARDS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: _StatTile(
                        icon: Icons.check_circle_rounded,
                        iconBg: Colors.green.withOpacity(0.10),
                        iconColor: Colors.green,
                        title: "Jobs Delivered",
                        // same logic, same data
                        primary: controller.bookingCountResponse.content
                            ?.bookingsCount?.completed
                            .toString(),
                        secondary:
                        '/${controller.bookingCountResponse.content?.bookingsCount?.total.toString() == "null" ? "0" : controller.bookingCountResponse.content?.bookingsCount?.total.toString()}',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _StatTile(
                        icon: Icons.cancel_rounded,
                        iconBg: Colors.red.withOpacity(0.10),
                        iconColor: Colors.red,
                        title: "Jobs Cancelled",
                        // same logic, same data
                        primary: controller.bookingCountResponse.content
                            ?.bookingsCount?.canceled
                            .toString(),
                        secondary:
                        '/${controller.bookingCountResponse.content?.bookingsCount?.total.toString() == "null" ? "0" : controller.bookingCountResponse.content?.bookingsCount?.total.toString()}',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Visibility(
              //   visible: pendingBookings.isNotEmpty,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Aaj ke ${pendingBookings.length ?? 0} kaam pending hai',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: const Color(0xFFC61414),
              //           fontSize: 14,
              //           fontFamily: 'Albert Sans',
              //           fontWeight: FontWeight.w500,
              //           height: 1.40,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    });
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String? primary;
  final String secondary;

  const _StatTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.primary,
    required this.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F2F6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// icon + title
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 13,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /// value
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: primary ?? "0",
                  style: const TextStyle(
                    color: primaryAppColor,
                    fontSize: 22,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w800,
                    height: 1.0,
                  ),
                ),
                TextSpan(
                  text: secondary,
                  style: const TextStyle(
                    color: primaryAppColor,
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
      height: 92,
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

          /// Center content (clean)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Albert Sans',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Rating",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                      fontFamily: 'Albert Sans',
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star_rounded, color: Colors.orange, size: 16),
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