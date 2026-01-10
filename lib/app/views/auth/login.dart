import 'dart:developer';

import 'package:dofix_technichian/app/views/HtmlPage/html_pages.dart';
import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/app/widgets/custom_textfield.dart';
import 'package:dofix_technichian/controllers/auth_controller.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/model/pages_model.dart';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:dofix_technichian/utils/sizeboxes.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.icLoginBg),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              // Wrap the Form in SingleChildScrollView
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.3, // Adjust height dynamically
                      child: Center(
                        child: Image.asset(
                          Images.iclogoWhite,
                          height: 100,
                          width: 160,
                        ),
                      ),
                    ),
                    Container(
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius40),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        child: Column(
                          children: [
                            sizedBox50(),
                            Text(
                              "Login",
                              style: albertSansBold.copyWith(
                                fontSize: Dimensions.fontSize30,
                              ),
                            ),
                            sizedBox8(),
                            Text(
                              "Enter your phone number to login",
                              style: albertSansRegular.copyWith(
                                fontSize: Dimensions.fontSize12,
                              ),
                            ),
                            sizedBox30(),
                            CustomTextField(
                              isNumber: true,
                              inputType: TextInputType.number,
                              controller: _phoneController,
                              isPhone: true,
                              hintText: "Enter your mobile number",
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Phone No';
                                } else if (!RegExp(r'^\d{10}$')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid 10-digit Phone No';
                                }
                                return null;
                              },
                            ),
                            sizedBox20(),
                            CustomButtonWidget(
                              buttonText: "SEND OTP",
                              onPressed: () {
                                controller
                                    .sendOtpApi(_phoneController.text.trim());
                              },
                            ),
                            sizedBox20(),
                            const Text(
                              'By logging in, you agree to our ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                            ),
                            sizedBox4(),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      log("Terms & Conditions");
                                      Get.to(() => HtmlContentScreen(
                                          title: "Terms & Conditions",
                                          htmlContent:
                                              (Get.find<DashBoardController>()
                                                          .apiResponse
                                                          .content
                                                          .termsAndConditions ??
                                                      PageInfo(
                                                          id: '',
                                                          key: '',
                                                          value: '',
                                                          type: '',
                                                          isActive: 0,
                                                          createdAt: '',
                                                          updatedAt: '',
                                                          translations: []))
                                                  .value));
                                    },
                                    child: Text(
                                      ' Terms & Condition',
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.fontSize12,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    ' and ',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSize12,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      log("Privacy Policy");
                                      Get.to(() => HtmlContentScreen(
                                          title: "Privacy Policy",
                                          htmlContent:
                                              (Get.find<DashBoardController>()
                                                          .apiResponse
                                                          .content
                                                          .privacyPolicy ??
                                                      PageInfo(
                                                          id: '',
                                                          key: '',
                                                          value: '',
                                                          type: '',
                                                          isActive: 0,
                                                          createdAt: '',
                                                          updatedAt: '',
                                                          translations: []))
                                                  .value));
                                    },
                                    child: Text(
                                      ' Privacy Policy',
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.fontSize12,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
