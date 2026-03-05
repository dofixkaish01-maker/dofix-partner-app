import 'dart:async';
import 'package:dofix_technichian/app/views/auth/registration_fee_screen.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../controllers/tracking_controller.dart';
import '../../../helper/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late AppsflyerSdk _appsFlyerSdk;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {

    ///  Request Tracking Permission
    await TrackingController.requestTracking();

    /// Facebook App Events
    final facebookAppEvents = FacebookAppEvents();
    facebookAppEvents.setAdvertiserTracking(enabled: true);
    facebookAppEvents.logEvent(name: "amrit_test_event");

    /// AppsFlyer Init
    await initAppsFlyer();

    /// Dashboard Data Preload
    Get.find<DashBoardController>().getPagesData(isLogin: true);

    ///  Check App Update
    await checkForAppUpdate();

    /// Delay & Route
    await Future.delayed(const Duration(seconds: 3));
    _route();
  }

  Future<void> _route() async {

    final authController = Get.find<AuthController>();
    final dashboardController = Get.find<DashBoardController>();

    final bool loggedIn = await authController.isLoggedIn();

    if (!loggedIn) {
      Get.offNamed(RouteHelper.getLoginRoute());
      return;
    }

    /// Registration Fee Check
    final int registrationFeeStatus =
    await dashboardController.isRegistrationFees();

    if (registrationFeeStatus == 0) {
      Get.offAll(() => const RegistrationFeeScreen());
    } else {
      Get.offNamed(RouteHelper.getDashboardRoute());
    }
  }

  Future<void> initAppsFlyer() async {

    final AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: "QPsc9zfWKAjutYjJgPVLWi",
      appId: "com.dofix.technician",
      showDebug: true,
    );

    _appsFlyerSdk = AppsflyerSdk(options);

    await _appsFlyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
    );
  }

  /// App Update Check
  Future<void> checkForAppUpdate() async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability ==
          UpdateAvailability.updateAvailable) {

        if (updateInfo.immediateUpdateAllowed) {
          await InAppUpdate.performImmediateUpdate();
        } else if (updateInfo.flexibleUpdateAllowed) {
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