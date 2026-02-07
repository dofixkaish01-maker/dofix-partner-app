
import 'dart:async';

import 'package:dofix_technichian/controllers/auth_controller.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/account_controller.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_nav_bar.dart';
import '../account/profile_screen.dart';
import '../notification/notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;

  const DashboardScreen({Key? key, required this.pageIndex}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageIndex = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);
    currentPage = widget.pageIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint("DashboardScreen initState");

      final dashCtrl = Get.find<DashBoardController>();
      final accCtrl = Get.find<AccountController>();

      //  IMPORTANT: wallet/account info yahin load karo
      await dashCtrl.getAccountInfo(true);
      await dashCtrl.fetchNotifications();

      // optional: category bhi yahin ensure ho
      await accCtrl.fetchCategory();

      // existing call
      await dashCtrl.getListOfBookings(isRefresh: false);
    });

  }

  final AccountController authController = Get.find<AccountController>();
  // late final notifications =
  //     controller.notificationModel.value.content ?? [];

  @override
  Widget build(BuildContext context) {
    // print('Notification length: ${notifications.length}');
    return GetBuilder<DashBoardController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            if (_pageIndex != 0) {
              _setPage(0);
              return false;
            } else {
              return true;
            }
          },
          child: WillPopScope(
              onWillPop: Get.find<AuthController>().handleOnWillPop,
              child: SafeArea(
                  child: Scaffold(
                extendBody: true,
                resizeToAvoidBottomInset: false,
                appBar: CustomAppBar(
                  title: controller.screenTitle[_pageIndex],
                  isSearchButtonExist: false,
                  drawerButton: Builder(
                    builder: (context) {
                      final size = MediaQuery.of(context).size;
                      final isSmallDevice = size.width < 360;

                      return Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Image.asset(
                          Images.iclogo,
                          height: isSmallDevice ? 45 : size.height * 0.06,
                          width: isSmallDevice ? 45 : size.height * 0.06,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                  menuWidget: Builder(
                    builder: (context) {
                      final size = MediaQuery.of(context).size;
                      final isSmallDevice = size.width < 360;

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// ================= WALLET
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => DashboardScreen(pageIndex: 3));
                            },
                            child: GetBuilder<DashBoardController>(
                              builder: (controller) {
                                double receivableAmount = double.tryParse(
                                    controller
                                        .providerDashboardModel
                                        .content
                                        ?.providerInfo
                                        ?.owner
                                        ?.account
                                        ?.accountReceivable
                                        ?.toString() ??
                                        "0") ??
                                    0;

                                final transactionAmount = controller
                                    .getTransactionAmountAmount(0.0, receivableAmount);

                                return Container(
                                  height: isSmallDevice ? 32 : 36,
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF207FA7).withOpacity(0.10),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/icons/ic_wallet.png",
                                        width: isSmallDevice ? 14 : 16,
                                        height: isSmallDevice ? 14 : 16,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '₹ $transactionAmount',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: const Color(0xFF207FA7),
                                          fontSize: isSmallDevice ? 11 : 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Get.to(() => AccountScreen());
                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF207FA7).withOpacity(0.10),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Icon(
                                Icons.person_2_outlined,
                                color: const Color(0xFF207FA7),
                                size: isSmallDevice ? 20 : 24,
                              ),
                            ),
                          ),

                          Obx(() {
                            final notifications =
                                controller.notificationModel.value.content ?? [];

                            final count = notifications.length;

                            print('Badge count: $count');

                            return Flexible(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 36,
                                  minHeight: 36,
                                ),
                                iconSize: isSmallDevice ? 22 : 26,
                                onPressed: () {
                                  Get.to(() => NotificationScreen());
                                },
                                icon: Badge(
                                  isLabelVisible: count > 0,
                                  backgroundColor: Colors.red,
                                  offset: const Offset(6, -6),
                                  label: Text(
                                    count > 99 ? '99+' : '$count',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.notifications_active,
                                    color: Color(0xFF207FA7),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    },
                  ),

                ),
                bottomNavigationBar: !GetPlatform.isMobile
                    ? const SizedBox()
                    : CustomBottomNavBar(
                        currentIndex: currentPage,
                        onTap: (index) {
                          _setPage(index);
                        },
                      ),
                body: RefreshIndicator(
                  onRefresh: _onRefresh,
                  color: const Color(0xFF207FA7),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          // tumhara poora existing code yahin rahega

//                   Obx(() {
//   final category = authController.categoryInfo.value;
//   if (category == null) return const SizedBox();
//
//   final dashboardController = Get.find<DashBoardController>();
//
//   double walletBalance = double.tryParse(
//         dashboardController
//                 .providerDashboardModel
//                 .content
//                 ?.providerInfo
//                 ?.owner
//                 ?.account
//                 ?.accountReceivable
//                 ?.toString() ??
//             "0") ??
//       0;
//
//   double minimumBalance = category.minimumBalance.toDouble();
//   double shortAmount = minimumBalance - walletBalance;
//
//   if (walletBalance >= minimumBalance) {
//     return const SizedBox();
//   }
//
//   return Container(
//     width: double.infinity,
//     margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     padding: const EdgeInsets.all(12),
//     decoration: BoxDecoration(
//       color: Colors.redAccent.withOpacity(0.1),
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(color: Colors.redAccent),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Icon(
//           Icons.warning_amber_rounded,
//           color: Colors.redAccent,
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Low Balance Warning",
//                 style: TextStyle(
//                   color: Colors.redAccent,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 "Current Balance: ₹${walletBalance.toStringAsFixed(2)}",
//                 style: const TextStyle(
//                   color: Colors.black87,
//                   fontSize: 13,
//                 ),
//               ),
//               Text(
//                 "Minimum Required: ₹${minimumBalance.toStringAsFixed(2)}",
//                 style: const TextStyle(
//                   color: Colors.black87,
//                   fontSize: 13,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 "Add ₹${shortAmount.toStringAsFixed(2)} more to continue receiving bookings.",
//                 style: const TextStyle(
//                   color: Colors.redAccent,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 13,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// })

                          // minimum balance
                          Obx(() {
                            final category = authController.categoryInfo.value;
                            if (category == null) return const SizedBox();

                            final dashCtrl = Get.find<DashBoardController>();

                            double receivableAmount = double.tryParse(
                                dashCtrl
                                    .providerDashboardModel
                                    ?.content
                                    ?.providerInfo
                                    ?.owner
                                    ?.account
                                    ?.accountReceivable
                                    ?.toString() ??
                                    "0") ??
                                0;

                            double transactionAmount =
                            dashCtrl.getTransactionAmountAmount(0.0, receivableAmount);

                            double currentBalance = transactionAmount.floorToDouble();
                            double minimumBalance =
                            category.minimumBalance.toDouble().floorToDouble();

                            if (currentBalance >= minimumBalance) {
                              return const SizedBox();
                            }

                            /// SHORT AMOUNT
                            double shortAmount = minimumBalance - currentBalance;

                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.redAccent.withOpacity(0.25),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.redAccent.withOpacity(0.040),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],

                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// ICON
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent.withOpacity(0.12),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.redAccent,
                                      size: 24,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  /// CONTENT
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        /// TITLE
                                        const Text(
                                          "Low Balance Warning",
                                          style: TextStyle(
                                            color: Color(0xFFB71C1C),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                          ),
                                        ),

                                        const SizedBox(height: 6),

                                        /// BALANCE INFO
                                        Text(
                                          "Current Balance  ₹${currentBalance.toStringAsFixed(0)}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87,
                                            height: 1.3,
                                          ),
                                        ),
                                        Text(
                                          "Minimum Required  ₹${minimumBalance.toStringAsFixed(0)}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87,
                                            height: 1.3,
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        /// ACTION HIGHLIGHT
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFFFFF3E0),
                                                Color(0xFFFFE0B2),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "Add ₹${shortAmount.toStringAsFixed(0)} more to continue receiving bookings",
                                            style: const TextStyle(
                                              color: Color(0xFFE65100),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                              height: 1.3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );

                          }),

                          /// ================= CATEGORY INFO =================
                          // Obx(() {
                          //   final category = authController.categoryInfo.value;
                          //
                          //   if (category == null) {
                          //     return const Padding(
                          //       padding: EdgeInsets.symmetric(vertical: 8),
                          //       child:
                          //           CircularProgressIndicator(strokeWidth: 2),
                          //     );
                          //   }
                          //
                          //   return Container(
                          //     width: double.infinity,
                          //     margin: const EdgeInsets.symmetric(
                          //         horizontal: 12, vertical: 6),
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 12, vertical: 8),
                          //     // decoration: BoxDecoration(
                          //     //   color: Colors.redAccent.withOpacity(0.08),
                          //     //   borderRadius: BorderRadius.circular(10),
                          //     //   border: Border.all(
                          //     //     color: Colors.redAccent.withOpacity(0.4),
                          //     //   ),
                          //     // ),
                          //     child: Row(
                          //       children: [
                          //         Icon(Icons.miscellaneous_services,
                          //             color: Color(0xFF207FA7)),
                          //         const SizedBox(width: 8),
                          //
                          //         /// CATEGORY
                          //         Expanded(
                          //           child: Text(
                          //             category.categoryName,
                          //             maxLines: 1,
                          //             overflow: TextOverflow.ellipsis,
                          //             style: const TextStyle(
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           ),
                          //         ),
                          //
                          //         GestureDetector(
                          //           onTap: () {
                          //             // future me recharge dialog ya info dikha sakte ho
                          //             // showRechargeDialog(context);
                          //           },
                          //           child: Container(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 12, vertical: 8),
                          //             decoration: BoxDecoration(
                          //               color:
                          //                   Colors.redAccent.withOpacity(0.08),
                          //               borderRadius: BorderRadius.circular(10),
                          //               border: Border.all(
                          //                 color:
                          //                     Colors.redAccent.withOpacity(0.4),
                          //               ),
                          //             ),
                          //             child: Row(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 const SizedBox(width: 6),
                          //                 Text.rich(
                          //                   TextSpan(
                          //                     children: [
                          //                       const TextSpan(
                          //                         text: "Min Balance ",
                          //                         style: TextStyle(
                          //                           color: Colors.black,
                          //                           fontWeight: FontWeight.w600,
                          //                           fontSize: 13,
                          //                         ),
                          //                       ),
                          //                       TextSpan(
                          //                         text:
                          //                             "₹${category.minimumBalance}",
                          //                         style: const TextStyle(
                          //                           color: Colors.redAccent,
                          //                           fontWeight: FontWeight.bold,
                          //                           fontSize: 13,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   );
                          // }),


                          //=================================

                    /// ================= CATEGORY INFO =================
                    Obx(() {
                      final category = authController.categoryInfo.value;

                      if (category == null) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      }

                      final dashCtrl = Get.find<DashBoardController>();

                      double receivableAmount = double.tryParse(
                          dashCtrl
                              .providerDashboardModel
                              ?.content
                              ?.providerInfo
                              ?.owner
                              ?.account
                              ?.accountReceivable
                              ?.toString() ??
                              "0") ??
                          0;

                      double transactionAmount =
                      dashCtrl.getTransactionAmountAmount(0.0, receivableAmount);

                      double currentBalance = transactionAmount.floorToDouble();
                      double minimumBalance =
                      category.minimumBalance.toDouble().floorToDouble();

                      final bool isBalanceOk = currentBalance >= minimumBalance;

                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.miscellaneous_services,
                                color: Color(0xFF207FA7)),
                            const SizedBox(width: 8),

                            /// CATEGORY NAME
                            Expanded(
                              child: Text(
                                category.categoryName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            /// MIN BALANCE BADGE
                            GestureDetector(
                              onTap: () {
                                // future: recharge dialog
                              },
                              child:Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                decoration: BoxDecoration(
                                  color: isBalanceOk
                                      ? const Color(0xFFEAF7EF) // very light green
                                      : const Color(0xFFFFF0F0), // very light red
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isBalanceOk
                                        ? const Color(0xFFB7E3C4)
                                        : const Color(0xFFFFC1C1),
                                    width: 0.8,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    /// subtle status dot
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: isBalanceOk
                                            ? const Color(0xFF2E7D32)
                                            : const Color(0xFFD32F2F),
                                        shape: BoxShape.circle,
                                      ),
                                    ),

                                    const SizedBox(width: 8),

                                    /// text
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: "Min Balance ",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF1C1C1E), // iOS dark text
                                            ),
                                          ),
                                          TextSpan(
                                            text: "₹${category.minimumBalance}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: isBalanceOk
                                                  ? const Color(0xFF2E7D32)
                                                  : const Color(0xFFD32F2F),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ),
                          ],
                        ),
                      );
                    }),




                    /// ================= SCREENS =================
                          Expanded(
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: controller.screens.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return controller.screens[index];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))));
    });
  }

  int currentPage = 0;

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
      currentPage = pageIndex;
    });
  }

  Future<void> _onRefresh() async {
    final dashCtrl = Get.find<DashBoardController>();
    final accCtrl = Get.find<AccountController>();

    // 1. Latest account info
    await dashCtrl.getAccountInfo(true);

    // 2. Latest category info
    await accCtrl.fetchCategory();

    // 3. Latest bookings
    await dashCtrl.getListOfBookings(isRefresh: true);

    // 4. Optional: unpaid refresh
    await dashCtrl.refreshAndNavigateIfUnpaid();
  }
}
