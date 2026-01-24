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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.icLoginBg),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: Image.asset(
                          Images.iclogoWhite,
                          height: 100,
                          width: 160,
                        ),
                      ),
                    ),

                    // ================= WHITE CONTAINER =================
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
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.fontSize30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            sizedBox8(),

                            Text("Enter your mobile number to continue",
                                style: GoogleFonts.poppins(
                                  fontSize: Dimensions.fontSize13,
                                  fontWeight: FontWeight.w400,
                                )),

                            const SizedBox(
                              height: 35,
                            ),

                            // ================= PHONE FIELD =================
                            CustomTextField(
                              isNumber: true,
                              inputType: TextInputType.number,
                              controller: _phoneController,
                              isPhone: true,
                              hintText: "Enter your mobile number",
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter mobile number';
                                } else if (!RegExp(r'^\d{10}$')
                                    .hasMatch(value)) {
                                  return 'Please enter valid 10-digit mobile number';
                                }
                                return null;
                              },
                            ),

                            sizedBox20(),

                            // ================= TERMS CHECKBOX =================
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: Theme.of(context).primaryColor,
                                  value: controller.isTermsAccepted,
                                  onChanged: (value) {
                                    controller.toggleTerms(value ?? false);
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    "I agree to the Terms & Conditions and Privacy Policy.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                              ],
                            ),

                            sizedBox10(),

                            // ================= SEND OTP BUTTON =================
                            CustomButtonWidget(
                              buttonText: "SEND OTP",
                              onPressed: controller.isTermsAccepted
                                  ? () {
                                      //  FORM VALIDATION
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }

                                      controller.sendOtpApi(
                                        _phoneController.text.trim(),
                                      );
                                    }
                                  : null, // disabled if checkbox unchecked
                            ),

                            const SizedBox(
                              height: 25,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: Colors.grey.shade700,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: "Continue karne se aap hamari ",
                                    ),
                                    TextSpan(
                                      text: "Terms & Conditions",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(
                                            () => HtmlContentScreen(
                                              title: "Terms & Conditions",
                                              htmlContent: (Get.find<
                                                              DashBoardController>()
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
                                                        translations: [],
                                                      ))
                                                  .value,
                                            ),
                                          );
                                        },
                                    ),
                                    const TextSpan(
                                      text: " aur ",
                                    ),
                                    TextSpan(
                                      text: "Privacy Policy",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(
                                            () => HtmlContentScreen(
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
                                                            translations: [],
                                                          ))
                                                      .value,
                                            ),
                                          );
                                        },
                                    ),
                                    const TextSpan(
                                      text: " se agree karte hain.",
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            sizedBox20(),
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
