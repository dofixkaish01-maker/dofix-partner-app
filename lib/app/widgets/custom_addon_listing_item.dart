import 'package:flutter/material.dart';

class CustomAddonListingItem extends StatelessWidget {
  final String thumbnailFullPath;
  final String servicename;
  final String variantName;
  final String singleCost;
  final String quantityCount;
  final String totalCost;
  const CustomAddonListingItem({
    super.key,
    required this.thumbnailFullPath,
    required this.servicename,
    required this.variantName,
    required this.singleCost,
    required this.quantityCount,
    required this.totalCost,
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
          /// IMAGE (NEW ADD)
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child:
          //   thumbnailFullPath.isNotEmpty
          //       ? Image.network(
          //     thumbnailFullPath,
          //           width: 70,
          //           height: 70,
          //           fit: BoxFit.cover,
          //         )
          //       : Container(
          //           width: 70,
          //           height: 70,
          //           color: Colors.grey.withOpacity(0.2),
          //       ),
          // ),
          //
          // const SizedBox(width: 12),

          /// TEXT SECTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// SERVICE NAME
                Text(
                  servicename,
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
                  variantName,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),

                const SizedBox(height: 6),

                /// SINGLE PRICE
                Text(
                  "₹$singleCost",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
                "x$quantityCount",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "₹$totalCost",
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
