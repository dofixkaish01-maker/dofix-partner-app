import 'package:flutter/material.dart';

class CustomAddonListingItem extends StatelessWidget {
  final String servicename;
  final String variantName;
  final String singleCost;
  final String quantityCount;
  final String totalCost;
  const CustomAddonListingItem({
    super.key,
    required this.servicename,
    required this.variantName,
    required this.singleCost,
    required this.quantityCount,
    required this.totalCost,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  variantName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  servicename,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withAlpha((0.3 * 255).toInt()),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "₹$singleCost",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                      "X $quantityCount",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF207FA8),
                      ),
                    ),
                    Text(
                      " = $totalCost",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF207FA8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
