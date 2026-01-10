import 'dart:developer';

import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariationsNewCard extends StatefulWidget {
  final String serviceVariationName;
  final String serviceMrpPrice;
  final String serviceDiscountedPrice;
  final String serviceTimeDuration;
  final String serviceDescription;
  final String variantKey;
  final String serviceId;
  final String? thumbnailPath;
  final String variationId;
  final String serviceName;

  const VariationsNewCard(
      {super.key,
      required this.serviceDescription,
      required this.serviceVariationName,
      required this.serviceMrpPrice,
      required this.serviceDiscountedPrice,
      required this.serviceTimeDuration,
      required this.variantKey,
      required this.serviceId,
      this.thumbnailPath,
      required this.variationId,
      required this.serviceName});

  @override
  State<VariationsNewCard> createState() => _VariationsNewCardState();
}

class _VariationsNewCardState extends State<VariationsNewCard> {
  final DashBoardController dashboardController =
      Get.find<DashBoardController>();

  String _formatDuration(String duration) {
    if (duration.contains(':')) {
      try {
        final parts = duration.split(':');
        if (parts.length == 2) {
          final hours = int.tryParse(parts[0]);
          final minutes = int.tryParse(parts[1]);

          if (hours != null && minutes != null) {
            String result = '';
            if (hours > 0) {
              result += '$hours ${hours == 1 ? 'Hour' : 'Hours'}';
            }
            if (minutes > 0) {
              if (result.isNotEmpty) result += ' ';
              result += '$minutes ${minutes == 1 ? 'Min' : 'Mins'}';
            }
            return result.isNotEmpty ? result : duration;
          }
        }
      } catch (e) {
        print('Error formatting duration: $e');
      }
    }
    if (duration == "0") return "";
    return duration;
  }

  void _addToCart() {
    try {
      final price = int.tryParse(widget.serviceDiscountedPrice) ?? 0;
      final mrpPrice = int.tryParse(widget.serviceMrpPrice) ?? 0;

      dashboardController.addAddonToCart(
        serviceId: widget.serviceId,
        variantKey: widget.variantKey,
        serviceName: widget.serviceName,
        variantName: widget.serviceVariationName,
        price: price,
        mrpPrice: mrpPrice,
        duration: widget.serviceTimeDuration != "null"
            ? widget.serviceTimeDuration
            : null,
        description: widget.serviceDescription,
        thumbnailPath: widget.thumbnailPath,
        variationId: widget.variationId,
      );
    } catch (e) {
      log("Error adding to cart: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    log("Service id : ${widget.serviceId} , Variant Key : ${widget.variantKey}");
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.black.withAlpha((0.25 * 255).toInt()),
          width: 0.25,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  widget.serviceVariationName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: [
                    Text(
                      "₹${widget.serviceDiscountedPrice}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    if (widget.serviceMrpPrice != "0.0" &&
                        widget.serviceMrpPrice != "null" &&
                        widget.serviceMrpPrice != "0")
                      Column(
                        children: [
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            "₹${widget.serviceMrpPrice}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              decorationStyle: TextDecorationStyle.solid,
                              color:
                                  Colors.black.withAlpha((0.60 * 255).toInt()),
                            ),
                          ),
                        ],
                      ),
                    if (widget.serviceTimeDuration != "null")
                      Text(
                        _formatDuration(widget.serviceTimeDuration),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          GetBuilder<DashBoardController>(
            builder: (controller) {
              final quantity = controller.getAddonQuantity(
                  widget.serviceId, widget.variantKey);
              final isInCart = quantity > 0;

              return SizedBox(
                height: 35,
                child: isInCart
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF207FA8), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Decrease button
                            GestureDetector(
                              onTap: () {
                                controller.updateAddonQuantity(
                                  widget.serviceId,
                                  widget.variantKey,
                                  increment: false,
                                );
                              },
                              child: Container(
                                width: 30,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF207FA8),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Icon(
                                  quantity > 1 ? Icons.remove : Icons.delete,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                            // Quantity display
                            Container(
                              width: 35,
                              height: 35,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF207FA8),
                                  ),
                                ),
                              ),
                            ),
                            // Increase button
                            GestureDetector(
                              onTap: () {
                                controller.updateAddonQuantity(
                                  widget.serviceId,
                                  widget.variantKey,
                                  increment: true,
                                );
                              },
                              child: Container(
                                width: 30,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF207FA8),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: _addToCart,
                        child: Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFF207FA8),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
