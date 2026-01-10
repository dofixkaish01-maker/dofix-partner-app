import 'dart:convert';

import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/views/DigitalPaymentMethod/digital_payment_method_view.dart';
import 'package:dofix_technichian/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:universal_html/html.dart' as html;

import '../utils/app_constants.dart';
import '../utils/dimensions.dart';
import 'PaymentScreen/payment_screen.dart';

class PaymentMethodDialog extends StatelessWidget {
  final double amount;

  const PaymentMethodDialog({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    List<DigitalPaymentMethod> paymentMethodList =
        Get.find<DashBoardController>()
                .configModel
                .content
                ?.paymentMethodList ??
            [];

    return GetBuilder<DashBoardController>(builder: (dashboardController) {
      return Container(
        width: Dimensions.webMaxWidth,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize30,
            vertical: Dimensions.paddingSize12),
        decoration: BoxDecoration(
          // border: Border.all(color: Theme.of(context).colorScheme.primary),
          color: Get.isDarkMode
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Container(
              height: 5,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).hintColor.withValues(alpha: 0.15)),
            ),
            const SizedBox(height: Dimensions.paddingSize12),
            Row(children: [
              Text(" ${'Choose Payment Method'.tr} ",
                  style: albertSansRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault)),
              // Expanded(
              //     child: Text('Click One Of The Option Below'.tr,
              //         style: albertSansRegular.copyWith(
              //             fontSize: Dimensions.fontSize14,
              //             color: Theme.of(context).hintColor))),
            ]),
            (paymentMethodList.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: Dimensions.paddingSizeDefault),
                    child: DigitalPaymentMethodView(
                      paymentList: paymentMethodList,
                      tooltipController: JustTheController(),
                      fromPage: '',
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeDefault,
                        vertical: Dimensions.paddingSize30),
                    child: Text(
                      "No Payment Method Available".tr,
                      style: albertSansRegular.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color),
                    ),
                  ),
            CustomButtonWidget(
              buttonText: "select".tr,
              onPressed: () {
                debugPrint("Payment Method Index: ${dashboardController.paymentMethodIndex}");
                if (paymentMethodList.isEmpty) {
                  showCustomSnackBar("No Payment Method Available".tr);
                } else if (dashboardController.paymentMethodIndex == -1) {
                  showCustomSnackBar("Select Payment Method".tr);
                } else {
                  String hostname = html.window.location.hostname!;
                  String protocol = html.window.location.protocol;
                  String port = html.window.location.port;
                  String? path = html.window.location.pathname;

                  DigitalPaymentMethod paymentMethod;
                  paymentMethod =
                      paymentMethodList[dashboardController.paymentMethodIndex];

                  String platform = GetPlatform.isWeb ? "web" : "app";

                  String callbackUrl = GetPlatform.isWeb
                      ? "$protocol//$hostname:$port$path"
                      : AppConstants.baseUrl;

                  String providerID = Get.find<DashBoardController>()
                      .providerModel
                      .content!
                      .id ;

                  String url = '';

                  url =
                      '${AppConstants.baseUrl}payment?payment_method=${paymentMethod.gateway}&provider_id=$providerID&access_token=${base64Url.encode(utf8.encode(providerID))}'
                      '&callback=$callbackUrl&amount=$amount&payment_platform=$platform&is_pay_to_admin=true';
               debugPrint("url api: $url");
                  Get.back();

                  Get.to(()=> PaymentScreen(url:url, fromPage: "dashboard",));
                }
              },
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
          ],
        ),
      );
    });
  }
}


class DigitalPaymentMethod {
  String? gateway;
  String? gatewayImage;
  String? gatewayImageFullPath;
  String? label;

  DigitalPaymentMethod({this.gateway, this.gatewayImage, this.label, this.gatewayImageFullPath});

  DigitalPaymentMethod.fromJson(Map<String, dynamic> json) {
    gateway = json['gateway'];
    gatewayImage = json['gateway_image'];
    gatewayImageFullPath = json['gateway_image_full_path'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gateway'] = gateway;
    data['gateway_image'] = gatewayImage;
    data['label'] = label;
    return data;
  }
}