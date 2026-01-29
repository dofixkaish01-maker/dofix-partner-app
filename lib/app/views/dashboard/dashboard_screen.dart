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

      // optional: category bhi yahin ensure ho
      await accCtrl.fetchCategory();

      // existing call
      await dashCtrl.getListOfBookings(isRefresh: false);
    });
  }

  final AccountController authController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
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
                        children: [
                          /// WALLET
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

                                final transactionAmount =
                                    controller.getTransactionAmountAmount(
                                        0.0, receivableAmount);

                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.009,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: const Color(0x19207FA7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          isSmallDevice ? 4 : 6),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.015,
                                        ),
                                        child: Image.asset(
                                          "assets/icons/ic_wallet.png",
                                          width: isSmallDevice
                                              ? 16
                                              : size.width * 0.045,
                                          height: isSmallDevice
                                              ? 16
                                              : size.width * 0.045,
                                        ),
                                      ),
                                      Text(
                                        '₹ $transactionAmount',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: const Color(0xFF207FA7),
                                          fontSize: isSmallDevice
                                              ? 12
                                              : size.width * 0.035,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.02),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(width: size.width * 0.010),

                          /// PROFILE
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AccountScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.010),
                              decoration: ShapeDecoration(
                                color: const Color(0x19207FA7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      isSmallDevice ? 4 : 6),
                                ),
                              ),
                              child: Icon(
                                Icons.person_2_outlined,
                                color: const Color(0xFF207FA7),
                                size: isSmallDevice ? 22 : size.width * 0.06,
                              ),
                            ),
                          ),


                          /// NOTIFICATION
                          IconButton(
                            iconSize: isSmallDevice ? 22 : size.width * 0.06,
                            onPressed: () {
                              Get.to(() => NotificationScreen());
                            },
                            icon: const Icon(
                              Icons.notifications_active,
                              color: Color(0xFF207FA7),
                            ),
                          ),
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

                            final dashboardController =
                                Get.find<DashBoardController>();

                            double walletBalance = double.tryParse(
                                    dashboardController
                                            .providerDashboardModel
                                            .content
                                            ?.providerInfo
                                            ?.owner
                                            ?.account
                                            ?.accountReceivable
                                            ?.toString() ??
                                        "0") ??
                                0;

                            double minimumBalance =
                                category.minimumBalance.toDouble();

                            if (walletBalance >= minimumBalance) {
                              return const SizedBox(); // balance ok → message hide
                            }

                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.redAccent),
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "Aapka current balance minimum balance se kam hai, kripya recharge karein.",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),

                          /// ================= CATEGORY INFO =================
                          Obx(() {
                            final category = authController.categoryInfo.value;

                            if (category == null) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              );
                            }

                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              // decoration: BoxDecoration(
                              //   color: Colors.redAccent.withOpacity(0.08),
                              //   borderRadius: BorderRadius.circular(10),
                              //   border: Border.all(
                              //     color: Colors.redAccent.withOpacity(0.4),
                              //   ),
                              // ),
                              child: Row(
                                children: [
                                  Icon(Icons.miscellaneous_services,
                                      color: Color(0xFF207FA7)),
                                  const SizedBox(width: 8),

                                  /// CATEGORY
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

                                  GestureDetector(
                                    onTap: () {
                                      // future me recharge dialog ya info dikha sakte ho
                                      // showRechargeDialog(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.redAccent.withOpacity(0.08),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color:
                                              Colors.redAccent.withOpacity(0.4),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(width: 6),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: "Min Balance ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "₹${category.minimumBalance}",
                                                  style: const TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
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
