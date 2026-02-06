import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  final bool isLast;

  const TransactionTile({
    super.key,
    required this.transaction,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    DateTime istDate = convertUtcToIst(transaction.date);
    String formattedDate = DateFormat('dd/MM/yyyy').format(istDate);
    String formattedTime = DateFormat('hh:mm a').format(istDate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: textGrey,
                        ),
                      ),
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: textGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Text(
                    '₹ ${transaction.amount}',
                    style: TextStyle(
                      color:
                      transaction.isCredit ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transaction.transactionBy,
                    style: TextStyle(
                      color:
                      transaction.isCredit ? textGrey : Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),

                  /// T-TYPE SHOWN HERE
                  Text(
                    transaction.type.isNotEmpty
                        ? transaction.type[0].toUpperCase() + transaction.type.substring(1)
                        : "",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: transaction.isCredit ? Colors.green : Colors.red,
                    ),
                  ),


                  if (transaction.bookingId != "")
                    Text(
                      'Booking ID: ${transaction.bookingId}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: textGrey,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

class TransactionModel {
  final DateTime date;
  final double amount;
  final bool isCredit;
  final String transactionBy;
  final String bookingId;

  ///  NEW FIELD
  final String type;

  const TransactionModel({
    required this.date,
    required this.amount,
    required this.isCredit,
    required this.transactionBy,
    required this.bookingId,
    required this.type,
  });
}

/// Utility function to convert UTC to IST
DateTime convertUtcToIst(DateTime utcDate) {
  if (utcDate.isUtc) {
    return utcDate.add(const Duration(hours: 5, minutes: 30));
  } else {
    return utcDate.toUtc().add(const Duration(hours: 5, minutes: 30));
  }
}
