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
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(
                          'Amount: ₹${item.amount ?? ''}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status: ${item.requestStatus != null && item.requestStatus!.isNotEmpty ? item.requestStatus![0].toUpperCase() + item.requestStatus!.substring(1) : ''}',
                            ),
                            Text(
                              'Requested At: ${item.createdAt != null ? DateFormat('dd-MM-yyyy').format(item.createdAt!) : ''}',
                            ),
                            Text(
                              'Request Time: ${item.createdAt != null ? DateFormat('hh:mm a').format(item.createdAt!) : ''}',
                            ),
                            Text('Paid: ${item.isPaid == 1 ? "Yes" : "No"}'),
                          ],
                        ),
                        trailing: Icon(
                          item.requestStatus == 'approved'
                              ? Icons.check_circle
                              : item.requestStatus == 'denied'
                                  ? Icons.cancel
                                  : Icons.hourglass_bottom,
                          color: item.requestStatus == 'approved'
                              ? Colors.green
                              : item.requestStatus == 'denied'
                                  ? Colors.red
                                  : Colors.orange,
                        ),
                      ),
                    );
                  },
                )
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
