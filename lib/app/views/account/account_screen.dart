import 'package:dofix_technichian/app/views/account/withdraw_request_screen.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/model/wallet_history_model.dart';
import 'package:dofix_technichian/utils/date_converter.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:dofix_technichian/views/payment_method_dialog.dart';
import 'package:flutter/material.dart';
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

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Recharge Wallet'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter recharge amount',
                enabledBorder: OutlineInputBorder(
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryAppColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                await accountController.userWalletRecharge(
                  amount: amountController.text,
                  providerId: Get.find<DashBoardController>()
                          .providerDashboardModel
                          .content
                          ?.providerInfo
                          ?.id ??
                      "",
                );
              },
              child: Text(
                'Proceed',
              ),
            ),
          ],
        ),
      ),
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
            0.0,
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
