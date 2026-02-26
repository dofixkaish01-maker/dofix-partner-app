import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/dashboard_controller.dart';
import '../../../utils/theme.dart';
import '../shuru_kare.dart';

class Naya_kaam extends StatefulWidget {
  const Naya_kaam({super.key});

  @override
  State<Naya_kaam> createState() => _Naya_kaamState();
}

class _Naya_kaamState extends State<Naya_kaam> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DashBoardController>().getListOfBookings(isRefresh: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: GetBuilder<DashBoardController>(
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              /// signal bhej rahe hain ki refresh chahiye
              Get.back(result: true);
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.getListOfBookings(isRefresh: true);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    /// HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Aaj ke Jobs",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${controller.bookingModel.data?.where((e) => e.bookingStatus == "completed").length ?? 0}"
                            "/${controller.bookingModel.data?.length ?? 0}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF207FA7),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// EMPTY STATE
                    if (controller.bookingModel.data?.isEmpty ?? true)
                      Column(
                        children: const [
                          SizedBox(height: 80),
                          Icon(Icons.work_off, size: 60, color: Colors.grey),
                          SizedBox(height: 12),
                          Text(
                            "No Work For Today",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      )
                    else

                      /// BOOKINGS LIST
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                        itemCount: controller.bookingModel.data!.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final booking = controller.bookingModel.data![index];
                          return _bookingCard(booking);
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _bookingCard(booking) {
  final timeText =
      DateFormat("hh:mm a").format(DateTime.parse(booking.serviceSchedule));

  final serviceName = booking.subCategory?.name ?? '';
  final addressText =
      booking.serviceAddress?.address ?? "Address not available";

  final isPaid = booking.isPaid == 1;
  final paidText = isPaid ? "PAID" : "UNPAID";

  final paymentMethodText =
      booking.paymentMethod?.replaceAll('_', ' ').toUpperCase() ?? '';

  final bookingStatus = booking.bookingStatus;

  return LayoutBuilder(
    builder: (context, constraints) {
      final isSmall = constraints.maxWidth < 360;

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.black.withOpacity(0.04)),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                Row(
                  children: [
                    Text(
                      timeText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      paidText,
                      style: TextStyle(
                        color: isPaid ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// SERVICE NAME
                Text(
                  serviceName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 6),

                /// ADDRESS
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        addressText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13.5,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                Container(height: 1, color: Colors.black.withOpacity(0.06)),
                const SizedBox(height: 12),

                ///  RESPONSIVE FOOTER (NO OVERFLOW)
                // Wrap(
                //   spacing: 10,
                //   runSpacing: 10,
                //   crossAxisAlignment: WrapCrossAlignment.center,
                //   children: [
                //     /// STATUS CHIP (same logic)
                //     _statusChip(
                //       bookingStatus,
                //       _bookingStatusColor(bookingStatus),
                //     ),
                //
                //     const Spacer(),
                //     /// PAYMENT METHOD (same logic)
                //     if (paymentMethodText.isNotEmpty)
                //       ConstrainedBox(
                //         constraints: BoxConstraints(
                //           maxWidth: isSmall ? 170 : 220, // prevents overflow
                //         ),
                //         child: Container(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 10, vertical: 5),
                //           decoration: BoxDecoration(
                //             color: Colors.indigo.withOpacity(0.12),
                //             borderRadius: BorderRadius.circular(999),
                //             border: Border.all(
                //               color: Colors.indigo.withOpacity(0.18),
                //             ),
                //           ),
                //           child: Row(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               const Icon(
                //                 Icons.account_balance_wallet_outlined,
                //                 size: 14,
                //                 color: Colors.indigo,
                //               ),
                //               const SizedBox(width: 6),
                //               Expanded(
                //                 child: Text(
                //                   paymentMethodText,
                //                   maxLines: 1,
                //                   overflow: TextOverflow.ellipsis,
                //                   style: const TextStyle(
                //                     fontSize: 12,
                //                     color: Colors.indigo,
                //                     fontWeight: FontWeight.w800,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //
                //     /// VIEW DETAILS BUTTON (same onTap)
                //     SizedBox(
                //       width: isSmall ? constraints.maxWidth : null, // small screen: full width
                //       child: InkWell(
                //         borderRadius: BorderRadius.circular(10),
                //         onTap: () {
                //           Get.to(() => ShuruKare(id: booking.id ?? ""));
                //         },
                //         child: Container(
                //           alignment: Alignment.center,
                //           padding: EdgeInsets.symmetric(
                //             horizontal: 14,
                //             vertical: isSmall ? 10 : 8,
                //           ),
                //           decoration: BoxDecoration(
                //             color: primaryAppColor,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Text(
                //             "View Details",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: isSmall ? 12 : 12,
                //               fontWeight: FontWeight.w700,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// LEFT: STATUS CHIP
                        _statusChip(
                          bookingStatus,
                          _bookingStatusColor(bookingStatus),
                        ),

                        /// PUSH RIGHT
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,

                            /// RIGHT: PAYMENT METHOD
                            child: paymentMethodText.isNotEmpty
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                        color: Colors.indigo.withOpacity(0.18),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.account_balance_wallet_outlined,
                                          size: 14,
                                          color: Colors.indigo,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          paymentMethodText,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// BUTTON FULL WIDTH (overflow safe)
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.to(() => ShuruKare(id: booking.id ?? ""));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: primaryAppColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "View Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _statusChip(String? text, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: color.withOpacity(0.15),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text?.toUpperCase() ?? '',
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Color _bookingStatusColor(String? status) {
  switch (status) {
    case "completed":
      return Colors.green;
    case "ongoing":
      return Colors.orange;
    default:
      return Colors.grey;
  }
}
