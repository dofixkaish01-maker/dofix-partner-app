
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

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../controllers/account_controller.dart';
// import '../../../controllers/dashboard_controller.dart';
// import '../../../utils/images.dart';
// import '../../../views/widgets/custom_nav_bar.dart';
//
//
//
// class DashboardScreen extends StatefulWidget {
//   final int pageIndex;
//
//   const DashboardScreen({super.key, this.pageIndex = 0});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//
//   /// Controllers
//   final DashBoardController dashCtrl = Get.find<DashBoardController>();
//   final AccountController accCtrl = Get.find<AccountController>();
//
//   /// Page Controller
//   late PageController _pageController;
//   int _pageIndex = 0;
//   int currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     /// initial page
//     _pageIndex = widget.pageIndex;
//     currentPage = widget.pageIndex;
//
//     _pageController = PageController(initialPage: _pageIndex);
//
//     /// API CALLS (same as your old code)
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       debugPrint("New Dashboard initState");
//
//       await dashCtrl.getAccountInfo(true);
//       await dashCtrl.fetchNotifications();
//       await accCtrl.fetchCategory();
//       await dashCtrl.getListOfBookings(isRefresh: false);
//     });
//   }
//
//   /// Page change function
//   void _setPage(int index) {
//     setState(() {
//       _pageIndex = index;
//       currentPage = index;
//       _pageController.jumpToPage(index);
//     });
//   }
//
//   /// Pull to refresh
//   Future<void> _onRefresh() async {
//     await dashCtrl.getAccountInfo(true);
//     await accCtrl.fetchCategory();
//     await dashCtrl.getListOfBookings(isRefresh: true);
//     await dashCtrl.refreshAndNavigateIfUnpaid();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(70),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.04),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   // 🔹 Logo / Brand
//                   Container(
//                     height: 42,
//                     width: 42,
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF3683AB).withOpacity(0.08),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Image.asset(Images.iclogo),
//                   ),
//
//                   const SizedBox(width: 12),
//
//                   // 🔹 Title Section
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Dashboard",
//                           style: GoogleFonts.poppins(
//                             fontSize: 12,
//                             color: Colors.grey.shade600,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 2),
//                         Text(
//                           dashCtrl.screenTitle[_pageIndex],
//                           style: GoogleFonts.poppins(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // 🔹 Search
//                   _iconButton(
//                     icon: Icons.search,
//                     onTap: () {},
//                   ),
//
//                   const SizedBox(width: 8),
//
//                   // 🔹 Notification
//                   Stack(
//                     children: [
//                       _iconButton(
//                         icon: Icons.notifications_none,
//                         onTap: () {},
//                       ),
//
//                       Positioned(
//                         right: 6,
//                         top: 6,
//                         child: Container(
//                           height: 8,
//                           width: 8,
//                           decoration: const BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(width: 8),
//
//                   // 🔹 Profile
//                   const CircleAvatar(
//                     radius: 18,
//                     backgroundImage: AssetImage("assets/images/user.png"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//
//       /// Next step me hum yahan AppBar + Body + BottomNav dalenge
//       body: RefreshIndicator(
//         onRefresh: _onRefresh,
//         color: const Color(0xFF207FA7),
//
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//
//             return SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: constraints.maxHeight,
//                 ),
//
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     /// 🔴 LOW BALANCE WARNING CARD
//                     Obx(() {
//                       final category = accCtrl.categoryInfo.value;
//                       if (category == null) return const SizedBox();
//
//                       double receivableAmount = double.tryParse(
//                           dashCtrl.providerDashboardModel
//                               ?.content
//                               ?.providerInfo
//                               ?.owner
//                               ?.account
//                               ?.accountReceivable
//                               ?.toString() ??
//                               "0") ??
//                           0;
//
//                       double transactionAmount =
//                       dashCtrl.getTransactionAmountAmount(0.0, receivableAmount);
//
//                       double currentBalance = transactionAmount.floorToDouble();
//                       double minimumBalance =
//                       category.minimumBalance.toDouble().floorToDouble();
//
//                       if (currentBalance >= minimumBalance) {
//                         return const SizedBox();
//                       }
//
//                       double shortAmount = minimumBalance - currentBalance;
//
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.only(bottom: 12),
//                         padding: const EdgeInsets.all(14),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(18),
//                           border: Border.all(
//                             color: Colors.redAccent.withOpacity(0.3),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.redAccent.withOpacity(0.05),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             /// icon
//                             Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: Colors.redAccent.withOpacity(0.12),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.warning_amber_rounded,
//                                 color: Colors.redAccent,
//                                 size: 22,
//                               ),
//                             ),
//
//                             const SizedBox(width: 12),
//
//                             /// text
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//                                   const Text(
//                                     "Low Balance",
//                                     style: TextStyle(
//                                       color: Color(0xFFB71C1C),
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//
//                                   const SizedBox(height: 6),
//
//                                   Text(
//                                     "Current ₹${currentBalance.toStringAsFixed(0)}  •  Required ₹${minimumBalance.toStringAsFixed(0)}",
//                                     style: const TextStyle(fontSize: 13),
//                                   ),
//
//                                   const SizedBox(height: 8),
//
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10, vertical: 6),
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFFFF3E0),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Text(
//                                       "Add ₹${shortAmount.toStringAsFixed(0)} more to continue receiving bookings",
//                                       style: const TextStyle(
//                                         color: Color(0xFFE65100),
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 12.5,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//
//                     /// 🏷 CATEGORY + MIN BALANCE CHIP
//                     Obx(() {
//                       final category = accCtrl.categoryInfo.value;
//
//                       if (category == null) {
//                         return const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 10),
//                           child: Center(child: CircularProgressIndicator()),
//                         );
//                       }
//
//                       double receivableAmount = double.tryParse(
//                           dashCtrl.providerDashboardModel
//                               ?.content
//                               ?.providerInfo
//                               ?.owner
//                               ?.account
//                               ?.accountReceivable
//                               ?.toString() ??
//                               "0") ??
//                           0;
//
//                       double transactionAmount =
//                       dashCtrl.getTransactionAmountAmount(0.0, receivableAmount);
//
//                       double currentBalance = transactionAmount.floorToDouble();
//                       double minimumBalance =
//                       category.minimumBalance.toDouble().floorToDouble();
//
//                       final bool isBalanceOk = currentBalance >= minimumBalance;
//
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.only(bottom: 12),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(14),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.03),
//                               blurRadius: 6,
//                             )
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//
//                             const Icon(Icons.miscellaneous_services,
//                                 color: Color(0xFF207FA7)),
//
//                             const SizedBox(width: 8),
//
//                             Expanded(
//                               child: Text(
//                                 category.categoryName,
//                                 style: const TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w600),
//                               ),
//                             ),
//
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 6),
//                               decoration: BoxDecoration(
//                                 color: isBalanceOk
//                                     ? const Color(0xFFEAF7EF)
//                                     : const Color(0xFFFFF0F0),
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: isBalanceOk
//                                       ? const Color(0xFFB7E3C4)
//                                       : const Color(0xFFFFC1C1),
//                                 ),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 6,
//                                     height: 6,
//                                     decoration: BoxDecoration(
//                                       color: isBalanceOk
//                                           ? const Color(0xFF2E7D32)
//                                           : const Color(0xFFD32F2F),
//                                       shape: BoxShape.circle,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Text(
//                                     "₹${category.minimumBalance}",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 13,
//                                       color: isBalanceOk
//                                           ? const Color(0xFF2E7D32)
//                                           : const Color(0xFFD32F2F),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//
//                     /// 📄 PAGE CONTENT AREA
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.65,
//                       child: PageView.builder(
//                         controller: _pageController,
//                         itemCount: dashCtrl.screens.length,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           return dashCtrl.screens[index];
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//         bottomNavigationBar: !GetPlatform.isMobile
//                     ? const SizedBox()
//                     : CustomBottomNavBar(
//                         currentIndex: currentPage,
//                         onTap: (index) {
//                           _setPage(index);
//                         },
//                       ),
//
//     );
//   }
// }
//
// Widget _iconButton({
//   required IconData icon,
//   required VoidCallback onTap,
// }) {
//   return Material(
//     color: Colors.grey.shade100,
//     borderRadius: BorderRadius.circular(10),
//     child: InkWell(
//       borderRadius: BorderRadius.circular(10),
//       onTap: onTap,
//       child: SizedBox(
//         height: 40,
//         width: 40,
//         child: Icon(
//           icon,
//           size: 20,
//           color: Colors.black87,
//         ),
//       ),
//     ),
//   );
// }

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:glassmorphism/glassmorphism.dart';
//
// import '../../../controllers/account_controller.dart';
// import '../../../controllers/dashboard_controller.dart';
// import '../../../utils/images.dart';
//
// class DashboardScreen extends StatefulWidget {
//   final int pageIndex;
//   const DashboardScreen({super.key, required this.pageIndex});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//
//   late PageController _pageController;
//   late int _pageIndex;
//
//   final dashCtrl = Get.find<DashBoardController>();
//   final accCtrl  = Get.find<AccountController>();
//
//   @override
//   void initState() {
//     super.initState();
//
//     _pageIndex = widget.pageIndex;
//     _pageController = PageController(initialPage: _pageIndex);
//
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await dashCtrl.getAccountInfo(true);
//       await dashCtrl.fetchNotifications();
//       await accCtrl.fetchCategory();
//       await dashCtrl.getListOfBookings(isRefresh: false);
//     });
//   }
//
//   Future<void> _onRefresh() async {
//     await dashCtrl.getAccountInfo(true);
//     await dashCtrl.fetchNotifications();
//     await dashCtrl.getListOfBookings(isRefresh: true);
//   }
//
//   // =========================================================
//   // ===================== UI START ===========================
//   // =========================================================
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//
//       body: RefreshIndicator(
//         onRefresh: _onRefresh,
//         color: const Color(0xFF207FA7),
//
//         child: CustomScrollView(
//           physics: const AlwaysScrollableScrollPhysics(),
//           slivers: [
//
//             /// 🔷 GLASS APP BAR
//             _buildGlassAppBar(),
//
//             /// 🔽 CONTENT
//             SliverPadding(
//               padding: const EdgeInsets.all(10),
//               sliver: SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//
//                     /// 🔴 LOW BALANCE
//                     _buildLowBalanceCard(),
//
//                     /// 🏷 CATEGORY CARD
//                     _buildCategoryCard(),
//
//                     /// 📄 PAGE VIEW
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.7,
//                       child: PageView.builder(
//                         controller: _pageController,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: dashCtrl.screens.length,
//                         itemBuilder: (context, index) {
//                           return dashCtrl.screens[index];
//                         },
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // =========================================================
//   // ===================== APP BAR ============================
//   // =========================================================
//
//   SliverAppBar _buildGlassAppBar() {
//     return SliverAppBar(
//       expandedHeight: 120,
//       pinned: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       automaticallyImplyLeading: false,
//
//       flexibleSpace: FlexibleSpaceBar(
//         background: Stack(
//           fit: StackFit.expand,
//           children: [
//
//             /// gradient
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFF3683AB),
//                     Color(0xFF5FA8D3),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//
//             /// glass overlay
//             GlassmorphicContainer(
//               width: double.infinity,
//               height: double.infinity,
//               borderRadius: 0,
//               blur: 20,
//               border: 0,
//               linearGradient: LinearGradient(
//                 colors: [
//                   Colors.white.withOpacity(0.15),
//                   Colors.white.withOpacity(0.05),
//                 ],
//               ),
//               borderGradient: LinearGradient(
//                 colors: [
//                   Colors.white.withOpacity(0.2),
//                   Colors.white.withOpacity(0.05),
//                 ],
//               ),
//             ),
//
//             /// content
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//
//                     Container(
//                       height: 44,
//                       width: 44,
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.2),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Image.asset(Images.iclogo),
//                     ),
//
//                     const SizedBox(width: 12),
//
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Dashboard",
//                             style: GoogleFonts.poppins(
//                               fontSize: 12,
//                               color: Colors.white70,
//                             ),
//                           ),
//                           Text(
//                             dashCtrl.screenTitle[_pageIndex],
//                             style: GoogleFonts.poppins(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     _glassIcon(Icons.search),
//                     const SizedBox(width: 8),
//
//                     Stack(
//                       children: [
//                         _glassIcon(Icons.notifications),
//                         Positioned(
//                           right: 6,
//                           top: 6,
//                           child: Container(
//                             height: 8,
//                             width: 8,
//                             decoration: const BoxDecoration(
//                               color: Colors.red,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//
//                     const SizedBox(width: 8),
//
//                     const CircleAvatar(
//                       radius: 18,
//                       backgroundImage: AssetImage("assets/images/user.png"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _glassIcon(IconData icon) {
//     return Container(
//       height: 40,
//       width: 40,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Icon(icon, color: Colors.white, size: 20),
//     );
//   }
//
//   // =========================================================
//   // ================= LOW BALANCE ============================
//   // =========================================================
//
//   Widget _buildLowBalanceCard() {
//     return Obx(() {
//       final category = accCtrl.categoryInfo.value;
//       if (category == null) return const SizedBox();
//
//       double receivableAmount = double.tryParse(
//           dashCtrl.providerDashboardModel?.content?.providerInfo?.owner?.account?.accountReceivable?.toString() ?? "0") ?? 0;
//
//       double transactionAmount =
//       dashCtrl.getTransactionAmountAmount(0.0, receivableAmount);
//
//       double currentBalance = transactionAmount.floorToDouble();
//       double minimumBalance = category.minimumBalance.toDouble().floorToDouble();
//
//       if (currentBalance >= minimumBalance) return const SizedBox();
//
//       double shortAmount = minimumBalance - currentBalance;
//
//       return Container(
//         margin: const EdgeInsets.only(bottom: 12),
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
//         ),
//         child: Text(
//           "Low balance! Add ₹${shortAmount.toStringAsFixed(0)}",
//           style: const TextStyle(color: Colors.redAccent),
//         ),
//       );
//     });
//   }
//
//   // =========================================================
//   // ================= CATEGORY CARD ==========================
//   // =========================================================
//
//   Widget _buildCategoryCard() {
//     return Obx(() {
//       final category = accCtrl.categoryInfo.value;
//       if (category == null) {
//         return const Center(child: CircularProgressIndicator());
//       }
//
//       return Container(
//         margin: const EdgeInsets.only(bottom: 12),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Row(
//           children: [
//             const Icon(Icons.miscellaneous_services, color: Color(0xFF207FA7)),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Text(
//                 category.categoryName,
//                 style: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//             ),
//             Text("₹${category.minimumBalance}"),
//           ],
//         ),
//       );
//     });
//   }
// }
