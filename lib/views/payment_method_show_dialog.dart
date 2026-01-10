import 'package:flutter/material.dart';

class PaymentMethodShowDialog extends StatefulWidget {
  final double amount;

  const PaymentMethodShowDialog({
    super.key,
    required this.amount,
  });

  @override
  _PaymentMethodShowDialogState createState() => _PaymentMethodShowDialogState();
}

class _PaymentMethodShowDialogState extends State<PaymentMethodShowDialog> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Payment Method',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: Text('Pay Online'),
            value: 'Pay Online',
            groupValue: selectedPaymentMethod,
            onChanged: (String? value) {
              setState(() {
                selectedPaymentMethod = value;
              });
            },
            activeColor: Color(0xFF207FA8),
          ),
          RadioListTile<String>(
            title: Text(
                'Pay by Cash : Collect ₹${widget.amount.toStringAsFixed(2)}'),
            value: 'Pay by Cash',
            groupValue: selectedPaymentMethod,
            onChanged: (String? value) {
              setState(() {
                selectedPaymentMethod = value;
              });
            },
            activeColor: Color(0xFF207FA8),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Return null (canceled)
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: selectedPaymentMethod != null
              ? () {
                  Navigator.of(context).pop(selectedPaymentMethod);
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF207FA8),
            disabledBackgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(
            'Confirm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
