import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RazorpayQRPaymentController extends GetxController
    implements GetxService {
  static const String _keyId = 'rzp_test_DZ43simWiGyPpB';
  static const String _keySecret = 'Z4a8ZijnjdK4e6OcaYULj3qK';
  static const String _baseUrl = 'https://api.razorpay.com/v1';

  static String get getKeyId => _keyId;
  static String get getKeySecret => _keySecret;
  static String get getBaseUrl => _baseUrl;

  Future<Map<String, dynamic>?> createPaymentLink({
    required int amount,
    required String description,
    String? customerName,
    String? customerEmail,
    String? customerContact,
  }) async {
    final url = Uri.parse('$_baseUrl/payment_links');
    final auth = 'Basic ${base64Encode(utf8.encode('$_keyId:$_keySecret'))}';

    final body = {
      "amount": amount,
      "currency": "INR",
      "description": description,
      "customer": {
        "name": customerName ?? "Customer",
        "email": customerEmail ?? "",
        "contact": customerContact ?? "",
      },
      "notify": {
        "sms": false,
        "email": false,
      },
      "reminder_enable": false,
      // "upi_link": true, // UPI links not supported in test mode
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': auth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  // Create QR Code for payments (works in test mode)
  Future<Map<String, dynamic>?> createQRCode({
    required String name,
    String? description,
    int? fixedAmount, // in paise, null for dynamic amount
  }) async {
    final url = Uri.parse('$_baseUrl/payments/qr_codes');
    final auth = 'Basic ${base64Encode(utf8.encode('$_keyId:$_keySecret'))}';

    final body = {
      "type": "upi_qr",
      "name": name,
      "usage": fixedAmount != null ? "single_use" : "multiple_use",
      "fixed_amount": fixedAmount != null,
      "payment_amount": fixedAmount,
      "description": description ?? "Payment for services",
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': auth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print('QR Code Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('QR Code Exception: $e');
      return null;
    }
  }

  // Check payment status
  Future<String?> checkPaymentLinkStatus(String paymentLinkId) async {
    final url = Uri.parse('$_baseUrl/payment_links/$paymentLinkId');
    final auth = 'Basic ${base64Encode(utf8.encode('$_keyId:$_keySecret'))}';

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': auth},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data[
            'status']; // 'created', 'paid', 'partially_paid', 'expired', 'cancelled'
      }
    } catch (e) {
      print('Status check error: $e');
    }
    return null;
  }

  // Check QR Code payment status
  Future<Map<String, dynamic>?> checkQRCodeStatus(String qrCodeId) async {
    final url = Uri.parse('$_baseUrl/payments/qr_codes/$qrCodeId');
    final auth = 'Basic ${base64Encode(utf8.encode('$_keyId:$_keySecret'))}';

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': auth},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      print('QR Status check error: $e');
    }
    return null;
  }

  // Fetch payments made to a QR code
  Future<List<dynamic>?> getQRCodePayments(String qrCodeId) async {
    final url = Uri.parse('$_baseUrl/payments/qr_codes/$qrCodeId/payments');
    final auth = 'Basic ${base64Encode(utf8.encode('$_keyId:$_keySecret'))}';

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': auth},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['items'];
      }
    } catch (e) {
      print('Get payments error: $e');
    }
    return null;
  }
}
