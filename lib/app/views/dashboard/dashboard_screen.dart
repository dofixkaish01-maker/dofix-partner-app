import 'dart:async';

import 'package:dofix_technichian/controllers/auth_controller.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_nav_bar.dart';
import '../account/profile_screen.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("DashboardScreen initState");
      Get.find<DashBoardController>().getListOfBookings(isRefresh: false);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

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
                drawerButton: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    Images.iclogo,
                    height: 70,
                    width: 70,
                  ),
                ),
                menuWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => DashboardScreen(pageIndex: 3));
                      },
                      child: GetBuilder<DashBoardController>(
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
                        transactionAmount =
                            controller.getTransactionAmountAmount(
                                // payableAmount, receivableAmount);
                                0.0,
                                receivableAmount);
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: ShapeDecoration(
                            color: const Color(0x19207FA7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Image.asset(
                                  "assets/icons/ic_wallet.png",
                                  width: 18,
                                  height: 18,
                                ),
                              ),
                              Text(
                                // '₹ ${controller.providerDashboardModel.content?.providerInfo?.owner?.account?.receivedBalance ?? 0}',
                                '₹ $transactionAmount',
                                maxLines: 1,
                                style: TextStyle(
                                  color: const Color(0xFF207FA7),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.40,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AccountScreen());
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0x19207FA7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Icon(
                          Icons.person_2_outlined,
                          color: const Color(0xFF207FA7),
                          size: 30,
                        ),
                      ),
                    )
                  ],
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
              body:
                  // Naya_kaam()
                  PageView.builder(
                controller: _pageController,
                itemCount: controller.screens.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return controller.screens[index];
                },
              ),
            ),
          ),
        ),
      );
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
}
