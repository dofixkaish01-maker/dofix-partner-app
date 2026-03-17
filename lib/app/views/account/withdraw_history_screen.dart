import 'dart:developer';

import 'package:dofix_technichian/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_appbar.dart';

class WithdrawHistoryScreen extends StatelessWidget {
  const WithdrawHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Withdraw history",
          isSearchButtonExist: false,
          isTitleExist: false,
          isBackButtonExist: true,
          drawerButton: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              Images.iclogo,
              height: 70,
              width: 70,
            ),
          ),
        ),
        body: GetBuilder<AccountController>(builder: (controller) {
          log("Withdraw history length : ${controller.withdrawListingModel?.content?.withdrawRequests?.data?.length ?? 0}");
          final withdrawRequests = controller
                  .withdrawListingModel?.content?.withdrawRequests?.data ??
              [];
          return withdrawRequests.isNotEmpty
              ? ListView.builder(
                  itemCount: withdrawRequests.length,
                  itemBuilder: (context, index) {
                    final item = withdrawRequests[index];

                    Color statusColor = item.requestStatus == 'approved'
                        ? Colors.green
                        : item.requestStatus == 'denied'
                            ? Colors.red
                            : Colors.orange;

                    IconData statusIcon = item.requestStatus == 'approved'
                        ? Icons.check_circle
                        : item.requestStatus == 'denied'
                            ? Icons.cancel
                            : Icons.hourglass_bottom;

                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Top Row (Amount + Status)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Withdraw Amount",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "₹${item.amount ?? ''}",
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                /// Status Badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: statusColor.withOpacity(.12),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(statusIcon,
                                          color: statusColor, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        item.requestStatus != null &&
                                                item.requestStatus!.isNotEmpty
                                            ? item.requestStatus![0]
                                                    .toUpperCase() +
                                                item.requestStatus!.substring(1)
                                            : '',
                                        style: TextStyle(
                                          color: statusColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14),

                            const Divider(),

                            const SizedBox(height: 10),

                            /// Date + Time Row
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    size: 16, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  item.createdAt != null
                                      ? DateFormat('dd MMM yyyy')
                                          .format(item.createdAt!)
                                      : '',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(width: 15),
                                const Icon(Icons.access_time,
                                    size: 16, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  item.createdAt != null
                                      ? DateFormat('hh:mm a')
                                          .format(item.createdAt!)
                                      : '',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            /// Paid Badge
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: item.isPaid == 1
                                        ? Colors.green.withOpacity(.1)
                                        : Colors.orange.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    item.isPaid == 1 ? "Paid" : "Unpaid",
                                    style: TextStyle(
                                      color: item.isPaid == 1
                                          ? Colors.green
                                          : Colors.orange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : const Center(
                  child: Text(
                    'No history found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
        }),
      ),
    );
  }
}
