import 'dart:developer';

import 'package:dofix_technichian/app/widgets/custom_appbar.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/app/widgets/variation_new_card.dart';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:dofix_technichian/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOnServicesScreen extends StatefulWidget {
  final String bookingId;
  const AddOnServicesScreen({super.key, required this.bookingId});

  @override
  State<AddOnServicesScreen> createState() => _AddOnServicesScreenState();
}

class _AddOnServicesScreenState extends State<AddOnServicesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await dashboardController.clearAddonCart();
      await dashboardController
          .getSavedAddOns(bookingId: widget.bookingId)
          .then((_) {
        final savedList = dashboardController.savedAddonModelList;
        if (savedList.isNotEmpty) {
          log("Savedlist length : ${savedList.length}");
          final services =
              dashboardController.addOnServiceListing.value?.content ?? [];

          for (final saved in savedList) {
            for (final service in services) {
              if (service.variations != null) {
                for (final variation in service.variations!) {
                  if ((variation.serviceId?.toString() ?? '') ==
                          (saved.serviceId ?? '') &&
                      (variation.variantKey ?? '') ==
                          (saved.variantKey ?? '')) {
                    for (int q = 0; q < (saved.quantity ?? 1); q++) {
                      dashboardController.addAddonToCart(
                        serviceId: variation.serviceId?.toString() ?? '',
                        variantKey: variation.variantKey ?? '',
                        serviceName: service.name ?? '',
                        variantName: variation.variant ?? '',
                        price: variation.price is String
                            ? int.tryParse(variation.price as String) ?? 0
                            : (variation.price is int
                                ? variation.price as int
                                : 0),
                        mrpPrice: variation.mrpPrice is String
                            ? int.tryParse(variation.mrpPrice as String) ?? 0
                            : (variation.mrpPrice is int
                                ? variation.mrpPrice as int
                                : 0),
                        duration: variation.varDuration?.toString(),
                        description: service.shortDescription ?? '',
                        thumbnailPath: service.thumbnailFullPath,
                        variationId: variation.id?.toString() ?? '',
                      );
                    }
                  }
                }
              }
            }
          }
        }
      });
    });
  }

  final dashboardController = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    final services =
        dashboardController.addOnServiceListing.value?.content ?? [];
    final allVariations = <Map<String, dynamic>>[];
    for (final service in services) {
      if (service.variations != null) {
        for (final variation in service.variations!) {
          allVariations.add({
            'service': service,
            'variation': variation,
          });
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Extra Services",
          isSearchButtonExist: false,
          isTitleExist: false,
          isBackButtonExist: true,
          drawerButton: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              Images.iclogo,
              height: 70,
              width: 70,
            ),
          ),
        ),
        body: Column(
          children: [
            // Services List
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: Get.size.width,
                  child: allVariations.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: allVariations.length,
                          itemBuilder: (context, i) {
                            final service = allVariations[i]['service'];
                            final variation = allVariations[i]['variation'];
                            return Container(
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: VariationsNewCard(
                                serviceVariationName: variation.variant,
                                serviceMrpPrice: (variation.mrpPrice is String
                                        ? int.tryParse(variation.mrpPrice) ?? 0
                                        : variation.mrpPrice ?? 0)
                                    .toString(),
                                serviceDiscountedPrice:
                                    (variation.price is String
                                            ? int.tryParse(variation.price) ?? 0
                                            : variation.price ?? 0)
                                        .toString(),
                                serviceTimeDuration: "${variation.varDuration}",
                                serviceDescription: service.shortDescription ??
                                    "Quality service provided by professionals",
                                variantKey: variation.variantKey,
                                serviceId: "${variation.serviceId}",
                                thumbnailPath: service.thumbnailFullPath,
                                variationId: variation.id.toString(),
                                serviceName: service.name ?? "",
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              "No services available",
                              style: albertSansRegular.copyWith(
                                fontSize: Dimensions.fontSize14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),

        // Bottom Action Button (if cart has items)
        bottomNavigationBar: GetBuilder<DashBoardController>(
          builder: (controller) {
            final totalItems = controller.addonCartTotalItems;
            final totalPrice = controller.addonCartTotalPrice;
            final totalSavings = controller.addonCartTotalSavings;

            if (totalItems > 0) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (totalSavings > 0)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "You're saving ₹$totalSavings on addons!",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () async {
                          showLoading();
                          await dashboardController.bookAddons(
                              bookingId: widget.bookingId);
                          await Future.delayed(Duration(seconds: 3), () async {
                            closeSnackBarIfActive();
                            hideLoading();
                          });
                          hideLoading();
                          await Future.delayed(Duration(seconds: 3), () async {
                            await dashboardController.getBookingDueAmount(
                                bookingId: widget.bookingId);
                          });
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF207FA8),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Proceed with Addons (₹$totalPrice)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
