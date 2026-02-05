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
              /// 👈 signal bhej rahe hain ki refresh chahiye
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
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final booking =
                          controller.bookingModel.data![index];
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
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// TIME
        Text(
          DateFormat("hh:mm a")
              .format(DateTime.parse(booking.serviceSchedule)),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 6),

        /// SERVICE NAME
        Text(
          booking.subCategory?.name ?? '',
          style: const TextStyle(fontSize: 14),
        ),

        const SizedBox(height: 6),

        /// ADDRESS
        Text(
          booking.serviceAddress?.address ?? "Address not available",
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 10),

        /// STATUS ROW
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// SERVICE STATUS
            _statusChip(
              booking.bookingStatus,
              _bookingStatusColor(booking.bookingStatus),
            ),

            /// PAYMENT STATUS
            Text(
              booking.isPaid == 1 ? "PAID" : "UNPAID",
              style: TextStyle(
                color: booking.isPaid == 1
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        /// PAYMENT METHOD + BUTTON
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// PAYMENT METHOD
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 14,
                    color: Colors.indigo,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    booking.paymentMethod
                        ?.replaceAll('_', ' ')
                        .toUpperCase() ??
                        '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            /// VIEW DETAILS BUTTON
            GestureDetector(
              onTap: () {
                Get.to(() => ShuruKare(id: booking.id ?? ""));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: primaryAppColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "View Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
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
