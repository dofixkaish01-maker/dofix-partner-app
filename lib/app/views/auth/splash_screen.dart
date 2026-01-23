import 'dart:async';
import 'package:dofix_technichian/app/views/auth/registration_fee_screen.dart';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../helper/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<DashBoardController>().getPagesData(isLogin: true);
    _route(); // Call the navigation function
    checkForAppUpdate();
  }

  Future<void> _route() async {
    await const Duration(seconds: 2);

    final authController = Get.find<AuthController>();
    final dashboardController = Get.find<DashBoardController>();

    final bool loggedIn = await authController.isLoggedIn();

    if (!loggedIn) {
      Get.offNamed(RouteHelper.getLoginRoute());
      return;
    }

    // Registration fee logic handled in DashboardController
    final int registrationFeeStatus =
        await dashboardController.isRegistrationFees();

    if (registrationFeeStatus == 0) {
      Get.offAll(() => const RegistrationFeeScreen());
    } else {
      Get.offNamed(RouteHelper.getDashboardRoute());
    }
  }

  // For checking latest update
  Future<void> checkForAppUpdate() async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        // FORCE UPDATE
        if (updateInfo.immediateUpdateAllowed) {
          await InAppUpdate.performImmediateUpdate();
        }

        // OPTIONAL UPDATE
        else if (updateInfo.flexibleUpdateAllowed) {
          await InAppUpdate.startFlexibleUpdate();
          await InAppUpdate.completeFlexibleUpdate();
        }
      }
    } catch (e) {
      print("Update check error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffffffff), Color(0xff207fa8)],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            Images.iclogo,
            height: 130,
            width: 130,
          ),
        ),
      ),
    );
  }
}


