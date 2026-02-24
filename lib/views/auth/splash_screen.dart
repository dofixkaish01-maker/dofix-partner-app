

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/tracking_controller.dart';
import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // 1 Request tracking first (important for iOS)
    await TrackingController.requestTracking();

    // 2️ Splash delay
    await Future.delayed(const Duration(seconds: 3));

    // 3️ Navigate once only
    Get.offNamed(RouteHelper.getLoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        decoration: BoxDecoration(
         gradient: LinearGradient(
      colors: [Color(0xffffffff), Color(0xff207fa8)],
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: Padding(
    padding:  EdgeInsets.all(Dimensions.paddingSize100),
    child: Center(
      child: Image.asset(Images.iclogo,),
    ),
  ),
      ),
    );
  }
}
