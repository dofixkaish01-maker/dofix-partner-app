import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../widgets/custom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  const DashboardScreen({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

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
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: !GetPlatform.isMobile
                ? const SizedBox()
                : CustomBottomNavBar(
                    currentIndex: currentPage,
                    onTap: (index) {
                      _setPage(index);
                    },
                  ),
            body: PageView.builder(
              controller: _pageController,
              itemCount: controller.screens.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return controller.screens[index];
              },
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
