import 'package:dofix_technichian/model/booking_details_content/booking_details_model.dart';
import 'package:dofix_technichian/utils/dimensions.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomNetworkImageWidget(
              image: detail.service?.coverImageFullPath ?? "",
              height: 55,
              width: 70,
            ),
            SizedBox(width: Dimensions.paddingSize8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  detail.variantKey ?? "",
                  style: TextStyle(
                    fontSize: Dimensions.fontSize14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(height: Dimensions.paddingSize4),

                Text(
                  detail.serviceName ?? "",
                  style: TextStyle(
                    fontSize: Dimensions.fontSize12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),

                SizedBox(height: Dimensions.paddingSize4),

                Text(
                  "₹${detail.serviceCost.toString()}",
                  style: TextStyle(
                    fontSize: Dimensions.fontSize13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
        Flexible(
          child: Container(
            height: 34,
            width: 100,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF207FA8).withAlpha(
                (0.1 * 255).toInt(),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "X ${detail.quantity ?? 0}",
                    style: TextStyle(
                      fontSize: Dimensions.fontSize13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF207FA8),
                    ),
                  ),

                  Text(
                    " = ${detail.totalCost.toString()}",
                    style: TextStyle(
                      fontSize: Dimensions.fontSize13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF207FA8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
