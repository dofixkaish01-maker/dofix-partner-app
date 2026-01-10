

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      _route(); // Call the navigation function
  }
void _route() {
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(RouteHelper.getLoginRoute()); // Navigate after 2 seconds
    });
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
