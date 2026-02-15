import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:universal_html/js.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/account_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../helper/route_helper.dart';
import '../../../widgets/custom_snack_bar.dart';

class RegistrationFeeScreen extends StatelessWidget {
  const RegistrationFeeScreen({super.key});

  static const Color primaryColor = Color(0xFF227FA8);
  static const String registrationFee = "1416";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      // ================= APP BAR =================
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: primaryColor.withOpacity(0.15),
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13, top: 10, bottom: 10),
          child: GestureDetector(
            onTap: () {
              Get.offAllNamed(RouteHelper.getLoginRoute());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: primaryColor.withOpacity(0.08),
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.back,
                    color: primaryColor,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Go back',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        // IconButton(
        //   splashRadius: 22,
        //   icon: Container(
        //     padding: const EdgeInsets.all(6),
        //     decoration: BoxDecoration(
        //       color: primaryColor.withOpacity(0.08),
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: const Icon(
        //       Icons.arrow_back_ios_new,
        //       size: 18,
        //       color: primaryColor,
        //     ),
        //   ),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Column(
          children: const [
            Text(
              "Registration Fee",
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "One time payment",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                final dashCtrl = Get.find<DashBoardController>();
                await dashCtrl.refreshAndNavigateIfPaid();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Obx(() {
                  final dashCtrl = Get.find<DashBoardController>();

                  //  Loading state (pull ke baad thoda rukega)
                  if (dashCtrl.isLoading.value) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 140),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  // Normal UI
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _topMessage(),
                      const SizedBox(height: 18),

                      /// USER INFO
                      // _userInfoCard(),

                      const SizedBox(height: 22),
                      _amountCard(),
                      const SizedBox(height: 22),
                      _infoMessage(),
                    ],
                  );
                }),
              ),
            ),
          ),
          _bottomPaySection(context),
        ],
      ),
    );
  }

  // ================= TOP TEXT =================
  Widget _topMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Registration complete karne ke liye ye payment mandatory hai",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          "Payment ke baad hi aapka partner account activate hoga.",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  // ================= USER INFO CARD =================
  // Widget _userInfoCard() {
  //   final dashCtrl = Get.find<DashBoardController>();
  //
  //   final name = dashCtrl
  //           .providerDashboardModel.content?.providerInfo?.owner?.firstName ??
  //       "NA";
  //
  //   final phone =
  //       dashCtrl.providerDashboardModel.content?.providerInfo?.owner?.phone ??
  //           "NA";
  //
  //   return Container(
  //     padding: const EdgeInsets.all(18),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(18),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.06),
  //           blurRadius: 14,
  //           offset: const Offset(0, 6),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         // -------- Avatar --------
  //         Container(
  //           height: 54,
  //           width: 54,
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               colors: [
  //                 primaryColor.withOpacity(0.9),
  //                 primaryColor.withOpacity(0.6),
  //               ],
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //             ),
  //             borderRadius: BorderRadius.circular(16),
  //           ),
  //           alignment: Alignment.center,
  //           child: const Text(
  //             "P", // Provider / Partner / User ka first letter
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 22,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //
  //         const SizedBox(width: 14),
  //
  //         // -------- User Info --------
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 name,
  //                 style: const TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(
  //                 phone,
  //                 style: const TextStyle(
  //                   fontSize: 13,
  //                   color: Colors.black54,
  //                 ),
  //               ),
  //               const SizedBox(height: 6),
  //
  //               // -------- Hint Text --------
  //               Row(
  //                 children: const [
  //                   Icon(
  //                     Icons.verified,
  //                     size: 14,
  //                     color: Colors.green,
  //                   ),
  //                   SizedBox(width: 4),
  //                   Text(
  //                     "Ye details aapke account se linked hain",
  //                     style: TextStyle(
  //                       fontSize: 12,
  //                       color: Colors.black45,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // ================= AMOUNT CARD =================
  Widget _amountCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // -------- Registration Fee --------
          _amountTile(
            icon: Icons.receipt_long,
            title: "Registration Fee",
            subtitle: "One-time partner registration charge",
            amount: "₹1200",
            bgColor: const Color(0xFF227FA8).withOpacity(0.08),
            iconColor: const Color(0xFF227FA8),
          ),

          const SizedBox(height: 14),

          // -------- GST --------
          _amountTile(
            icon: Icons.account_balance,
            title: "GST (18%)",
            subtitle: "Government tax applicable on services",
            amount: "₹216",
            bgColor: Colors.orange.withOpacity(0.10),
            iconColor: Colors.orange,
          ),

          const SizedBox(height: 18),

          const Divider(height: 30),

          // -------- Total --------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Payable Amount",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF227FA8).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "₹1,416",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF227FA8),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= INFO BOX =================
  Widget _infoMessage() {
    const Color orangePrimary = Color(0xFFF2994A);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            orangePrimary.withOpacity(0.12),
            orangePrimary.withOpacity(0.04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: orangePrimary.withOpacity(0.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON BOX
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: orangePrimary.withOpacity(0.18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.lock_outline,
              color: orangePrimary,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),

          /// HIGHLIGHT TEXT
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.5,
                  color: Colors.black.withOpacity(0.75),
                  fontFamily: 'Poppins',
                ),
                children: const [
                  TextSpan(
                    text: "Ye ",
                  ),
                  TextSpan(
                    text: "one-time registration fee ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: orangePrimary,
                    ),
                  ),
                  TextSpan(
                    text: "hai. Payment ke baad aapka ",
                  ),
                  TextSpan(
                    text: "partner account ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "fully ",
                  ),
                  TextSpan(
                    text: "activate ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: orangePrimary,
                    ),
                  ),
                  TextSpan(
                    text: "ho jaayega aur saare features unlock ho jaayenge.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= BOTTOM PAY BAR =================
  Widget _bottomPaySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 22),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Total Amount",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 2),
              Text(
                "1416",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 5,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          const Text(
                            "Choose Payment Method",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 20),

                          /// Razorpay
                          ListTile(
                            leading: const Icon(Icons.payment, color: Colors.blue),
                            title: const Text("Pay with Razorpay"),
                            subtitle: const Text("Cards, UPI, Netbanking"),
                            onTap: () async {
                              Navigator.pop(context);

                              final authCtrl = Get.find<AccountController>();
                              final dashCtrl = Get.find<DashBoardController>();

                              await authCtrl.userWalletRecharge(
                                amount: registrationFee,
                                providerId: dashCtrl
                                    .providerDashboardModel.content?.providerInfo?.id ??
                                    "",
                              );
                            },
                          ),

                          const Divider(),

                          /// UPI
                          ListTile(
                            leading: const Icon(Icons.qr_code, color: Colors.green),
                            title: const Text("QR with UPI"),
                            subtitle: const Text("GPay, PhonePe, Paytm"),
                            onTap: () async {
                              Navigator.pop(context);

                              final uri = Uri(
                                scheme: 'upi',
                                host: 'pay',
                                queryParameters: {
                                  'pa': 'rzpdofixtechnologi410020.rzp@ypbiz',
                                  'pn': 'Dofix Technologies Pvt Ltd',
                                  'am': '1416.00',
                                  'cu': 'INR',
                                  'tn': 'Registration Fees',
                                },
                              );

                              try {
                                await launchUrl(uri, mode: LaunchMode.externalApplication);
                              } catch (e) {
                                showCustomSnackBar("Unable to open UPI app");
                              }

                            },
                          ),

                        ],
                      ),
                    );
                  },
                );
              },
              // onPressed: () {
              //   showModalBottomSheet(
              //     context: context,
              //     shape: const RoundedRectangleBorder(
              //       borderRadius:
              //           BorderRadius.vertical(top: Radius.circular(20)),
              //     ),
              //     builder: (context) {
              //       return Padding(
              //         padding: const EdgeInsets.all(16),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Container(
              //               width: 50,
              //               height: 5,
              //               margin: const EdgeInsets.only(bottom: 16),
              //               decoration: BoxDecoration(
              //                 color: Colors.grey[400],
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //             ),
              //
              //             const Text(
              //               "Choose Payment Method",
              //               style: TextStyle(
              //                   fontSize: 18, fontWeight: FontWeight.bold),
              //             ),
              //
              //             const SizedBox(height: 20),
              //
              //             /// Razorpay
              //             ListTile(
              //               leading:
              //                   const Icon(Icons.payment, color: Colors.blue),
              //               title: const Text("Pay with Razorpay"),
              //               onTap: () async {
              //                 final authCtrl = Get.find<AccountController>();
              //                 final dashCtrl = Get.find<DashBoardController>();
              //                 await authCtrl.userWalletRecharge(
              //                   amount: registrationFee,
              //                   providerId: dashCtrl.providerDashboardModel
              //                           .content?.providerInfo?.id ??
              //                       "",
              //                 );
              //               },
              //             ),
              //
              //             /// UPI
              //             ListTile(
              //               leading:
              //                   const Icon(Icons.qr_code, color: Colors.green),
              //               title: const Text("QR With UPI"),
              //               onTap: () async {
              //                 Navigator.pop(context);
              //
              //                 final Uri uri = Uri.parse(
              //                   'upi://pay?pa=dofix.limited66@kotak'
              //                   '&pn=DOFIX%20TECHNOLOGIES%20PRIVATE%20LIMITED'
              //                   '&am=1416'
              //                   '&cu=INR',
              //                 );
              //
              //                 if (await canLaunchUrl(uri)) {
              //                   await launchUrl(
              //                     uri,
              //                     mode: LaunchMode.externalApplication,
              //                   );
              //                 } else {
              //                   showCustomSnackBar("No UPI app found");
              //                 }
              //               },
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   );
              // },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Pay Securely",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _openUpiQrScanner(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Stack(
          children: [
            MobileScanner(
              onDetect: (BarcodeCapture capture) {
                final String? qrCode = capture.barcodes.first.rawValue;
                if (qrCode == null) return;

                Navigator.pop(context);

                final uri = Uri.parse(qrCode);

                canLaunchUrl(uri).then((canLaunch) {
                  if (canLaunch) {
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    showCustomSnackBar("Invalid UPI QR");
                  }
                });
              },
            ),

            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Align QR within frame",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}


Widget _amountTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required String amount,
  required Color bgColor,
  required Color iconColor,
}) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        // Icon
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor),
        ),

        const SizedBox(width: 12),

        // Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        // Amount
        Text(
          amount,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

// ================= AMOUNT ROW =================
class _AmountRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;

  const _AmountRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isTotal ? RegistrationFeeScreen.primaryColor : Colors.black,
          ),
        ),
      ],
    );
  }
}

// lib/screens/pay_screen.dart
class PayScreen extends StatelessWidget {
  PayScreen({super.key});

  // =====================
  // Merchant Details
  // =====================
  final String vpa = 'dofix.limited66@kotak';
  final String payeeName = 'DOFIX TECHNOLOGIES PRIVATE LIMITED';
  final String currency = 'INR';

  // Fixed amount (optional)
  // Agar empty rakho → user UPI app me dalega
  final String amount = '1416';

  Future<void> _payWithUpi(BuildContext context) async {
    final String txnRef = DateTime.now().millisecondsSinceEpoch.toString();

    final Uri uri = Uri(
      scheme: 'upi',
      host: 'pay',
      queryParameters: {
        'pa': vpa,
        'pn': payeeName,
        'tr': txnRef,
        'tn': 'Payment',
        'am': amount,
        'cu': 'INR',
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No UPI app found')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay via UPI'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _payWithUpi(context),
          child: const Text('Pay Now'),
        ),
      ),
    );
  }
}
