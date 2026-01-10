import 'dart:developer';

import 'package:dofix_technichian/app/views/account/withdraw_history_screen.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/account_controller.dart';
import '../../../model/account/withdraw_method_model.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_appbar.dart';

class WithdrawRequestScreen extends StatefulWidget {
  const WithdrawRequestScreen({super.key});

  @override
  State<WithdrawRequestScreen> createState() => _WithdrawRequestScreenState();
}

class _WithdrawRequestScreenState extends State<WithdrawRequestScreen> {
  final accountController = Get.find<AccountController>();

  @override
  void initState() {
    super.initState();
    accountController.selectedWithdrawMethod = null;
    accountController.withdrawAmountController.clear();
    accountController.withdrawIdController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await accountController.fetchWithdrawnMethods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            onPressed: () async {
              await accountController.withdrawMyBalance(context: context);
            },
            child: Text(
              'Withdraw',
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await accountController.fetchWithdrawListing();
            Get.to(() => const WithdrawHistoryScreen());
          },
          backgroundColor: primaryAppColor,
          shape: const CircleBorder(),
          child: Icon(
            Icons.history,
            color: Colors.white,
          ),
        ),
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
        body: GetBuilder<AccountController>(builder: (controller) {
          log("Withdraw Method Model: ${controller.withdrawMethodModel?.content?.data?.length}");
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                TextField(
                  controller: controller.withdrawAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter withdraw amount',
                    labelText: 'Enter Amount',
                    labelStyle: TextStyle(
                      color: primaryAppColor,
                      fontSize: 16.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryAppColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusColor: primaryAppColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryAppColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryAppColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<WithdrawMethodData>(
                  value: controller.selectedWithdrawMethod,
                  items: controller.withdrawMethodModel?.content?.data
                      ?.where((method) => method.isActive == 1)
                      .map((method) {
                    return DropdownMenuItem<WithdrawMethodData>(
                      value: method,
                      child: Text(
                        method.methodName ?? "Select Method",
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectedWithdrawMethod = value;
                    controller.update();
                  },
                  decoration: InputDecoration(
                    labelText: 'Withdraw Method',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryAppColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryAppColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelStyle: TextStyle(
                      color: primaryAppColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                    "NOTE : DoFix se nayi booking lene ke liye aapke wallet mein kam se kam 2000 rupaye hone chahiye."),
                SizedBox(height: 16),
                if (controller.selectedWithdrawMethod != null)
                  TextField(
                    controller: controller.withdrawIdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: controller.selectedWithdrawMethod?.methodFields
                              ?.first.placeholder ??
                          'Enter Amount',
                      labelText: controller.selectedWithdrawMethod?.methodFields
                              ?.first.placeholder ??
                          'Enter Amount',
                      labelStyle: TextStyle(
                        color: primaryAppColor,
                        fontSize: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryAppColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusColor: primaryAppColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryAppColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryAppColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
