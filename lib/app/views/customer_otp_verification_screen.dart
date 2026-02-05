import 'dart:async';

import 'package:dofix_technichian/app/views/shuru_kare.dart';
import 'package:dofix_technichian/controllers/auth_controller.dart';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:dofix_technichian/utils/sizeboxes.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/dashboard_controller.dart';
import '../../helper/route_helper.dart';
import '../../views/dashboard/dashboard_screen.dart';

class CustomerOtpVerificationScreen extends StatefulWidget {
  final String phoneNo;
  final String bookingId;

  const CustomerOtpVerificationScreen({
    super.key,
    required this.phoneNo,
    required this.bookingId,
  });

  @override
  State<CustomerOtpVerificationScreen> createState() =>
      _CustomerOtpVerificationScreenState();
}

class _CustomerOtpVerificationScreenState
    extends State<CustomerOtpVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.icLoginBg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    /// LOGO
                    Expanded(
                      child: Image.asset(
                        Images.iclogoWhite,
                        height: 100,
                        width: 160,
                      ),
                    ),

                    /// OTP CARD
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft:
                            Radius.circular(Dimensions.radius40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              Dimensions.paddingSizeDefault),
                          child: Column(
                            children: [
                              sizedBox40(),

                              /// TITLE
                              Text(
                                "Booking verification",
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimensions.fontSize24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              sizedBox10(),

                              /// SUBTITLE
                              Text(
                                "Enter OTP sent to your phone number",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: Dimensions.fontSize13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              sizedBox30(),

                              //
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSize4,
                                ),
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _otpController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 6,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "Enter OTP",
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      letterSpacing: 4,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(Dimensions.radius10),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(Dimensions.radius10),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(Dimensions.radius10),
                                      borderSide: const BorderSide(
                                        color: redColor,
                                        width: 1,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(Dimensions.radius10),
                                      borderSide: const BorderSide(
                                        color: redColor,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().length != 4) {
                                      return "Enter valid 4-digit OTP";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              sizedBox20(),

                            // verify otp button
                            // ElevatedButton(
                            //   onPressed: () {
                            //     var dashboardController=Get.find<DashBoardController>();
                            //     String phone = dashboardController
                            //         .providerDashboardModel
                            //         .content
                            //         ?.providerInfo
                            //         ?.owner
                            //         ?.phone ?? "";
                            //
                            //     // agar +91 already hai to dobara mat lagao
                            //     if (!phone.startsWith('+')) {
                            //       phone = '+91$phone';
                            //     }
                            //
                            //     Get.find<AuthController>().verifyProviderOtpApi(
                            //       // phone: "7645973958", // provider
                            //       phone: phone, // correct provider phone
                            //       otp: _otpController.text.trim(),
                            //       // bookingId: "7814990a-328f-48b0-a5a9-f9ee64212f6d",
                            //       bookingId: dashboardController.bookingDetails?.content?.id ?? "",
                            //       token: dashboardController.authRepo.apiClient.token.toString(),
                            //       // zoneId: "e8554d44-dcf2-47c7-8cf9-400d05a1340f",
                            //       zoneId: dashboardController.providerDashboardModel.content?.providerInfo?.zoneId ?? "",
                            //     );
                            //   },
                            //   child: const Text("Verify OTP"),
                            // ),

                              // verify otp button

                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                style:ElevatedButton.styleFrom(
                                  backgroundColor: primaryAppColor
                                ) ,
                                onPressed: () async {
                                  var dashboardController = Get.find<DashBoardController>();
                                  var authController = Get.find<AuthController>();

                                  String phone = dashboardController
                                      .providerDashboardModel
                                      .content
                                      ?.providerInfo
                                      ?.owner
                                      ?.phone ??
                                      "";

                                  if (!phone.startsWith('+')) {
                                    phone = '+91$phone';
                                  }

                                  bool isVerified = await authController.verifyProviderOtpApi(
                                    phone: phone,
                                    otp: _otpController.text.trim(),
                                    bookingId:
                                    dashboardController.bookingDetails?.content?.id ?? "",
                                    token: dashboardController.authRepo.apiClient.token.toString(),
                                    zoneId: dashboardController.providerDashboardModel
                                        .content
                                        ?.providerInfo
                                        ?.zoneId ??
                                        "",
                                  );
                                  if (isVerified) {
                                    /// 🔁 latest booking detail fetch karo
                                    await dashboardController.getBookingDetails(
                                      id: dashboardController.bookingDetails!.content!.id.toString(),
                                    );

                                    /// ❌ home mat bhejo
                                    /// ✅ directly booking detail (Completed state)
                                    Get.off(
                                          () => ShuruKare(
                                        id: dashboardController.bookingDetails!.content!.id.toString(),
                                      ),
                                    );
                                  }


                                },
                                child: const Text("Verify OTP",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                                ),),
                              ),
                            ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}