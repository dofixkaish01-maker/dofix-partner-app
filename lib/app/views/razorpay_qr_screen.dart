import 'dart:async';
import 'package:dofix_technichian/controllers/razorpay_qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RazorpayQRScreen extends StatefulWidget {
  final int amount;
  final String description;
  final String? customerName;
  final String? customerContact;

  const RazorpayQRScreen({
    Key? key,
    required this.amount,
    required this.description,
    this.customerName,
    this.customerContact,
  }) : super(key: key);

  @override
  State<RazorpayQRScreen> createState() => _RazorpayQRScreenState();
}

class _RazorpayQRScreenState extends State<RazorpayQRScreen> {
  final _controller = Get.find<RazorpayQRPaymentController>();
  bool _isLoading = true;
  String? _qrData;
  String? _qrCodeId;
  String? _errorMessage;
  Timer? _pollTimer;
  bool _paymentReceived = false;

  @override
  void initState() {
    super.initState();
    _generateQRCode();
  }

  Future<void> _generateQRCode() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Option 1: Use QR Code API (works in test mode)
    final result = await _controller.createQRCode(
      name: widget.customerName ?? "Customer Payment",
      description: widget.description,
      fixedAmount: widget.amount, // Fixed amount QR
    );

    if (result != null) {
      setState(() {
        _qrCodeId = result['id'];
        _qrData = result['image_url']; // URL to QR image
        _isLoading = false;
      });

      // Start polling for payment
      _startPolling();
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to generate QR code. Please try again.';
      });
    }
  }

  void _startPolling() {
    _pollTimer = Timer.periodic(Duration(seconds: 3), (timer) async {
      if (!mounted || _paymentReceived) {
        timer.cancel();
        return;
      }

      final payments = await _controller.getQRCodePayments(_qrCodeId!);
      if (payments != null && payments.isNotEmpty) {
        // Payment received
        final payment = payments.first;
        if (payment['status'] == 'captured' ||
            payment['status'] == 'authorized') {
          setState(() {
            _paymentReceived = true;
          });
          timer.cancel();
          _showSuccessDialog();
        }
      }
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 30),
            SizedBox(width: 10),
            Text('Payment Successful!'),
          ],
        ),
        content: Text(
            'Your payment of ₹${(widget.amount / 100).toStringAsFixed(2)} has been received.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(
                  context, true); // Return to previous screen with success
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text('Done', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Scan to Pay'),
        backgroundColor: Color(0xFF207FA8),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Color(0xFF207FA8)),
                  SizedBox(height: 20),
                  Text(
                    'Generating QR Code...',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 64, color: Colors.red),
                        SizedBox(height: 20),
                        Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton.icon(
                          onPressed: _generateQRCode,
                          icon: Icon(Icons.refresh),
                          label: Text('Retry'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF207FA8),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),

                        // Amount Display
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Color(0xFF207FA8).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Amount to Pay',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '₹${(widget.amount / 100).toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF207FA8),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30),

                        // QR Code
                        Text(
                          'Scan QR Code',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Use any UPI app to scan and pay',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),

                        SizedBox(height: 20),

                        if (_qrData != null)
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 15,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: QrImageView(
                              data: _qrData!,
                              version: QrVersions.auto,
                              size: 280.0,
                              backgroundColor: Colors.white,
                              errorCorrectionLevel: QrErrorCorrectLevel.H,
                            ),
                          ),

                        SizedBox(height: 30),

                        // Payment Status
                        if (!_paymentReceived)
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: Colors.orange, width: 1),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.orange),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Waiting for payment...',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.orange[800],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        SizedBox(height: 20),

                        // UPI Apps Info
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_outline,
                                      size: 20, color: Colors.grey[600]),
                                  SizedBox(width: 8),
                                  Text(
                                    'Supported UPI Apps',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Google Pay • PhonePe • Paytm • BHIM • Amazon Pay',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30),

                        // Cancel Button
                        OutlinedButton.icon(
                          onPressed: () => Navigator.pop(context, false),
                          icon: Icon(Icons.close),
                          label: Text('Cancel Payment'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: BorderSide(color: Colors.red),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),

                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
    );
  }
}
