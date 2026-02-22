import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height - 20),
            child: IntrinsicHeight(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      /// LOTTIE
                      Lottie.asset(
                        "assets/lottie/failed_payment.json",
                        height: height * 0.25,
                      ),

                      SizedBox(height: height * 0.02),

                      /// TITLE
                      const Text(
                        "Payment Failed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),

                      SizedBox(height: height * 0.01),

                      /// SUBTITLE
                      const Text(
                        "Oops! Something went wrong.\nYour transaction could not be completed.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),

                      SizedBox(height: height * 0.04),

                      /// TRY AGAIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back(); // go back to payment screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Try Again",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),

                      const Spacer(),

                      /// OPTIONAL: GO HOME BUTTON
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        child: const Text(
                          "Go to Login",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.055),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}