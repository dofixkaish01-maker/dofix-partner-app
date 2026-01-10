import 'package:dofix_technichian/helper/route_helper.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/dimensions.dart';

class PaymentFailedDialog extends StatelessWidget {
  const PaymentFailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSize12),
        child: Icon(Icons.warning_amber_outlined, size: 70, color: Theme.of(context).primaryColor),
      ),
      Text(
        'Are Your Agree With this Payment Fail', textAlign: TextAlign.center,
        style: albertSansRegular.copyWith(fontSize: Dimensions.fontSize30, color: Colors.red),
      ),
      const SizedBox(height: Dimensions.paddingSize30),

      const SizedBox(height: Dimensions.paddingSizeDefault),

      TextButton(
        onPressed: () {
          Get.offAllNamed(RouteHelper.getInitialRoute());
        },
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor, minimumSize: const Size(Dimensions.webMaxWidth, 45), padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text('continue_with_payment_fail'.tr, textAlign: TextAlign.center, style: albertSansRegular.copyWith(color: Colors.white)),
      ),

    ]);
  }
}