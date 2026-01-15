import 'package:dofix_technichian/app/views/account/withdraw_request_screen.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/model/wallet_history_model.dart';
import 'package:dofix_technichian/utils/date_converter.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:dofix_technichian/views/payment_method_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';
import '../../../widgets/custom_snack_bar.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_wallet_balance.dart';
import '../../widgets/transaction_tile.dart';

enum TransactionType {
  none,
  payable,
  withdrawAble,
  adjust,
  adjustAndPayable,
  adjustWithdrawAble
}

class PaiseScreen extends StatefulWidget {
  const PaiseScreen({super.key});

  @override
  State<PaiseScreen> createState() => _PaiseScreenState();
}

class _PaiseScreenState extends State<PaiseScreen> {
  final AccountController accountController = Get.find();

void showRechargeDialog(BuildContext context) {
  final TextEditingController amountController = TextEditingController();
  final dashCtrl = Get.find<DashBoardController>();

  int minAmount = 2000;

  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: "",
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return StatefulBuilder(
        builder: (context, setState) {

          /// SAME BALANCE AS DASHBOARD
          double receivableAmount = double.tryParse(
                dashCtrl.providerDashboardModel.content
                        ?.providerInfo
                        ?.owner
                        ?.account
                        ?.accountReceivable
                        ?.toString() ??
                    "0",
              ) ??
              0;

          int currentBalance = dashCtrl
              .getTransactionAmountAmount(0.0, receivableAmount)
              .toInt();

          int amount = int.tryParse(amountController.text) ?? 0;
          int totalBalance = currentBalance + amount;

          bool isValidAmount = totalBalance >= minAmount;

          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /// TITLE
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Recharge Wallet",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// INFO
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Minimum wallet balance must be ₹$minAmount",
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// CURRENT BALANCE
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Current Balance: ₹$currentBalance",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// AMOUNT FIELD
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        prefixText: "₹ ",
                        hintText: "Enter Recharge Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),

                    const SizedBox(height: 12),

                    /// STATUS
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        isValidAmount
                            ? "Final Balance: ₹$totalBalance"
                            : "Add ₹${minAmount - totalBalance} more to continue",
                        style: TextStyle(
                          color:
                              isValidAmount ? Colors.green : Colors.redAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: isValidAmount
                            ? () async {
                                Navigator.pop(context);

                                await accountController.userWalletRecharge(
                                  amount: amount.toString(),
                                  providerId: dashCtrl
                                          .providerDashboardModel
                                          .content
                                          ?.providerInfo
                                          ?.id ??
                                      "",
                                );
                              }
                            : null,
                        child: const Text(
                          "Proceed to Pay",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
    transitionBuilder: (_, animation, __, child) {
      return SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
                .animate(animation),
        child: ScaleTransition(scale: animation, child: child),
      );
    },
  );
}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Get.find<DashBoardController>().getAccountInfo(true);
        await accountController.fetchWalletTransactionHistory(
            Get.find<DashBoardController>()
                    .providerDashboardModel
                    .content
                    ?.providerInfo
                    ?.userId ??
                "");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        double transactionAmount = 0;

        double receivableAmount = double.tryParse((controller
                        .providerDashboardModel
                        .content
                        ?.providerInfo
                        ?.owner
                        ?.account
                        ?.accountReceivable ??
                    "0")
                .toString()) ??
            0;
        // TODO : Not required now in App
        // double payableAmount = double.tryParse((controller
        //                 .providerDashboardModel
        //                 .content
        //                 ?.providerInfo
        //                 ?.owner
        //                 ?.account
        //                 ?.accountPayable ??
        //             "0")
        //         .toString()) ??
        //     0;

        transactionAmount = controller.getTransactionAmountAmount(
            // payableAmount, receivableAmount);
            100.0,
            receivableAmount);

        TransactionType transactionType =
            // controller.getTransactionType(payableAmount, receivableAmount);
            controller.getTransactionType(0.0, receivableAmount);

        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // CustomButtonWidget(
                    //   color: primaryAppColor,
                    //   buttonText: 'Recharge Wallet',
                    //   onPressed: () {
                    //     showRechargeDialog(context);
                    //   },
                    // ),
                    // TODO : Chart details not coming from API or parameters changed
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // WalletBalanceChart(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: ShapeDecoration(
                                color: const Color(0xFFE9F2F6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      transactionType == TransactionType.payable
                                          ? "Payable balance".tr
                                          : transactionType ==
                                                  TransactionType.withdrawAble
                                              ? "Available balance".tr
                                              : transactionType ==
                                                      TransactionType
                                                          .adjustAndPayable
                                                  ? "Final payable balance".tr
                                                  : transactionType ==
                                                          TransactionType
                                                              .adjustWithdrawAble
                                                      ? "Final receivable balance"
                                                          .tr
                                                      : transactionType ==
                                                              TransactionType
                                                                  .adjust
                                                          ? "Adjustable balance"
                                                              .tr
                                                          : "Empty Balance".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFF212121),
                                        fontSize: 14,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 1.40,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '₹ $transactionAmount',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFF207FA7),
                                        fontSize: 20,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    CustomButtonWidget(
                                      buttonText: transactionType ==
                                              TransactionType.payable
                                          ? "Pay Now".tr
                                          : transactionType ==
                                                  TransactionType.withdrawAble
                                              ? "withdraw".tr
                                              : transactionType ==
                                                      TransactionType
                                                          .adjustAndPayable
                                                  ? "Adjust and Pay".tr
                                                  : transactionType ==
                                                          TransactionType
                                                              .adjustWithdrawAble
                                                      // ? "Adjust and Withdraw".tr
                                                      ? "Withdraw".tr
                                                      : transactionType ==
                                                              TransactionType
                                                                  .adjust
                                                          ? "Adjust".tr
                                                          : "Empty balance".tr,
                                      onPressed: transactionType ==
                                              TransactionType.none
                                          ? () {
                                              showCustomSnackBar(
                                                  "No amount to withdraw.");
                                            }
                                          : () async {
                                              await Get.find<
                                                      DashBoardController>()
                                                  .getConfigData();
                                              var config = Get.find<
                                                      DashBoardController>()
                                                  .configModel
                                                  .content;
                                              if (transactionType ==
                                                      TransactionType.payable ||
                                                  transactionType ==
                                                      TransactionType
                                                          .adjustAndPayable) {
                                                if (config?.digitalPayment ==
                                                    0) {
                                                  showCustomSnackBar(
                                                      "no_payment_option_available"
                                                          .tr);
                                                } else if ((config
                                                            ?.minimumPayableAmount ??
                                                        0) <=
                                                    transactionAmount) {
                                                  Get.find<
                                                          DashBoardController>()
                                                      .updateIndex(-1,
                                                          isUpdate: false);
                                                  showModalBottomSheet(
                                                    context: context,
                                                    useRootNavigator: true,
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    builder: (context) =>
                                                        PaymentMethodDialog(
                                                            amount:
                                                                transactionAmount),
                                                  );
                                                } else {
                                                  showCustomSnackBar(
                                                      "${'Minimum Payable Amount'.tr} ${config?.minimumPayableAmount ?? 0}");
                                                }
                                              } else if (transactionType ==
                                                      TransactionType
                                                          .withdrawAble ||
                                                  transactionType ==
                                                      TransactionType
                                                          .adjustWithdrawAble) {
                                                await accountController
                                                    .adjustMyBalance();
                                                Get.to(WithdrawRequestScreen());
                                              } else if (transactionType ==
                                                  TransactionType.adjust) {
                                                await accountController
                                                    .adjustMyBalance();
                                              }
                                            },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: ShapeDecoration(
                                color: const Color(0xFFE9F2F6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₹ ${controller.providerDashboardModel.content?.providerInfo?.owner?.account?.receivedBalance ?? 0}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFF207FA7),
                                        fontSize: 20,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Total Earning',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFF212121),
                                        fontSize: 14,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 1.40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: Container(
                          //     decoration: ShapeDecoration(
                          //       color: const Color(0xFFE9F2F6),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(5)),
                          //     ),
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 10, horizontal: 10),
                          //     child: Center(
                          //       child: Column(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Text(
                          //             '₹ ${controller.providerDashboardModel.content?.providerInfo?.owner?.account?.accountPayable ?? 0}',
                          //             textAlign: TextAlign.center,
                          //             style: TextStyle(
                          //               color: const Color(0xFF207FA7),
                          //               fontSize: 20,
                          //               fontFamily: 'Albert Sans',
                          //               fontWeight: FontWeight.w700,
                          //               height: 1.40,
                          //             ),
                          //           ),
                          //           SizedBox(height: 2),
                          //           Text(
                          //             'Payable Balance',
                          //             textAlign: TextAlign.center,
                          //             style: TextStyle(
                          //               color: const Color(0xFF212121),
                          //               fontSize: 14,
                          //               fontFamily: 'Albert Sans',
                          //               fontWeight: FontWeight.w500,
                          //               height: 1.40,
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE9F2F6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹ ${controller.providerDashboardModel.content?.providerInfo?.owner?.account?.accountReceivable ?? 0}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF207FA7),
                                      fontSize: 20,
                                      fontFamily: 'Albert Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Receivable Balance',
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
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Container(
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE9F2F6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹ ${controller.providerDashboardModel.content?.providerInfo?.owner?.account?.balancePending ?? 0}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF207FA7),
                                      fontSize: 20,
                                      fontFamily: 'Albert Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Pending Withdrawn',
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
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE9F2F6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹ ${controller.providerDashboardModel.content?.providerInfo?.owner?.account?.totalWithdrawn ?? 0}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF207FA7),
                                      fontSize: 20,
                                      fontFamily: 'Albert Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Already Withdrawn',
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
                          )),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wallet Transactions',
                          style: TextStyle(
                            color: primaryAppColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    GetBuilder<AccountController>(
                      builder: (accController) {
                        final List<Content>? sortedContent =
                            accController.transactionHistory?.content == null
                                ? null
                                : List<Content>.from(
                                    accController.transactionHistory!.content!)
                              ?..sort((a, b) {
                                final aDate = DateTime.tryParse(
                                        a.createdAt?.toString() ?? '') ??
                                    DateTime(1970);
                                final bDate = DateTime.tryParse(
                                        b.createdAt?.toString() ?? '') ??
                                    DateTime(1970);
                                return bDate.compareTo(aDate); // descending
                              });
                        if (sortedContent != null) {
                          for (var item in sortedContent) {
                            print(
                                '${item.createdAt} ==== ${item.balance} ==== ${item.debit} ==== ${item.credit}');
                          }
                        }
                        return (accController.transactionHistory?.content ==
                                    null ||
                                accController
                                    .transactionHistory!.content!.isEmpty)
                            ? SizedBox(
                                height: 400,
                                child: Center(
                                    child: Text('No Transactions Found')))
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: (sortedContent?.length ?? 0) + 1,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Date",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Amount",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Transactions",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  final Content? transactionContent =
                                      sortedContent?[index - 1];
                                  return TransactionTile(
                                    transaction: TransactionModel(
                                      bookingId: transactionContent
                                              ?.booking?.readableId
                                              ?.toString() ??
                                          "",
                                      date: transactionContent?.createdAt ??
                                          DateTime.now(),
                                      amount: transactionContent?.credit != 0
                                          ? transactionContent?.credit ?? 0.0
                                          : transactionContent?.debit ?? 0.0,
                                      isCredit: transactionContent?.credit != 0
                                          ? true
                                          : false,
                                      transactionBy: (transactionContent
                                                  ?.trxType ==
                                              "withdrawable_amount")
                                          ? transactionContent?.credit != 0.0
                                              ? "Withdrawal"
                                              : "Withdrawal Refund"
                                          : transactionContent?.credit != 0
                                              ? transactionContent
                                                      ?.toUser?.firstName ??
                                                  ""
                                              : transactionContent
                                                      ?.fromUser?.firstName ??
                                                  "",
                                    ),
                                    isLast:
                                        index == (sortedContent?.length ?? 1),
                                  );
                                },
                              );
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              right: 8,
              child: FloatingActionButton(
                onPressed: () {
                  showRechargeDialog(context);
                },
                backgroundColor: greenColor,
                shape: CircleBorder(),
                child: const Icon(
                  Icons.currency_rupee,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
