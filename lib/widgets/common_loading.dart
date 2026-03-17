import 'package:dofix_technichian/widgets/full_screen_dot_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../utils/theme.dart';

void showLoading() {
  if (Get.isDialogOpen != true) {
    Get.dialog(
      Center(
        child:FullScreenDotWaveLoader(isLoading: true)
      ),
      barrierDismissible: false,
    );
  }
}

void hideLoading() {
  if (Get.isDialogOpen == true) {
    Get.back();
  }
}
