import 'package:dofix_technichian/model/booking_details_content/booking_details_model.dart';
import 'package:dofix_technichian/widgets/custom_image_viewer.dart';
import 'package:flutter/material.dart';

class CustomBookingDetailsItems extends StatelessWidget {
  final Detail detail;

  const CustomBookingDetailsItems({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomNetworkImageWidget(
              image: detail.service?.coverImageFullPath ?? "",
              height: 60,
              width: 70,
            ),
          ),

          const SizedBox(width: 12),

          /// TEXT SECTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// SERVICE NAME (top priority)
                Text(
                  detail.serviceName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 4),

                /// VARIANT
                Text(
                  detail.variantKey ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),

                const SizedBox(height: 6),

                /// PRICE
                Text(
                  "₹${detail.serviceCost}",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          /// RIGHT SIDE (CLEAN CALCULATION)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "x${detail.quantity ?? 0}",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "₹${detail.totalCost}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF207FA7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
