import 'dart:convert';
import 'dart:developer';

import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/controllers/razorpay_qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

class RazorpayQRScreen extends StatefulWidget {
  final int amount;
  final String description;

  const RazorpayQRScreen({
    super.key,
    required this.amount,
    required this.description,
  });

  @override
  State<RazorpayQRScreen> createState() => _RazorpayQRScreenState();
}

class _RazorpayQRScreenState extends State<RazorpayQRScreen> {
  bool _isLoading = true;
  String? _qrData;
  String? _paymentLinkId;
  final dashboardController = Get.find<DashBoardController>();

  @override
  void initState() {
    dashboardController.transactionId.value = '';
    super.initState();
    _generateQRCode();
  }

  Future<void> _generateQRCode() async {
    final razorpay = RazorpayQRPaymentController();
    final result = await razorpay.createPaymentLink(
      amount: widget.amount,
      description: widget.description,
      customerName: "Customer Name",
      customerContact: "9540612770",
    );

    if (result != null) {
      setState(() {
        _paymentLinkId = result['id'];
        _qrData = result['short_url'];
        _isLoading = false;
      });

      _pollPaymentStatus();
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate QR code')),
      );
    }
  }

  Future<void> _pollPaymentStatus() async {
    Future.delayed(Duration(seconds: 3), () async {
      if (!mounted) return;

      final status = await _checkPaymentStatus(_paymentLinkId!);
      if (status == 'paid') {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Payment Successful!'),
              backgroundColor: Colors.green),
        );
      } else if (mounted) {
        _pollPaymentStatus(); // Continue polling
      }
    });
  }

  Future<String?> _checkPaymentStatus(String paymentLinkId) async {
    final url =
        Uri.parse('https://api.razorpay.com/v1/payment_links/$paymentLinkId');
    final auth =
        'Basic ${base64Encode(utf8.encode('${RazorpayQRPaymentController.getKeyId}:${RazorpayQRPaymentController.getKeySecret}'))}';

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': auth},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("Razorpay response : $data");

        // Extract transaction ID if payment is completed
        if (data['status'] == 'paid' &&
            data['payments'] != null &&
            data['payments'].isNotEmpty) {
          final payment = data['payments'][0];
          final transactionId = payment['payment_id'];
          dashboardController.transactionId.value = payment['payment_id'];
          log("Payment ID (Transaction ID): $transactionId");

          final method = payment['method'];
          final amount = payment['amount'];
          final createdAt = payment['created_at'];
          final status = payment['status'];

          log("Payment Method: $method");
          log("Amount: $amount paise");
          log("Created At: $createdAt");
          log("Payment Status: $status");
        }

        return data['status'];
      }
    } catch (e) {
      print('Error checking status: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR to Pay'),
        backgroundColor: Color(0xFF207FA8),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Pay ₹${(widget.amount / 100).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF207FA8),
                      ),
                    ),
                    SizedBox(height: 30),

                    // QR Code
                    if (_qrData != null)
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: QrImageView(
                          data: _qrData!,
                          version: QrVersions.auto,
                          size: 250.0,
                          backgroundColor: Colors.white,
                        ),
                      ),

                    SizedBox(height: 30),
                    Text(
                      'Scan using any UPI app',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 10),

                    // UPI Apps Icons (optional)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Google Pay • PhonePe • Paytm • BHIM'),
                      ],
                    ),

                    SizedBox(height: 30),

                    // Cancel Button
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        side: BorderSide(color: Colors.red),
                      ),
                      child: Text(
                        'Cancel Payment',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    // Stop polling when leaving screen
    super.dispose();
  }
}
