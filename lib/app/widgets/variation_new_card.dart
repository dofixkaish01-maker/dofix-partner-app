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

  _addToCart() {
    dashboardController.addAddonToCart(
      serviceId: widget.serviceId,
      variantKey: widget.variantKey,
      serviceName: widget.serviceName,
      variantName: widget.serviceVariationName,
      price: int.parse(widget.serviceDiscountedPrice),
      mrpPrice: int.parse(widget.serviceMrpPrice),
      duration: widget.serviceTimeDuration,
      description: widget.serviceDescription,
      thumbnailPath: widget.thumbnailPath,
      variationId: widget.variationId,
    );
  }

  @override
  Widget build(BuildContext context) {
    log("Service id : ${widget.serviceId} , Variant Key : ${widget.variantKey}");

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        /// 🔥 SUBTLE BORDER
        border: Border.all(
          color: const Color(0xFF207FA8).withOpacity(0.15),
          width: 1,
        ),

        /// 🔥 SOFT SHADOW
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// SERVICE NAME
                Text(
                  widget.serviceName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                /// PRICE + MRP + TIME
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: [
                    /// PRICE CHIP
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF207FA8).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "₹${widget.serviceDiscountedPrice}",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF207FA8),
                        ),
                      ),
                    ),

                    /// MRP
                    if (widget.serviceMrpPrice != "0.0" &&
                        widget.serviceMrpPrice != "null" &&
                        widget.serviceMrpPrice != "0")
                      Text(
                        "₹${widget.serviceMrpPrice}",
                        style: TextStyle(
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey.shade600,
                        ),
                      ),

                    /// TIME
                    if (widget.serviceTimeDuration != "null")
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.schedule,
                              size: 12, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            _formatDuration(widget.serviceTimeDuration),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),

          /// RIGHT ACTION AREA
          GetBuilder<DashBoardController>(
            builder: (controller) {
              final quantity = controller.getAddonQuantity(
                  widget.serviceId, widget.variantKey);

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: quantity > 0
                    ? Container(
                  key: const ValueKey("counter"),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF207FA8), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// DECREASE
                      InkWell(
                        onTap: () {
                          controller.updateAddonQuantity(
                            widget.serviceId,
                            widget.variantKey,
                            increment: false,
                          );
                        },
                        child: Container(
                          width: 32,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFF207FA8),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9),
                              bottomLeft: Radius.circular(9),
                            ),
                          ),
                          child: Icon(
                            quantity > 1
                                ? Icons.remove
                                : Icons.delete,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),

                      /// COUNT
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF207FA8),
                          ),
                        ),
                      ),

                      /// INCREASE
                      InkWell(
                        onTap: () {
                          controller.updateAddonQuantity(
                            widget.serviceId,
                            widget.variantKey,
                            increment: true,
                          );
                        },
                        child: Container(
                          width: 32,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFF207FA8),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(9),
                              bottomRight: Radius.circular(9),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : InkWell(
                  key: const ValueKey("add"),
                  onTap: _addToCart,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 36,
                    width: 76,
                    decoration: BoxDecoration(
                      color: const Color(0xFF207FA8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.5,
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
