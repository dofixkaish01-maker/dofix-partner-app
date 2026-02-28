import 'dart:async';

import 'package:dofix_technichian/app/views/home/component/top_component.dart';
import 'package:dofix_technichian/app/views/home/component/category_components.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';
import '../../../views/home/component/banner_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  final controller = Get.find<DashBoardController>();

  @override
  void initState() {
    super.initState();
    _startAutoRefresh();
  }

  void cancelAutoRefresh() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // void _startAutoRefresh() {
  //   _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
  //     await controller.getListOfBookings(isRefresh: true);
  //     await controller.getBookingCounts(getAccountInfoAlso: false);
  //   });
  // }
  void _startAutoRefresh() {
    _timer?.cancel(); // pehle old timer band
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      await controller.getListOfBookings(isRefresh: true);
      await controller.getBookingCounts(getAccountInfoAlso: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopComponent(),
                  // Visibility(.
                  //   visible: ((controller.bookingModel.data ?? []).isNotEmpty &&
                  //       controller.bookingModel.data != null),
                  //   child: SecondComponents(),
                  // ),
                  Visibility(
                    visible: controller.bookingModel.data?.isNotEmpty ?? false,
                    child: SecondComponents(),
                  ),
                  ThirdComponent(),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ),
      );
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
