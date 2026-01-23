import 'package:flutter/material.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F9FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff227FA8),
        title: const Text(
          "Notification",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ICON
            Center(
              child: Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  color: const Color(0xff227FA8).withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_active,
                  size: 36,
                  color: Color(0xff227FA8),
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// TITLE
            const Text(
              "Order Shipped Successfully",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            /// TIME
            const Text(
              "Today • 10:30 AM",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            /// DIVIDER
            const Divider(height: 1),
            const SizedBox(height: 20),

            /// MESSAGE
            const Text(
              "Your order has been shipped and is on its way to you. "
              "You can expect delivery within 2–3 business days. "
              "Thank you for shopping with us.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            /// OPTIONAL ACTION BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff227FA8),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // Navigate to order details or any screen
                },
                child: const Text(
                  "View Order",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
