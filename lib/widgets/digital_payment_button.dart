import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/views/payment_method_dialog.dart';
import 'package:dofix_technichian/widgets/custom_image_viewer.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class DigitalPaymentButtonWidget extends StatelessWidget {
  final DigitalPaymentMethod paymentMethod;
  final bool isSelected;

  const DigitalPaymentButtonWidget(
      {super.key, required this.paymentMethod, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.paddingSize12),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                color: Theme.of(context)
                    .secondaryHeaderColor
                    .withValues(alpha: 0.10))),
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault,
            vertical: Dimensions.paddingSizeDefault),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ? Colors.green : Theme.of(context).cardColor,
                  border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(0.4))),
              child: Icon(Icons.check,
                  color: isSelected ? Colors.white : Colors.transparent,
                  size: Dimensions.paddingSizeDefault),
            ),
            const SizedBox(width: Dimensions.paddingSizeDefault),

            // Wrap the Text with Expanded to avoid overflow
            Expanded(
              child: Text(
                paymentMethod.label ?? "",
                style: albertSansRegular.copyWith(
                    fontSize: Dimensions.fontSizeDefault),
                overflow:
                    TextOverflow.ellipsis, // Optional: shows '...' if too long
              ),
            ),

            const SizedBox(width: 8), // small gap before image

            CustomNetworkImageWidget(
              height: 25,
              width: 25, // Recommended to give width to image too
              fit: BoxFit.contain,
              image: '${paymentMethod.gatewayImageFullPath}',
            ),
          ],
        ),
      ),
    );
  }
}
