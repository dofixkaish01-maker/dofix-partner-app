import 'package:flutter/material.dart';

import '../../model/service_model.dart';
import '../../widgets/custom_image_viewer.dart';
import 'custom_button_widget.dart';

class ServiceContainer extends StatelessWidget {
  final ServiceModel? serviceModel;
  const ServiceContainer({super.key, this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: CustomNetworkImageWidget(
          image: serviceModel?.thumbnailFullPath ?? "",
          height: 91,
          width: 91,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceModel?.name ?? "",
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  serviceModel?.ratingCount?.toString() ?? "0",
                  maxLines: 1,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.star, color: Colors.yellow, size: 13),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              serviceModel?.category?.name?.toString() ?? "0",
              maxLines: 1,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              "₹ ${(double.tryParse(serviceModel?.minBiddingPrice ?? "0")?.toInt() ?? 0)}",
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF207FA7)),
            ),
            const SizedBox(height: 5),
          ],
        ),
        trailing: SizedBox(
          width: 70, // Set a fixed width for the trailing widget
          child: CustomButtonWidget(
            height: 40,
            onPressed: () {},
            buttonText: "Add",
            transparent: false,
            textColor: Colors.white,
            borderSideColor: const Color(0xFF207FA7),
          ),
        ),
      ),
    );
  }
}
