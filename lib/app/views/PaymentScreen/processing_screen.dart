import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SuccessFullScreen/success_full_screen.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await uploadData();
    });
  }

  Future<void> uploadData() async {
    // Simulate a network request
    debugPrint("Processing data...");
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => SuccessFullScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Processing"),
      ),
    );
  }
}
