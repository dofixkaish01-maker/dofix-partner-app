import 'dart:async';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  }



  void _route() async {
    await Future.delayed(Duration(seconds: 2));

    bool loggedIn = await Get.find<AuthController>().isLoggedIn();

    if (loggedIn) {
      Get.offNamed(RouteHelper.getDashboardRoute()); //  remove splash from stack
    } else {
      Get.offNamed(RouteHelper.getLoginRoute()); //  remove splash from stack
    }
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
          padding: EdgeInsets.all(Dimensions.paddingSize100),
          child: Center(
            child: Image.asset(
              Images.iclogo,
            ),
          ),
        ),
      ),
    );
  }
}
