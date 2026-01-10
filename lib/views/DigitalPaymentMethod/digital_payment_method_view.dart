import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/views/payment_method_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../widgets/digital_payment_button.dart';

class DigitalPaymentMethodView extends StatelessWidget {
  final List<DigitalPaymentMethod> paymentList;
  final JustTheController tooltipController;
  final String fromPage;
  const DigitalPaymentMethodView({
    super.key,
    required this.paymentList,
    required this.tooltipController,
    required this.fromPage,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (dashboardController) {
      return SingleChildScrollView(
          child: ListView.builder(
              itemCount: paymentList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    dashboardController.updateIndex(index);
                  },
                  child: DigitalPaymentButtonWidget(
                    isSelected: dashboardController.paymentMethodIndex == index,
                    paymentMethod: paymentList[index],
                  ),
                );
              }));
    });
  }
}
