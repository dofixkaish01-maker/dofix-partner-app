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
  final DashBoardController dashboardController =
      Get.find<DashBoardController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await dashboardController.clearAddonCart();
      await dashboardController.getSavedAddOns(
        bookingId: widget.bookingId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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

        // ================= BODY =================
        body: Obx(() {
          final response = dashboardController.addOnServiceListing.value;

          // LOADING STATE
          if (response == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final services = response.content ?? [];

          log("ADDON SERVICES COUNT => ${services.length}");

          // EMPTY STATE
          if (services.isEmpty) {
            return Center(
              child: Text(
                "No services available",
                style: albertSansRegular.copyWith(
                  fontSize: Dimensions.fontSize14,
                  color: Colors.grey,
                ),
              ),
            );
          }

          // DATA STATE
          return RefreshIndicator(
              color: const Color(0xFF207FA8),
              onRefresh: () async {
                log("🔄 Pull to refresh triggered");

                await dashboardController.clearAddonCart();
                await dashboardController.getSavedAddOns(
                  bookingId: widget.bookingId,
                );
              },

              //RefreshIndicator ko scrollable chahiye hota hai
              child: services.isEmpty
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: Text(
                              "No services available",
                              style: albertSansRegular.copyWith(
                                fontSize: Dimensions.fontSize14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];

                        // CASE 1: VARIATIONS AVAILABLE
                        if (service.variations != null &&
                            service.variations!.isNotEmpty) {
                          final variation = service.variations!.first;

                          final String variantKey =
                              variation.variantKey?.isNotEmpty == true
                                  ? variation.variantKey!
                                  : variation.id?.toString() ??
                                      service.id!.toString();

                          final int price = variation.price ??
                              int.tryParse(service.price ?? "0") ??
                              0;

                          final int mrpPrice =
                              int.tryParse(variation.mrpPrice ?? "") ?? price;

                          return VariationsNewCard(
                            serviceName: service.name ?? "Service",
                            serviceVariationName: variation.variant ?? "",
                            serviceDiscountedPrice: price.toString(),
                            serviceMrpPrice: mrpPrice.toString(),
                            serviceTimeDuration:
                                variation.varDuration ?? "30 min",
                            serviceDescription: service.shortDescription ?? "",
                            serviceId: service.id!.toString(),
                            variantKey: variantKey,
                            variationId: variation.id?.toString() ??
                                service.id!.toString(),
                            thumbnailPath: service.thumbnailFullPath,
                          );
                        }

                        // CASE 2: NO VARIATIONS (BACKEND ISSUE)
                        log(" Showing service WITHOUT variation: ${service.id}");

                        final int price =
                            int.tryParse(service.price ?? "0") ?? 0;

                        return VariationsNewCard(
                          serviceName: service.name ?? "Service",
                          serviceVariationName: "Standard",
                          serviceDiscountedPrice: price.toString(),
                          serviceMrpPrice: price.toString(),
                          serviceTimeDuration: "30 min",
                          serviceDescription: service.shortDescription ?? "",
                          serviceId: service.id!.toString(),
                          variantKey: service.id!.toString(), // fallback
                          variationId: service.id!.toString(),
                          thumbnailPath: service.thumbnailFullPath,
                        );
                      },
                    ));
        }),

        // ================= BOTTOM BAR =================
        bottomNavigationBar: GetBuilder<DashBoardController>(
          builder: (controller) {
            final totalItems = controller.addonCartTotalItems;
            final totalPrice = controller.addonCartTotalPrice;
            final totalSavings = controller.addonCartTotalSavings;

            if (totalItems == 0) {
              return const SizedBox.shrink();
            }

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (totalSavings > 0)
                      Text(
                        "You're saving ₹$totalSavings on addons!",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        if (Get.isDialogOpen == true) return;

                        showLoading();

                        try {
                          await dashboardController.bookAddons(
                            bookingId: widget.bookingId,
                          );

                          hideLoading();
                          Get.back();

                          Future.delayed(const Duration(milliseconds: 300), () {
                            showCustomSnackBar(
                              'Service added successfully!',
                              isSuccess: true,
                            );
                          });
                        } catch (e) {
                          hideLoading();
                          showCustomSnackBar(
                            'Failed to add services',
                            isError: true,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF207FA8),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Proceed with Addons (₹$totalPrice)",
                        style: const TextStyle(
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
          },
        ),
      ),
    );
  }
}
