import 'dart:developer';

import 'package:dofix_technichian/app/views/account/withdraw_history_screen.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/account_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../model/account/withdraw_method_model.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_appbar.dart';

class WithdrawRequestScreen extends StatefulWidget {
  const WithdrawRequestScreen({super.key});

  @override
  State<WithdrawRequestScreen> createState() =>
      _WithdrawRequestScreenState();
}

class _WithdrawRequestScreenState extends State<WithdrawRequestScreen> {
  final AccountController accountController =
  Get.find<AccountController>();
  final DashBoardController dashboardController =
  Get.find<DashBoardController>();

  @override
  void initState() {
    super.initState();

    accountController.selectedWithdrawMethod = null;
    accountController.withdrawAmountController.clear();
    accountController.withdrawIdController.clear();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await dashboardController.getConfigData(); // min/max
      await accountController.fetchWithdrawnMethods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: "Withdraw Request",
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

        bottomNavigationBar: AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: GetBuilder<AccountController>(
            builder: (controller) {
              final minWithdraw =
                  dashboardController.configModel.content
                      ?.minimumWithdrawAmount ??
                      0;

              final maxWithdraw =
                  dashboardController.configModel.content
                      ?.maximumWithdrawAmount ??
                      0;

              final enteredAmount = int.tryParse(
                  controller.withdrawAmountController.text) ??
                  0;

              final isValidAmount =
                  enteredAmount >= minWithdraw &&
                      enteredAmount <= maxWithdraw;

              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isValidAmount ? primaryAppColor : Colors.grey,
                    padding:
                    const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: isValidAmount
                      ? () async {
                    await accountController.withdrawMyBalance(
                        context: context);
                  }
                      : null,
                  child: const Text('Withdraw'),
                ),
              );
            },
          ),
        ),


        // ================= HISTORY FAB =================
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await accountController.fetchWithdrawListing();
            Get.to(() => const WithdrawHistoryScreen());
          },
          backgroundColor: primaryAppColor,
          shape: const CircleBorder(),
          child: const Icon(Icons.history, color: Colors.white),
        ),

        // ================= BODY =================
        body: GetBuilder<AccountController>(
          builder: (controller) {
            final minWithdraw =
                dashboardController.configModel.content
                    ?.minimumWithdrawAmount ??
                    0;

            final maxWithdraw =
                dashboardController.configModel.content
                    ?.maximumWithdrawAmount ??
                    0;

            final enteredAmount = int.tryParse(
                controller.withdrawAmountController.text) ??
                0;

            log("Withdraw Method Count: ${controller.withdrawMethodModel?.content?.data?.length}");

            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ================= AMOUNT FIELD =================
                  TextField(
                    controller:
                    controller.withdrawAmountController,
                    keyboardType: TextInputType.number,
                    onChanged: (_) {
                      controller.update(); // key line
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter withdraw amount',
                      labelText: 'Enter Amount',
                      labelStyle: TextStyle(
                        color: primaryAppColor,
                        fontSize: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: primaryAppColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: primaryAppColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ================= MIN / MAX INFO =================
                  Text(
                    "Minimum withdraw ₹$minWithdraw aur maximum withdraw ₹$maxWithdraw allowed hai",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  // ================= ERROR TEXT =================
                  if (enteredAmount > 0 &&
                      enteredAmount < minWithdraw) ...[
                    const SizedBox(height: 4),
                    Text(
                      "Minimum ₹$minWithdraw withdraw kar sakte ho",
                      style: const TextStyle(
                          color: Colors.red, fontSize: 12),
                    ),
                  ],

                  if (enteredAmount > maxWithdraw) ...[
                    const SizedBox(height: 4),
                    Text(
                      "Maximum ₹$maxWithdraw tak hi withdraw allowed hai",
                      style: const TextStyle(
                          color: Colors.red, fontSize: 12),
                    ),
                  ],

                  const SizedBox(height: 16),

                  // ================= WITHDRAW METHOD =================
                  DropdownButtonFormField<WithdrawMethodData>(
                    value: controller.selectedWithdrawMethod,
                    items: controller
                        .withdrawMethodModel?.content?.data
                        ?.where(
                            (method) => method.isActive == 1)
                        .map((method) {
                      return DropdownMenuItem<
                          WithdrawMethodData>(
                        value: method,
                        child:
                        Text(method.methodName ?? ""),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedWithdrawMethod =
                          value;
                      controller.update();
                    },
                    decoration: InputDecoration(
                      labelText: 'Withdraw Method',
                      labelStyle: TextStyle(
                        color: primaryAppColor,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: primaryAppColor),
                        borderRadius:
                        BorderRadius.circular(5.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ================= CATEGORY NOTE =================
                  Obx(() {
                    final category =
                        controller.categoryInfo.value;

                    if (category == null) {
                      return const SizedBox();
                    }

                    return Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "NOTE : ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: category.categoryName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF207FA7),
                            ),
                          ),
                          const TextSpan(
                            text:
                            " category me nayi booking lene ke liye aapke wallet me kam se kam ",
                          ),
                          TextSpan(
                            text:
                            "₹${category.minimumBalance}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                          const TextSpan(
                            text: " balance hona chahiye.",
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 16),

                  // ================= METHOD FIELD =================
                  if (controller.selectedWithdrawMethod !=
                      null)
                    TextField(
                      controller:
                      controller.withdrawIdController,
                      decoration: InputDecoration(
                        hintText: controller
                            .selectedWithdrawMethod
                            ?.methodFields
                            ?.first
                            .placeholder ??
                            '',
                        labelText: controller
                            .selectedWithdrawMethod
                            ?.methodFields
                            ?.first
                            .placeholder ??
                            '',
                        labelStyle: TextStyle(
                          color: primaryAppColor,
                          fontSize: 16.0,
                        ),
                        enabledBorder:
                        OutlineInputBorder(
                          borderSide: BorderSide(
                              color: primaryAppColor),
                          borderRadius:
                          BorderRadius.circular(5.0),
                        ),
                        focusedBorder:
                        OutlineInputBorder(
                          borderSide: BorderSide(
                              color: primaryAppColor),
                          borderRadius:
                          BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
