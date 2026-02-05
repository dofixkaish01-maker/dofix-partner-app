import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../utils/theme.dart';

void showLoading() {
  if (Get.isDialogOpen != true) {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(
          color: light.primaryColorDark,
        ),
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
