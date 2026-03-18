import 'dart:developer';
import 'dart:io';
import 'package:dofix_technichian/app/views/PaymentScreen/razorpay_qr_screen.dart';
import 'package:dofix_technichian/app/views/add_on_services_screen.dart';
import 'package:dofix_technichian/app/widgets/custom_addon_listing_item.dart';
import 'package:dofix_technichian/app/widgets/custom_booking_detail_item.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/data/api/api.dart';
import 'package:dofix_technichian/data/repo/auth_repo.dart';
import 'package:dofix_technichian/model/booking_details_content/booking_details_model.dart';
import 'package:dofix_technichian/utils/sizeboxes.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/views/payment_method_show_dialog.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:dofix_technichian/widgets/custom_snack_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/images.dart';
import '../../utils/theme.dart';
import '../../views/widgets/details_component.dart';
import '../../widgets/custom_camera_picker.dart';
import '../../widgets/custome_only_camera.dart';
import '../../widgets/video_recorder_widget.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/media_upload_widget.dart';
import 'package:video_player/video_player.dart';

import 'customer_otp_verification_screen.dart';

class ShuruKare extends StatefulWidget {
  final String id;
  final VoidCallback? onBookingUpdated;

  const ShuruKare({
    super.key,
    required this.id,
    this.onBookingUpdated,
  });

  @override
  State<ShuruKare> createState() => _ShuruKareState();
}

class _ShuruKareState extends State<ShuruKare> {
  VideoPlayerController? _videoPlayerController;
  final dashboardController = Get.find<DashBoardController>();

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Get.find<DashBoardController>().dueAmount.value = 0;
    closeSnackBarIfActive();
    hideLoading();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.find<DashBoardController>().setCapturedImage(null);
      Get.find<DashBoardController>().clearJobStartMedia();
      await Get.find<DashBoardController>().getBookingDetails(id: widget.id);
      await Get.find<DashBoardController>()
          .getBookingDueAmount(bookingId: widget.id);
      if (dashboardController.bookingDetails?.content?.bookingStatus ==
          'completed') {
        await dashboardController.getSavedAddOns(bookingId: widget.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget priceRow(String title, double amount,
        {bool isBold = false, Color? color}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Text(
              "₹ ${amount.toStringAsFixed(0)}",
              style: TextStyle(
                fontSize: 13,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: color ?? Colors.black,
              ),
            ),
          ],
        ),
      );
    }

    Widget serviceBreakdownRow({
      required String title,
      required double price,
      required int qty,
      required double total,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "₹ ${price.toStringAsFixed(0)} × $qty",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.55),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "₹ ${total.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      );
    }

    return GetBuilder<DashBoardController>(
      builder: (controller) {
        final details = controller.bookingDetails?.content?.detail ?? [];
        final mainServiceDetails = details.where((e) => e.isAddOn == 0).toList();

        double itemTotal = 0;
        for (final item in mainServiceDetails) {
          final double price =
              double.tryParse(item.serviceCost?.toString() ?? "0") ?? 0;
          final int qty = int.tryParse(item.quantity?.toString() ?? "0") ?? 0;
          itemTotal += price * qty;
        }

        final double taxAmount =
            double.tryParse(
              controller.bookingDetails?.content?.totalTaxAmount?.toString() ?? "0",
            ) ??
                0;

        final double totalAmount =
            double.tryParse(
              controller.bookingDetails?.content?.totalBookingAmount?.toString() ?? "0",
            ) ??
                0;
        final mainServices = details.where((d) => d.isAddOn == 0).toList();
        debugPrint(
            "ShuruKare===> ${Get.find<DashBoardController>().isBookingDetailsLoading}");

        return Scaffold(
          appBar: CustomAppBar(
            title: "Booking Details",
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
          body: !(Get.find<DashBoardController>().isBookingDetailsLoading ??
                  true)
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 43,
                                decoration:
                                    BoxDecoration(color: Color(0xfffE9F2F6)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Text(
                                          "Booking ID: ",
                                          style: albertSansRegular.copyWith(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "#${Get.find<DashBoardController>().bookingDetails?.content?.readableId}",
                                          style: albertSansRegular.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff207FA8)),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                      child: Text(
                                        Get.find<DashBoardController>()
                                                    .bookingDetails
                                                    ?.content
                                                    ?.isPaid ==
                                                0
                                            ? "Unpaid"
                                            : "Paid",
                                        textAlign: TextAlign.end,
                                        style: albertSansRegular.copyWith(
                                          color: Color(0xff207FA8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // Visibility(
                        //   visible: (dashboardController
                        //           .bookingDetails?.content?.bookingStatus !=
                        //       'completed'),
                        //   child: InkWell(
                        //     onTap: () async {
                        //       String phone = Get.find<DashBoardController>()
                        //               .bookingDetails
                        //               ?.content
                        //               ?.serviceAssignCustomerPhone ??
                        //           "";
                        //       if (phone.isNotEmpty) {
                        //         final Uri phoneUri = Uri(
                        //           scheme: 'tel',
                        //           path: phone,
                        //         );
                        //         if (await canLaunchUrl(
                        //           phoneUri,
                        //         )) {
                        //           await launchUrl(
                        //             phoneUri,
                        //             mode: LaunchMode.externalApplication,
                        //           );
                        //         } else {}
                        //       }
                        //     },
                        //     child: Padding(
                        //       padding:
                        //           const EdgeInsets.symmetric(horizontal: 16.0),
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           border: Border.all(
                        //               color: primaryAppColor, width: 1),
                        //           borderRadius: BorderRadius.circular(5),
                        //         ),
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(16.0),
                        //           child: Center(
                        //             child: Text(
                        //               "Call Customer",
                        //               style: TextStyle(
                        //                 color: primaryAppColor,
                        //                 fontSize: 14,
                        //                 fontFamily: 'Albert Sans',
                        //                 fontWeight: FontWeight.w500,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (mainServices.isNotEmpty) ...[
                                Row(
                                  children: [
                                    Text(
                                      "Main Service",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: Colors.black.withOpacity(0.15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: mainServices.length,
                                  itemBuilder: (context, index) {
                                    final detail = mainServices[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: CustomBookingDetailsItems(
                                          detail: detail),
                                    );
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Visibility(
                          visible: (dashboardController
                                  .bookingDetails?.content?.bookingStatus ==
                              'completed'),
                          child: Obx(() {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (dashboardController
                                      .savedAddonModelList.isNotEmpty) ...[
                                    Row(
                                      children: [
                                        Text(
                                          "Addon Service",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Container(
                                            height: 1,
                                            color:
                                                Colors.black.withOpacity(0.15),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: dashboardController
                                          .savedAddonModelList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: CustomAddonListingItem(
                                            variantName: dashboardController
                                                .savedAddonModelList[index]
                                                .variantKey!,
                                            servicename: dashboardController
                                                .savedAddonModelList[index]
                                                .serviceName!,
                                            singleCost: dashboardController
                                                .savedAddonModelList[index]
                                                .serviceCost
                                                .toString(),
                                            quantityCount: dashboardController
                                                .savedAddonModelList[index]
                                                .quantity
                                                .toString(),
                                            totalCost: dashboardController
                                                .savedAddonModelList[index]
                                                .totalCost
                                                .toString(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            );
                          }),
                        ),
                        Visibility(
                          visible: (dashboardController
                                  .bookingDetails?.content?.bookingStatus ==
                              'completed'),
                          child: const SizedBox(
                            height: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DetailsComponent(
                                    title: 'Scheduled date',
                                    subTitel: DateFormat("dd-MM-yyyy").format(
                                      DateTime.parse(
                                        (Get.find<DashBoardController>()
                                                    .bookingDetails
                                                    ?.content
                                                    ?.serviceSchedule ??
                                                DateTime.now().toString())
                                            .toString(),
                                      ),
                                    ),
                                    image: 'assets/icons/ic_calender.png',
                                  ),
                                  DetailsComponent(
                                    title: 'Scheduled time',
                                    subTitel: DateFormat("hh:mm a")
                                        .format(
                                          DateTime.parse(
                                            (Get.find<DashBoardController>()
                                                        .bookingDetails
                                                        ?.content
                                                        ?.serviceSchedule ??
                                                    DateTime.now().toString())
                                                .toString(),
                                          ),
                                        )
                                        .toString(),
                                    image: 'assets/icons/ic_calender.png',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              DetailsComponent(
                                title: 'Problem title',
                                subTitel: controller.bookingDetails?.content
                                        ?.detail?.first.service?.name ??
                                    "No Title",
                                image: 'assets/icons/ic_tool.png',
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              DetailsComponent(
                                title: 'Additional Comment',
                                subTitel: (Get.find<DashBoardController>()
                                                .bookingDetails
                                                ?.content
                                                ?.message !=
                                            null &&
                                        Get.find<DashBoardController>()
                                                .bookingDetails
                                                ?.content
                                                ?.message !=
                                            '')
                                    ? Get.find<DashBoardController>()
                                            .bookingDetails
                                            ?.content
                                            ?.message ??
                                        "No Description Provided"
                                    : "No Description Provided",
                              ),
                              const SizedBox(height: 24),

                              /// ADDRESS
                              DetailsComponent(
                                title: 'Service Address',
                                subTitel: controller.bookingDetails?.content?.serviceAddress?.address ??
                                    "No Address Provided",
                                image: 'assets/icons/ic_location.png',
                              ),

                              const SizedBox(height: 25),

                              /// PRICE DETAILS TITLE
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      "Price Details",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF7FAFC),
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(color: const Color(0xFFE6EBEF)),
                                ),
                                child: Column(
                                  children: [
                                    ...mainServiceDetails.map((item) {
                                      final double price =
                                          double.tryParse(item.serviceCost?.toString() ?? "0") ?? 0;
                                      final int qty =
                                          int.tryParse(item.quantity?.toString() ?? "0") ?? 0;
                                      final double total = price * qty;

                                      return serviceBreakdownRow(
                                        title: item.variantKey?.isNotEmpty == true
                                            ? item.variantKey!
                                            : (item.serviceName ?? "Service"),
                                        price: price,
                                        qty: qty,
                                        total: total,
                                      );
                                    }),

                                    if (mainServiceDetails.isNotEmpty) ...[
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 14),
                                        child: DottedLine(
                                          dashLength: 6,
                                          dashGapLength: 4,
                                          lineThickness: 1,
                                          dashColor: Color(0xFFD0D7DE),
                                        ),
                                      ),
                                    ],

                                    priceRow("Item Total", itemTotal),

                                    const SizedBox(height: 6),

                                    priceRow("Tax & Fee", taxAmount),

                                     Padding(
                                      padding: EdgeInsets.symmetric(vertical: 14),
                                      child: Divider(thickness: 1,),
                                    ),

                                    priceRow(
                                      "Total Amount",
                                      totalAmount,
                                      isBold: true,
                                      color: const Color(0xFF207FA7),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 8),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         "Price Details (${details.length} items)",
                              //         style: const TextStyle(
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600,
                              //           color: Colors.black87,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //
                              // /// BILLING CARD
                              // Container(
                              //     padding: const EdgeInsets.symmetric(
                              //       horizontal: 16,
                              //       vertical: 16,
                              //     ),
                              //     decoration: BoxDecoration(
                              //       color: const Color(0xFFF7FAFC),
                              //       borderRadius: BorderRadius.circular(7),
                              //       border: Border.all(
                              //           color: const Color(0xFFE6EBEF)),
                              //     ),
                              //     child: Column(
                              //       children: [
                              //         priceRow('Tax & Fee',booking.content
                              //                 ?.),
                              //         const SizedBox(height: 6),
                              //
                              //         Padding(
                              //           padding: const EdgeInsets.symmetric(
                              //               vertical: 14),
                              //           child: DottedBorder(
                              //             color: const Color(0xFFD0D7DE),
                              //             strokeWidth: 1,
                              //             dashPattern: const [6, 4],
                              //             customPath: (size) {
                              //               return Path()
                              //                 ..moveTo(0, 0)
                              //                 ..lineTo(size.width, 0);
                              //             },
                              //             child: const SizedBox(
                              //               width: double.infinity,
                              //               height: 1,
                              //             ),
                              //           ),
                              //         ),
                              //
                              //         priceRow(
                              //           "Total Amount",
                              //           grandTotal,
                              //           isBold: true,
                              //           color: const Color(0xFF207FA7),
                              //         ),
                              //       ],
                              //     ),
                              if (Get.find<DashBoardController>()
                                          .bookingDetails
                                          ?.content
                                          ?.bookingStatus ==
                                      'ongoing' &&
                                  Get.find<DashBoardController>()
                                          .bookingDetails
                                          ?.content
                                          ?.isPreWorkMediaUploaded ==
                                      false &&
                                  Get.find<DashBoardController>()
                                          .bookingDetails
                                          ?.content
                                          ?.isPostWorkMediaUploaded ==
                                      false)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Job Start ki photos aur videos",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                        3,
                                        (index) {
                                          final controller =
                                              Get.find<DashBoardController>();

                                          File? image;
                                          if (controller.jobStartImages.length >
                                                  index &&
                                              controller.jobStartImages[index]
                                                  .path.isNotEmpty &&
                                              controller.jobStartImages[index]
                                                      .path !=
                                                  '__dummy__') {
                                            image = controller
                                                .jobStartImages[index];
                                          }

                                          return UploadMediaWidget(
                                            label: "Add Photo",
                                            icon: Icons.image_outlined,
                                            imageFile: image,
                                            errorText:
                                                controller.jobStartImageError,
                                            onTap: () async {
                                              final result =
                                                  await pickFromCamera(context);
                                              if (result != null &&
                                                  result['file'] != null) {
                                                controller.addJobStartImageAt(
                                                  index,
                                                  result['file'],
                                                );
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    UploadMediaWidget(
                                      label: "Add Video",
                                      icon: Icons.videocam_outlined,
                                      onTap: () async {
                                        final videoFile =
                                            await Navigator.push<File?>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => VideoRecorderWidget(
                                              // TODO : Change it to 10 seconds
                                              maxSeconds: 10,
                                            ),
                                          ),
                                        );
                                        log("Video Path FIle: $videoFile");
                                        log("Video Path: ${videoFile?.path}");
                                        if (videoFile != null) {
                                          Get.find<DashBoardController>()
                                              .setJobStartVideo(videoFile);
                                          _videoPlayerController?.dispose();
                                          _videoPlayerController =
                                              VideoPlayerController.file(
                                                  videoFile)
                                                ..initialize().then(
                                                  (_) {
                                                    setState(() {});
                                                    _videoPlayerController
                                                        ?.pause();
                                                  },
                                                );
                                        }
                                      },
                                      imageFile: null,
                                      width: double.infinity,
                                      height: 160,
                                      showChild:
                                          (_videoPlayerController != null &&
                                              _videoPlayerController!
                                                  .value.isInitialized &&
                                              Get.find<DashBoardController>()
                                                      .jobStartVideo !=
                                                  null),
                                      child: (_videoPlayerController != null &&
                                              _videoPlayerController!
                                                  .value.isInitialized &&
                                              Get.find<DashBoardController>()
                                                      .jobStartVideo !=
                                                  null)
                                          ? Container(
                                              width: double.infinity,
                                              height: 200,
                                              // or any height you want for the video area
                                              color: Colors.black,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  _videoPlayerController !=
                                                              null &&
                                                          _videoPlayerController!
                                                              .value
                                                              .isInitialized
                                                      ? VideoPlayer(
                                                          _videoPlayerController!)
                                                      : Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  if (_videoPlayerController !=
                                                          null &&
                                                      _videoPlayerController!
                                                          .value.isInitialized)
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (_videoPlayerController!
                                                              .value
                                                              .isPlaying) {
                                                            _videoPlayerController!
                                                                .pause();
                                                          } else {
                                                            _videoPlayerController!
                                                                .play();
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                        child: Icon(
                                                          _videoPlayerController!
                                                                  .value
                                                                  .isPlaying
                                                              ? Icons
                                                                  .pause_circle_filled
                                                              : Icons
                                                                  .play_circle_filled,
                                                          color: Colors.white,
                                                          size: 56,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            )
                                          : null,
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              if (Get.find<DashBoardController>()
                                          .bookingDetails
                                          ?.content
                                          ?.bookingStatus ==
                                      'ongoing' &&
                                  Get.find<DashBoardController>()
                                          .bookingDetails
                                          ?.content
                                          ?.isPostWorkMediaUploaded ==
                                      false &&
                                  Get.find<DashBoardController>()
                                          .bookingDetails
                                          ?.content
                                          ?.isPreWorkMediaUploaded ==
                                      true)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Job Complete ki photos aur videos",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                        3,
                                        (index) {
                                          final images =
                                              Get.find<DashBoardController>()
                                                  .jobStartImages;
                                          log("Image at index $index: ${images.length > index ? images[index].path : 'No image'}");
                                          return GetBuilder<
                                              DashBoardController>(
                                            builder: (controller) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  UploadMediaWidget(
                                                    label: "Add Photo",
                                                    icon: Icons.image_outlined,
                                                    onTap: () async {
                                                      final result =
                                                          await pickFromCamera(
                                                              context);

                                                      if (result != null &&
                                                          result['file'] !=
                                                              null) {
                                                        controller
                                                            .addJobStartImageAt(
                                                          index,
                                                          result['file'],
                                                        );
                                                      }
                                                    },
                                                    imageFile:
                                                        images.length > index
                                                            ? images[index]
                                                            : null,
                                                    errorText: controller
                                                        .jobStartImageError,
                                                    width: 100,
                                                    height: 100,
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    UploadMediaWidget(
                                      label: "Add Video",
                                      icon: Icons.videocam_outlined,
                                      onTap: () async {
                                        final videoFile =
                                            await Navigator.push<File?>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => VideoRecorderWidget(
                                              // TODO : Change it to 10 seconds
                                              maxSeconds: 10,
                                            ),
                                          ),
                                        );
                                        log("Video Path FIle: $videoFile");
                                        log("Video Path: ${videoFile?.path}");
                                        if (videoFile != null) {
                                          Get.find<DashBoardController>()
                                              .setJobStartVideo(videoFile);
                                          _videoPlayerController?.dispose();
                                          _videoPlayerController =
                                              VideoPlayerController.file(
                                                  videoFile)
                                                ..initialize().then(
                                                  (_) {
                                                    setState(() {});
                                                    _videoPlayerController
                                                        ?.pause();
                                                  },
                                                );
                                        }
                                      },
                                      imageFile: null,
                                      width: double.infinity,
                                      height: 160,
                                      showChild:
                                          (_videoPlayerController != null &&
                                              _videoPlayerController!
                                                  .value.isInitialized &&
                                              Get.find<DashBoardController>()
                                                      .jobStartVideo !=
                                                  null),
                                      child: (_videoPlayerController != null &&
                                              _videoPlayerController!
                                                  .value.isInitialized &&
                                              Get.find<DashBoardController>()
                                                      .jobStartVideo !=
                                                  null)
                                          ? Container(
                                              width: double.infinity,
                                              height: 200,
                                              // or any height you want for the video area
                                              color: Colors.black,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  _videoPlayerController !=
                                                              null &&
                                                          _videoPlayerController!
                                                              .value
                                                              .isInitialized
                                                      ? VideoPlayer(
                                                          _videoPlayerController!)
                                                      : Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  if (_videoPlayerController !=
                                                          null &&
                                                      _videoPlayerController!
                                                          .value.isInitialized)
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (_videoPlayerController!
                                                              .value
                                                              .isPlaying) {
                                                            _videoPlayerController!
                                                                .pause();
                                                          } else {
                                                            _videoPlayerController!
                                                                .play();
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                        child: Icon(
                                                          _videoPlayerController!
                                                                  .value
                                                                  .isPlaying
                                                              ? Icons
                                                                  .pause_circle_filled
                                                              : Icons
                                                                  .play_circle_filled,
                                                          color: Colors.white,
                                                          size: 56,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            )
                                          : null,
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Text("Fetching Data..."),
                ),
          bottomNavigationBar: SingleChildScrollView(
            child: !(Get.find<DashBoardController>().isBookingDetailsLoading ??
                    true)
                ? GetBuilder<DashBoardController>(
                    builder: (controller) {
                      return controller.bookingDetails != null
                          ? CustomBottomContainer(
                              booking: controller.bookingDetails!,
                              onBookingUpdated: () {
                                if (widget.onBookingUpdated != null) {
                                  widget.onBookingUpdated!();
                                }
                              },
                            )
                          : SizedBox.shrink();
                    },
                  )
                : Container(),
          ),
        );
      },
    );
  }
}

class CustomBottomContainer extends StatefulWidget {
  final BookingDetailModel booking;
  final VoidCallback? onBookingUpdated;

  const CustomBottomContainer({
    super.key,
    required this.booking,
    this.onBookingUpdated,
  });

  @override
  State<CustomBottomContainer> createState() => _CustomBottomContainerState();
}

class _CustomBottomContainerState extends State<CustomBottomContainer> {
  final dashBoardController = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    log("Captured Image Path: ${dashBoardController.capturedImage.toString()}");
    log("Booking Status: ${widget.booking.content?.bookingStatus}");
    log("Booking id: ${widget.booking.content?.id}");

    final booking = widget.booking.content;
    final isCompleted = booking?.bookingStatus == "completed";
    final isCanceled = booking?.bookingStatus == "canceled";
    final isOngoing = booking?.bookingStatus == "ongoing";
    final isAccepted = booking?.bookingStatus == "accepted";
    final hasCapturedImage = dashBoardController.capturedImage != null;

    final isPreWorkPending =
        isOngoing &&
            booking?.isPreWorkMediaUploaded == false &&
            booking?.isPostWorkMediaUploaded == false;

    final isPostWorkPending =
        isOngoing &&
            booking?.isPreWorkMediaUploaded == true &&
            booking?.isPostWorkMediaUploaded == false;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCompleted && !hasCapturedImage)
            Container(
              width: Get.size.width,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  "Completed",
                  style: albertSansBold.copyWith(color: Colors.green),
                ),
              ),
            ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isCompleted ? 0 : 20),
                topRight: Radius.circular(isCompleted ? 0 : 20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: isCanceled
                ? const SizedBox.shrink()
                : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// COMPACT INFO CARD
                if (!hasCapturedImage && (isAccepted || isCompleted))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7FAFC),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFE6EBEF),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NAME + PRICE
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  booking?.serviceAssignCustomerName ??
                                      "No Name Provided",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Text(
                                "₹ ${booking?.totalBookingAmount ?? 0}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF207FA8),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// PHONE + CALL BUTTON
                          Row(
                            children: [
                              const Icon(
                                Icons.call_outlined,
                                size: 18,
                                color: Color(0xFF207FA8),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  booking?.serviceAssignCustomerPhone ??
                                      "",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _launchDialer(
                                    booking?.serviceAssignCustomerPhone ??
                                        "",
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFF207FA8),
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 14,
                                        color: Color(0xFF207FA8),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Call Karein",
                                        style: TextStyle(
                                          color: Color(0xFF207FA8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                /// COMPLETED - INVOICE
                if (isCompleted)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Get.find<DashBoardController>().openInvoice(
                          booking!.id.toString(),
                        );
                      },
                      child: Container(
                        height: 44,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF2ECC71),
                              Color(0xFF27AE60),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.35),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.receipt_long,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Download Invoice",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                /// CAPTURED IMAGE STATE
                if (hasCapturedImage) ...[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 12,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.image,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            dashBoardController.capturedImage
                                .toString()
                                .split('/')
                                .last,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      children: [
                        if (!isCompleted && !isCanceled)
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final value = await pickFile(
                                  context,
                                  frontCameraOnly: true,
                                  onlyCameraOption: true,
                                );
                                if (value != null &&
                                    value['file'] != null) {
                                  dashBoardController.setCapturedImage(
                                    value['file'],
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: primaryAppColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Center(
                                    child: Text(
                                      "Retake Photo",
                                      style: TextStyle(
                                        color: Color(0xFF207FA8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if (!isCompleted && !isCanceled)
                          const SizedBox(width: 10),

                        if (!isOngoing && !isCompleted && !isCanceled)
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                if (dashBoardController.capturedImage !=
                                    null) {
                                  Map<String, String> body = {
                                    "booking_id": booking!.id.toString(),
                                    "booking_status": "ongoing",
                                  };

                                  await Get.find<DashBoardController>()
                                      .updateBookingStatus(
                                    body,
                                    imageName: dashBoardController
                                        .capturedImage,
                                  );

                                  if (widget.onBookingUpdated != null) {
                                    widget.onBookingUpdated!();
                                  }

                                  await Get.find<DashBoardController>()
                                      .getListOfBookings(
                                    isRefresh: false,
                                  );

                                  Get.back();
                                  Get.snackbar(
                                    "Success",
                                    "Job started continue in Follow up!",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 5),
                                  );
                                } else {
                                  Get.snackbar(
                                    "Error",
                                    "Please capture an image before sharing.",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryAppColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Center(
                                    child: Text(
                                      "Share Photo",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ] else ...[
                  /// DEFAULT ACTIONS
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    child: Row(
                      children: [
                        /// ACCEPTED
                        if (isAccepted)
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final lat =
                                    booking?.serviceAddress?.lat
                                        ?.toString() ??
                                        "0.0";
                                final lon =
                                    booking?.serviceAddress?.lon
                                        ?.toString() ??
                                        "0.0";

                                String googleMapsUrl =
                                    "https://www.google.com/maps/search/?api=1&query=$lat,$lon";
                                String appleMapsUrl =
                                    "http://maps.apple.com/?ll=$lat,$lon";

                                if (Platform.isIOS) {
                                  final googleMapsSchemeUrl = Uri.parse(
                                    "comgooglemaps://?q=$lat,$lon",
                                  );
                                  if (await canLaunchUrl(
                                    googleMapsSchemeUrl,
                                  )) {
                                    await launchUrl(googleMapsSchemeUrl);
                                  } else if (await canLaunchUrl(
                                    Uri.parse(appleMapsUrl),
                                  )) {
                                    await launchUrl(
                                      Uri.parse(appleMapsUrl),
                                    );
                                  } else {
                                    await launchUrl(
                                      Uri.parse(googleMapsUrl),
                                      mode:
                                      LaunchMode.externalApplication,
                                    );
                                  }
                                } else {
                                  if (await canLaunchUrl(
                                    Uri.parse(googleMapsUrl),
                                  )) {
                                    await launchUrl(
                                      Uri.parse(googleMapsUrl),
                                      mode:
                                      LaunchMode.externalApplication,
                                    );
                                  } else {
                                    debugPrint(
                                      "Could not launch map for $lat, $lon",
                                    );
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: primaryAppColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Center(
                                    child: Text(
                                      "See on Map",
                                      style: TextStyle(
                                        color: Color(0xFF207FA8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if (isAccepted) const SizedBox(width: 10),

                        if (isAccepted)
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final value = await pickFile(
                                  context,
                                  frontCameraOnly: true,
                                  onlyCameraOption: true,
                                );
                                if (value != null &&
                                    value['file'] != null) {
                                  dashBoardController.setCapturedImage(
                                    value['file'],
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryAppColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Center(
                                    child: Text(
                                      "Kaam Start Kare",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        /// ONGOING PRE-WORK
                        if (isPreWorkPending)
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryAppColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () async {
                                  final controller =
                                  Get.find<DashBoardController>();

                                  if (!controller
                                      .validateJobStartImages()) {
                                    return;
                                  }

                                  Map<String, String> body = {
                                    "booking_id": booking!.id.toString(),
                                    "booking_status": "ongoing",
                                  };

                                  await controller.updateBookingStatus(
                                    body,
                                    images: controller.jobStartImages,
                                    videos: controller.jobStartVideo,
                                  );

                                  controller.clearJobStartMedia();
                                },
                                child: const Text(
                                  "Share",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        /// ONGOING POST-WORK
                        if (isPostWorkPending)
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final controller =
                                Get.find<DashBoardController>();

                                await controller.getExtraServicesList(
                                  categoryid:
                                  booking!.categoryId.toString(),
                                  subCategoryId:
                                  booking.subCategoryId.toString(),
                                );

                                await controller.getSavedAddOns(
                                  bookingId: booking.id.toString(),
                                );

                                Get.to(
                                      () => AddOnServicesScreen(
                                    bookingId: booking.id.toString(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: primaryAppColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Addon Service",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if (isPostWorkPending) const SizedBox(width: 10),

                        if (isPostWorkPending)
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final dashboardController =
                                Get.find<DashBoardController>();
                                final authController =
                                Get.find<AuthController>();

                                if (!dashboardController
                                    .validateJobStartImages()) {
                                  return;
                                }

                                Map<String, String> body = {
                                  "booking_id": booking!.id.toString(),
                                  "booking_status": "ongoing",
                                };

                                await dashboardController
                                    .updateBookingStatus(
                                  body,
                                  images:
                                  dashboardController.jobStartImages,
                                  videos:
                                  dashboardController.jobStartVideo,
                                  postImageName: 'evidence_photos',
                                  postVideoName: 'post_work_video',
                                );

                                await authController.sendCustomerOtpApi(
                                  phone: booking.customer?.phone ?? "",
                                  bookingId: booking.id ?? "",
                                  token: authController
                                      .authRepo.apiClient.token
                                      .toString(),
                                );

                                Get.to(
                                      () => CustomerOtpVerificationScreen(
                                    phoneNo:
                                    booking.customer?.phone ?? "",
                                    bookingId: booking.id.toString(),
                                  ),
                                );

                                Get.snackbar(
                                  "Success",
                                  "Media uploaded & OTP sent",
                                );
                              },
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: primaryAppColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Share Work & OTP",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchDialer(String phoneNumber) async {
    final Uri url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("Could not launch dialer for $phoneNumber");
    }
  }
}
// class _CustomBottomContainerState extends State<CustomBottomContainer> {
//   final dashBoardController = Get.find<DashBoardController>();
//
//   @override
//   Widget build(BuildContext context) {
//     double _toDouble(dynamic value) {
//       if (value == null) return 0;
//       if (value is num) return value.toDouble();
//       return double.tryParse(value.toString()) ?? 0;
//     }
//
//     Widget _priceRow(
//       String title,
//       double amount, {
//       bool isBold = false,
//       Color? color,
//     }) {
//       final textColor = color ?? Colors.black87;
//
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
//                   color: isBold ? Colors.black87 : Colors.black54,
//                 ),
//               ),
//             ),
//             Text(
//               "₹ ${amount.toStringAsFixed(0)}",
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
//                 color: textColor,
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     log("Captured Image Path: ${dashBoardController.capturedImage.toString()}");
//     log("Booking Status: ${widget.booking.content?.bookingStatus}");
//     log("Booking id: ${widget.booking.content?.id}");
//     return SafeArea(
//       child: Column(
//         children: [
//           Visibility(
//             visible: (widget.booking.content?.bookingStatus == "completed" &&
//                 dashBoardController.capturedImage == null),
//             child: Container(
//               width: Get.size.width,
//               height: 35,
//               decoration:
//                   BoxDecoration(color: Colors.greenAccent.withOpacity(0.1)),
//               child: Center(
//                   child: Text(
//                 "Completed",
//                 style: albertSansBold.copyWith(color: Colors.green),
//               )),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(
//                   widget.booking.content?.bookingStatus == "completed" ? 0 : 20,
//                 ),
//                 topRight: Radius.circular(
//                   widget.booking.content?.bookingStatus == "completed" ? 0 : 20,
//                 ),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.06),
//                   blurRadius: 10,
//                   offset: const Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: widget.booking.content?.bookingStatus == "canceled"
//                 ? SizedBox.shrink()
//                 : Column(
//                     children: [
//                       if ((dashBoardController.capturedImage == null &&
//                               widget.booking.content?.bookingStatus ==
//                                   "accepted") ||
//                           widget.booking.content?.bookingStatus == "completed")
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 16.0, top: 16, bottom: 16, right: 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   widget.booking.content
//                                           ?.serviceAssignCustomerName ??
//                                       "No Name Provided",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontFamily: 'Albert Sans',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 '₹ ${widget.booking.content!.totalBookingAmount.toString()}',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontFamily: 'Albert Sans',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       if ((dashBoardController.capturedImage == null &&
//                               widget.booking.content?.bookingStatus ==
//                                   "accepted")
//                           //         ||
//                           // widget.booking.content?.bookingStatus == "completed"
//                           )
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset(
//                                 "assets/icons/ic_phone.png",
//                                 scale: 3,
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   widget.booking.content
//                                           ?.serviceAssignCustomerPhone ??
//                                       "",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontFamily: 'Albert Sans',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               OutlinedButton(
//                                 onPressed: () {
//                                   _launchDialer(
//                                     widget.booking.content
//                                             ?.serviceAssignCustomerPhone ??
//                                         "",
//                                   );
//                                 },
//                                 style: OutlinedButton.styleFrom(
//                                   side: BorderSide(
//                                       color: primaryAppColor.withOpacity(0.6),
//                                       width: 1.4),
//                                   backgroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 8),
//                                   // smaller
//                                   tapTargetSize: MaterialTapTargetSize
//                                       .shrinkWrap, // compact height
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(
//                                       Icons.call,
//                                       color: primaryAppColor,
//                                       size: 16,
//                                     ),
//                                     const SizedBox(width: 6),
//                                     const Text(
//                                       'Call Karein',
//                                       style: TextStyle(
//                                         color: primaryAppColor,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w600,
//                                         fontFamily: 'Poppins',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       if ((dashBoardController.capturedImage == null &&
//                               widget.booking.content?.bookingStatus ==
//                                   "accepted") ||
//                           widget.booking.content?.bookingStatus == "completed")
//                         SizedBox(
//                           height: 10,
//                         ),
//                       if ((dashBoardController.capturedImage == null &&
//                               widget.booking.content?.bookingStatus ==
//                                   "accepted") ||
//                           widget.booking.content?.bookingStatus == "completed")
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset(
//                                 "assets/icons/ic_location.png",
//                                 color: Colors.white,
//                                 scale: 3,
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   widget.booking.content?.serviceAddress
//                                           ?.address ??
//                                       "",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontFamily: 'Albert Sans',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       if ((dashBoardController.capturedImage == null &&
//                               widget.booking.content?.bookingStatus ==
//                                   "accepted") ||
//                           widget.booking.content?.bookingStatus == "completed")
//                         SizedBox(
//                           height: 20,
//                         ),
//
//                       // in-voice Download
//                       if (widget.booking.content?.bookingStatus == "completed")
//                         GestureDetector(
//                           onTap: () {
//                             // invoice download logic
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(8),
//                               onTap: () {
//                                 // invoice download logic
//                                 Get.find<DashBoardController>().openInvoice(
//                                     widget.booking.content!.id.toString());
//                               },
//                               child: Container(
//                                 height: 44,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color(0xFF2ECC71), // light green
//                                       Color(0xFF27AE60), // dark green
//                                     ],
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.green.withOpacity(0.35),
//                                       blurRadius: 6,
//                                       offset: const Offset(0, 3),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: const [
//                                     Icon(
//                                       Icons.receipt_long,
//                                       color: Colors.white,
//                                       size: 18,
//                                     ),
//                                     SizedBox(width: 8),
//                                     Text(
//                                       "Download Invoice",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w700,
//                                         letterSpacing: 0.3,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       if (dashBoardController.capturedImage != null) ...[
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 16.0,
//                             bottom: 16.0,
//                             top: 16.0,
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.image,
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 dashBoardController.capturedImage
//                                     .toString()
//                                     .split('/')
//                                     .last,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Visibility(
//                                 visible: widget
//                                             .booking.content?.bookingStatus ==
//                                         "completed"
//                                     ? false
//                                     : widget.booking.content?.bookingStatus ==
//                                             "canceled"
//                                         ? false
//                                         : true,
//                                 child: Expanded(
//                                   child: GestureDetector(
//                                     onTap: () async {
//                                       // Retake photo
//                                       final value = await pickFile(context,
//                                           frontCameraOnly: true,
//                                           onlyCameraOption: true);
//                                       if (value != null &&
//                                           value['file'] != null) {
//                                         dashBoardController
//                                             .setCapturedImage(value['file']);
//                                       }
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.transparent,
//                                         border: Border.all(
//                                             color: Colors.white, width: 1),
//                                         borderRadius: BorderRadius.circular(5),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: Center(
//                                           child: Text(
//                                             "Retake Photo",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 14,
//                                               fontFamily: 'Albert Sans',
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Visibility(
//                                 visible: widget
//                                             .booking.content?.bookingStatus ==
//                                         "ongoing"
//                                     ? false
//                                     : widget.booking.content?.bookingStatus ==
//                                             "completed"
//                                         ? false
//                                         : widget.booking.content
//                                                     ?.bookingStatus ==
//                                                 "canceled"
//                                             ? false
//                                             : true,
//                                 child: Expanded(
//                                   child: GestureDetector(
//                                     onTap: () async {
//                                       if (dashBoardController.capturedImage !=
//                                           null) {
//                                         Map<String, String> body = {
//                                           "booking_id": widget
//                                               .booking.content!.id
//                                               .toString(),
//                                           "booking_status": "ongoing"
//                                         };
//                                         await Get.find<DashBoardController>()
//                                             .updateBookingStatus(body,
//                                                 imageName: dashBoardController
//                                                     .capturedImage);
//                                         if (widget.onBookingUpdated != null) {
//                                           widget.onBookingUpdated!();
//                                         }
//                                         await Get.find<DashBoardController>()
//                                             .getListOfBookings(
//                                                 isRefresh: false);
//                                         Get.back();
//                                         Get.snackbar(
//                                           "Success",
//                                           "Job started continue in Follow up!",
//                                           snackPosition: SnackPosition.BOTTOM,
//                                           backgroundColor: Colors.green,
//                                           colorText: Colors.white,
//                                           duration: Duration(seconds: 5),
//                                         );
//                                       } else {
//                                         Get.snackbar(
//                                           "Error",
//                                           "Please capture an image before sharing.",
//                                           snackPosition: SnackPosition.BOTTOM,
//                                           backgroundColor: Colors.red,
//                                           colorText: Colors.white,
//                                         );
//                                       }
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         border: Border.all(
//                                             color: Colors.white, width: 1),
//                                         borderRadius: BorderRadius.circular(5),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: Center(
//                                           child: Text(
//                                             "Share Photo",
//                                             style: TextStyle(
//                                               color: primaryAppColor,
//                                               fontSize: 14,
//                                               fontFamily: 'Albert Sans',
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Visibility(
//                           visible:
//                               widget.booking.content?.bookingStatus == "ongoing"
//                                   ? true
//                                   : false,
//                           child: Expanded(
//                             child: GestureDetector(
//                               onTap: () {
//                                 pickFile(
//                                   context,
//                                   multiCapture: true,
//                                   onlyCameraOption: true,
//                                   frontCameraOnly: false,
//                                 ).then(
//                                   (value) {
//                                     if (value != null) {
//                                       debugPrint("File path: $value");
//                                       final files = (value['files'] ?? []);
//                                       final isMultiple = files is List;
//
//                                       Map<String, String> body = {
//                                         "booking_id": widget.booking.content!.id
//                                             .toString(),
//                                         "booking_status": "completed"
//                                       };
//
//                                       if (isMultiple) {
//                                         // Handle multiple image files
//                                         debugPrint("File path: $files");
//                                         Get.find<DashBoardController>()
//                                             .updateBookingStatus(body,
//                                                 images: files);
//                                       } else {
//                                         // // Single file
//                                         // debugPrint("File path: $files");
//                                         // Get.find<DashBoardController>().updateBookingStatus(body, imageName: files);
//                                       }
//                                     }
//                                   },
//                                 );
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   border:
//                                       Border.all(color: Colors.white, width: 1),
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Center(
//                                     child: Text(
//                                       "Mark as Complete",
//                                       style: TextStyle(
//                                         color: primaryAppColor,
//                                         fontSize: 14,
//                                         fontFamily: 'Albert Sans',
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ] else ...[
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               sizedBox8(),
//                               Row(children: [
//                                 Visibility(
//                                   visible: widget
//                                               .booking.content?.bookingStatus ==
//                                           "completed"
//                                       ? false
//                                       : widget.booking.content?.bookingStatus ==
//                                               "canceled"
//                                           ? false
//                                           : widget.booking.content
//                                                       ?.bookingStatus ==
//                                                   "ongoing"
//                                               ? false
//                                               : true,
//                                   child: Expanded(
//                                       child: GestureDetector(
//                                     onTap: () async {
//                                       final lat = widget.booking.content
//                                               ?.serviceAddress?.lat
//                                               ?.toString() ??
//                                           "0.0";
//                                       final lon = widget.booking.content
//                                               ?.serviceAddress?.lon
//                                               ?.toString() ??
//                                           "0.0";
//                                       String googleMapsUrl =
//                                           "https://www.google.com/maps/search/?api=1&query=$lat,$lon";
//                                       String appleMapsUrl =
//                                           "http://maps.apple.com/?ll=$lat,$lon";
//
//                                       if (Platform.isIOS) {
//                                         // Try Google Maps first
//                                         final googleMapsSchemeUrl = Uri.parse(
//                                             "comgooglemaps://?q=$lat,$lon");
//                                         if (await canLaunchUrl(
//                                             googleMapsSchemeUrl)) {
//                                           await launchUrl(googleMapsSchemeUrl);
//                                         } else if (await canLaunchUrl(
//                                             Uri.parse(appleMapsUrl))) {
//                                           await launchUrl(
//                                               Uri.parse(appleMapsUrl));
//                                         } else {
//                                           await launchUrl(
//                                               Uri.parse(googleMapsUrl),
//                                               mode: LaunchMode
//                                                   .externalApplication);
//                                         }
//                                       } else {
//                                         // Android or others: open Google Maps in browser/app
//                                         if (await canLaunchUrl(
//                                             Uri.parse(googleMapsUrl))) {
//                                           await launchUrl(
//                                               Uri.parse(googleMapsUrl),
//                                               mode: LaunchMode
//                                                   .externalApplication);
//                                         } else {
//                                           debugPrint(
//                                               "Could not launch map for $lat, $lon");
//                                         }
//                                       }
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.transparent,
//                                         border: Border.all(
//                                             color: Colors.white, width: 1),
//                                         borderRadius: BorderRadius.circular(5),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: Center(
//                                           child: Text(
//                                             "See on Map",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 14,
//                                               fontFamily: 'Albert Sans',
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Visibility(
//                                   visible: widget
//                                               .booking.content?.bookingStatus ==
//                                           "ongoing"
//                                       ? false
//                                       : widget.booking.content?.bookingStatus ==
//                                               "completed"
//                                           ? false
//                                           : widget.booking.content
//                                                       ?.bookingStatus ==
//                                                   "canceled"
//                                               ? false
//                                               : true,
//                                   child: GestureDetector(
//                                     onTap: () async {
//                                       final value = await pickFile(context,
//                                           frontCameraOnly: true,
//                                           onlyCameraOption: true);
//                                       if (value != null &&
//                                           value['file'] != null) {
//                                         dashBoardController
//                                             .setCapturedImage(value['file']);
//                                       }
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         border: Border.all(
//                                             color: Colors.white, width: 1),
//                                         borderRadius: BorderRadius.circular(5),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: Center(
//                                           child: Text(
//                                             "Kaam Start Kare",
//                                             style: TextStyle(
//                                               color: primaryAppColor,
//                                               fontSize: 14,
//                                               fontFamily: 'Albert Sans',
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 if (widget
//                                             .booking.content?.bookingStatus ==
//                                         "ongoing" &&
//                                     widget.booking.content
//                                             ?.isPreWorkMediaUploaded ==
//                                         false &&
//                                     widget.booking.content
//                                             ?.isPostWorkMediaUploaded ==
//                                         false)
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: SizedBox(
//                                         width: double.infinity,
//                                         height: 48,
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: primaryAppColor,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                             ),
//                                           ),
//                                           onPressed: () async {
//                                             final controller =
//                                                 Get.find<DashBoardController>();
//
//                                             // validation (same jo tum already use kar rahe ho)
//                                             if (!controller
//                                                 .validateJobStartImages())
//                                               return;
//
//                                             Map<String, String> body = {
//                                               "booking_id": widget
//                                                   .booking.content!.id
//                                                   .toString(),
//                                               "booking_status": "ongoing",
//                                             };
//
//                                             await controller
//                                                 .updateBookingStatus(
//                                               body,
//                                               images: controller.jobStartImages,
//                                               videos: controller.jobStartVideo,
//                                             );
//
//                                             controller.clearJobStartMedia();
//                                           },
//                                           child: const Text(
//                                             "Share",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                 if (Get.find<DashBoardController>()
//                                             .bookingDetails
//                                             ?.content
//                                             ?.bookingStatus ==
//                                         'ongoing' &&
//                                     Get.find<DashBoardController>()
//                                             .bookingDetails
//                                             ?.content
//                                             ?.isPostWorkMediaUploaded ==
//                                         false &&
//                                     Get.find<DashBoardController>()
//                                             .bookingDetails
//                                             ?.content
//                                             ?.isPreWorkMediaUploaded ==
//                                         true)
//                                   Expanded(
//                                     child: GestureDetector(
//                                       onTap: () async {
//                                         final controller =
//                                             Get.find<DashBoardController>();
//
//                                         /// validation pass
//                                         await controller.getExtraServicesList(
//                                           categoryid: widget
//                                               .booking.content!.categoryId
//                                               .toString(),
//                                           subCategoryId: widget
//                                               .booking.content!.subCategoryId
//                                               .toString(),
//                                         );
//
//                                         await controller.getSavedAddOns(
//                                           bookingId: widget.booking.content!.id
//                                               .toString(),
//                                         );
//
//                                         Get.to(
//                                           () => AddOnServicesScreen(
//                                             bookingId: widget
//                                                 .booking.content!.id
//                                                 .toString(),
//                                           ),
//                                         );
//                                       },
//                                       child: Container(
//                                         height: 40,
//                                         decoration: BoxDecoration(
//                                           color: primaryAppColor,
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         padding: const EdgeInsets.all(8),
//                                         child: const Center(
//                                           child: Text(
//                                             "Addon Service",
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 // if (Get.find<DashBoardController>()
//                                 //             .bookingDetails
//                                 //             ?.content
//                                 //             ?.bookingStatus ==
//                                 //         'ongoing' &&
//                                 //     Get.find<DashBoardController>()
//                                 //             .bookingDetails
//                                 //             ?.content
//                                 //             ?.isPostWorkMediaUploaded ==
//                                 //         false &&
//                                 //     Get.find<DashBoardController>()
//                                 //             .bookingDetails
//                                 //             ?.content
//                                 //             ?.isPreWorkMediaUploaded ==
//                                 //         true)
//                                 //   Expanded(
//                                 //     child: GestureDetector(
//                                 //       onTap: () async {
//                                 //         final controller =
//                                 //             Get.find<DashBoardController>();
//                                 //
//                                 //         //  validate images (minimum required)
//                                 //         if (!controller
//                                 //             .validateJobStartImages()) return;
//                                 //
//                                 //         //  only job complete logic
//                                 //         Map<String, String> body = {
//                                 //           "booking_id": widget.booking.content!.id
//                                 //               .toString(),
//                                 //           "booking_status": "completed"
//                                 //         };
//                                 //
//                                 //         await controller.updateBookingStatus(
//                                 //           body,
//                                 //           images: controller.jobStartImages,
//                                 //           videos: controller.jobStartVideo,
//                                 //           postImageName: 'evidence_photos',
//                                 //           postVideoName: 'post_work_video',
//                                 //         );
//                                 //
//                                 //         // optional: clear local media after upload
//                                 //         controller.clearJobStartMedia();
//                                 //       },
//                                 //       child: Container(
//                                 //         height: 40,
//                                 //         decoration: BoxDecoration(
//                                 //           color: primaryAppColor,
//                                 //           borderRadius: BorderRadius.circular(5),
//                                 //         ),
//                                 //         padding: const EdgeInsets.all(8),
//                                 //         child: const Center(
//                                 //           child: Text(
//                                 //             "Share Media",
//                                 //             style: TextStyle(color: Colors.white),
//                                 //           ),
//                                 //         ),
//                                 //       ),
//                                 //     ),
//                                 //   ),
//                                 if (Get.find<DashBoardController>()
//                                             .bookingDetails
//                                             ?.content
//                                             ?.bookingStatus ==
//                                         'ongoing' &&
//                                     Get.find<DashBoardController>()
//                                             .bookingDetails
//                                             ?.content
//                                             ?.isPostWorkMediaUploaded ==
//                                         false &&
//                                     Get.find<DashBoardController>()
//                                             .bookingDetails
//                                             ?.content
//                                             ?.isPreWorkMediaUploaded ==
//                                         true)
//                                   Expanded(
//                                     child: GestureDetector(
//                                       onTap: () async {
//                                         final dashboardController =
//                                             Get.find<DashBoardController>();
//                                         final authController =
//                                             Get.find<AuthController>();
//
//                                         ///  validate media
//                                         if (!dashboardController
//                                             .validateJobStartImages()) return;
//
//                                         /// upload media
//                                         Map<String, String> body = {
//                                           "booking_id": widget
//                                               .booking.content!.id
//                                               .toString(),
//                                           "booking_status": "ongoing",
//                                         };
//
//                                         await dashboardController
//                                             .updateBookingStatus(
//                                           body,
//                                           images: dashboardController
//                                               .jobStartImages,
//                                           videos:
//                                               dashboardController.jobStartVideo,
//                                           postImageName: 'evidence_photos',
//                                           postVideoName: 'post_work_video',
//                                         );
//
//                                         ///  send OTP
//                                         await authController.sendCustomerOtpApi(
//                                           phone: widget.booking.content
//                                                   ?.customer?.phone ??
//                                               "",
//                                           bookingId:
//                                               widget.booking.content?.id ?? "",
//                                           token: authController
//                                               .authRepo.apiClient.token
//                                               .toString(),
//                                         );
//
//                                         ///  go to OTP screen
//                                         Get.to(
//                                             () => CustomerOtpVerificationScreen(
//                                                   phoneNo: widget
//                                                           .booking
//                                                           .content
//                                                           ?.customer
//                                                           ?.phone ??
//                                                       "",
//                                                   bookingId: widget
//                                                       .booking.content!.id
//                                                       .toString(),
//                                                 ));
//
//                                         Get.snackbar("Success",
//                                             "Media uploaded & OTP sent");
//                                       },
//                                       child: Container(
//                                         height: 40,
//                                         decoration: BoxDecoration(
//                                           color: primaryAppColor,
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         padding: const EdgeInsets.all(8),
//                                         child: const Center(
//                                           child: Text(
//                                             "Share Work & OTP",
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                 Visibility(
//                                   visible: (widget.booking.content
//                                                   ?.bookingStatus ==
//                                               "ongoing" &&
//                                           Get.find<DashBoardController>()
//                                                   .bookingDetails
//                                                   ?.content
//                                                   ?.isPreWorkMediaUploaded ==
//                                               true &&
//                                           Get.find<DashBoardController>()
//                                                   .bookingDetails
//                                                   ?.content
//                                                   ?.isPostWorkMediaUploaded ==
//                                               false)
//                                       ? true
//                                       : false,
//                                   child: SizedBox(
//                                     width: 10,
//                                   ),
//                                 ),
//
//                                 /// mark as complete
//                                 // Visibility(
//                                 //   visible: widget.booking.content?.bookingStatus ==
//                                 //           "ongoing"
//                                 //       ? true
//                                 //       : false,
//                                 //   child: Expanded(
//                                 //     child: GestureDetector(
//                                 //       onTap: () async {
//                                 //         if (Get.find<DashBoardController>()
//                                 //                     .bookingDetails
//                                 //                     ?.content
//                                 //                     ?.isPreWorkMediaUploaded ==
//                                 //                 false &&
//                                 //             Get.find<DashBoardController>()
//                                 //                     .bookingDetails
//                                 //                     ?.content
//                                 //                     ?.isPostWorkMediaUploaded ==
//                                 //                 false) {
//                                 //           final controller =
//                                 //               Get.find<DashBoardController>();
//                                 //           if (controller.jobStartImages.isEmpty &&
//                                 //               controller.jobStartVideo == null) {
//                                 //             Get.snackbar(
//                                 //               "Error",
//                                 //               "Please add at least one image & video before sharing.",
//                                 //               snackPosition: SnackPosition.BOTTOM,
//                                 //               backgroundColor: Colors.red,
//                                 //               colorText: Colors.white,
//                                 //             );
//                                 //             return;
//                                 //           }
//                                 //
//                                 //           Map<String, String> body = {
//                                 //             "booking_id": widget.booking.content!.id
//                                 //                 .toString(),
//                                 //             "booking_status": "ongoing"
//                                 //           };
//                                 //
//                                 //           await controller.updateBookingStatus(
//                                 //             body,
//                                 //             images: controller.jobStartImages,
//                                 //             videos: controller.jobStartVideo,
//                                 //           );
//                                 //           Get.find<DashBoardController>()
//                                 //               .clearJobStartMedia();
//                                 //         } else if (Get.find<DashBoardController>()
//                                 //                     .bookingDetails
//                                 //                     ?.content
//                                 //                     ?.isPreWorkMediaUploaded ==
//                                 //                 true &&
//                                 //             Get.find<DashBoardController>()
//                                 //                     .bookingDetails
//                                 //                     ?.content
//                                 //                     ?.isPostWorkMediaUploaded ==
//                                 //                 false) {
//                                 //           final controller =
//                                 //               Get.find<DashBoardController>();
//                                 //           if (controller.jobStartImages.isEmpty &&
//                                 //               controller.jobStartVideo == null) {
//                                 //             Get.snackbar(
//                                 //               "Error",
//                                 //               "Please add at least one image & video before sharing.",
//                                 //               snackPosition: SnackPosition.BOTTOM,
//                                 //               backgroundColor: Colors.red,
//                                 //               colorText: Colors.white,
//                                 //             );
//                                 //             return;
//                                 //           }
//                                 //           if (controller.dueAmount.value == 0) {
//                                 //             Map<String, String> body = {
//                                 //               "booking_id": widget
//                                 //                   .booking.content!.id
//                                 //                   .toString(),
//                                 //               "booking_status": "completed"
//                                 //             };
//                                 //
//                                 //             await controller.updateBookingStatus(
//                                 //               body,
//                                 //               images: controller.jobStartImages,
//                                 //               videos: controller.jobStartVideo,
//                                 //               postImageName: 'evidence_photos',
//                                 //               postVideoName: 'post_work_video',
//                                 //             );
//                                 //             return;
//                                 //           }
//                                 //
//                                 //           String? selectedPaymentMethod =
//                                 //               await showDialog<String>(
//                                 //             context: context,
//                                 //             barrierDismissible: false,
//                                 //             builder: (BuildContext context) {
//                                 //               return PaymentMethodShowDialog(
//                                 //                 amount: double.tryParse(Get.find<
//                                 //                             DashBoardController>()
//                                 //                         .dueAmount
//                                 //                         .value
//                                 //                         .toString()) ??
//                                 //                     0.0,
//                                 //               );
//                                 //             },
//                                 //           );
//                                 //
//                                 //           if (selectedPaymentMethod ==
//                                 //               "Pay by Cash") {
//                                 //             Get.find<DashBoardController>()
//                                 //                 .transactionId
//                                 //                 .value = "";
//                                 //             await Get.find<DashBoardController>()
//                                 //                 .updateBookingDueAmount(
//                                 //                     isRazorpay: false,
//                                 //                     bookingId: widget
//                                 //                             .booking.content?.id ??
//                                 //                         "",
//                                 //                     amount: Get.find<
//                                 //                             DashBoardController>()
//                                 //                         .dueAmount
//                                 //                         .value
//                                 //                         .toString());
//                                 //             await Get.find<DashBoardController>()
//                                 //                 .getBookingDueAmount(
//                                 //                     bookingId: widget
//                                 //                             .booking.content?.id ??
//                                 //                         "");
//                                 //             if (controller.dueAmountPaid.value) {
//                                 //               Map<String, String> body = {
//                                 //                 "booking_id": widget
//                                 //                     .booking.content!.id
//                                 //                     .toString(),
//                                 //                 "booking_status": "completed"
//                                 //               };
//                                 //
//                                 //               await controller.updateBookingStatus(
//                                 //                 body,
//                                 //                 images: controller.jobStartImages,
//                                 //                 videos: controller.jobStartVideo,
//                                 //                 postImageName: 'evidence_photos',
//                                 //                 postVideoName: 'post_work_video',
//                                 //               );
//                                 //             }
//                                 //
//                                 //             return;
//                                 //           } else if (selectedPaymentMethod ==
//                                 //               "Pay Online") {
//                                 //             if (Get.find<DashBoardController>()
//                                 //                         .bookingDetails
//                                 //                         ?.content
//                                 //                         ?.isPreWorkMediaUploaded ==
//                                 //                     true &&
//                                 //                 Get.find<DashBoardController>()
//                                 //                         .dueAmount
//                                 //                         .value >
//                                 //                     0) {
//                                 //               int amount =
//                                 //                   Get.find<DashBoardController>()
//                                 //                       .dueAmount
//                                 //                       .value
//                                 //                       .ceil();
//                                 //               log("Amount cannot be zero $amount");
//                                 //               log("Amount cannot be zero ${Get.find<DashBoardController>().dueAmount.value.toString()}");
//                                 //               if (amount == 0) {
//                                 //                 Get.snackbar(
//                                 //                   "Error",
//                                 //                   "Amount cannot be zero.",
//                                 //                   snackPosition:
//                                 //                       SnackPosition.BOTTOM,
//                                 //                   backgroundColor: Colors.red,
//                                 //                   colorText: Colors.white,
//                                 //                 );
//                                 //                 return;
//                                 //               }
//                                 //               final result = await Navigator.push(
//                                 //                 context,
//                                 //                 MaterialPageRoute(
//                                 //                   builder: (context) =>
//                                 //                       RazorpayQRScreen(
//                                 //                     amount: amount * 100,
//                                 //                     description:
//                                 //                         'Add-on Services Payment',
//                                 //                   ),
//                                 //                 ),
//                                 //               );
//                                 //
//                                 //               if (result == true) {
//                                 //                 await Get.find<
//                                 //                         DashBoardController>()
//                                 //                     .updateBookingDueAmount(
//                                 //                   bookingId:
//                                 //                       widget.booking.content?.id ??
//                                 //                           "",
//                                 //                   amount: Get.find<
//                                 //                           DashBoardController>()
//                                 //                       .dueAmount
//                                 //                       .value
//                                 //                       .toString(),
//                                 //                   isRazorpay: true,
//                                 //                 );
//                                 //                 await Get.find<
//                                 //                         DashBoardController>()
//                                 //                     .getBookingDueAmount(
//                                 //                         bookingId: widget.booking
//                                 //                                 .content?.id ??
//                                 //                             "");
//                                 //                 if (controller
//                                 //                     .dueAmountPaid.value) {
//                                 //                   Map<String, String> body = {
//                                 //                     "booking_id": widget
//                                 //                         .booking.content!.id
//                                 //                         .toString(),
//                                 //                     "booking_status": "completed",
//                                 //                     "payment_method": "razor_pay"
//                                 //                   };
//                                 //
//                                 //                   await controller
//                                 //                       .updateBookingStatus(
//                                 //                     body,
//                                 //                     images:
//                                 //                         controller.jobStartImages,
//                                 //                     videos:
//                                 //                         controller.jobStartVideo,
//                                 //                     postImageName:
//                                 //                         'evidence_photos',
//                                 //                     postVideoName:
//                                 //                         'post_work_video',
//                                 //                   );
//                                 //                 }
//                                 //                 print('Payment completed! hahaha');
//                                 //               }
//                                 //             }
//                                 //             return;
//                                 //           } else {
//                                 //             log("Payment method is : $selectedPaymentMethod");
//                                 //             return;
//                                 //           }
//                                 //         }
//                                 //       },
//                                 //       child: Container(
//                                 //         decoration: BoxDecoration(
//                                 //           color: primaryAppColor,
//                                 //           border: Border.all(
//                                 //               color: Colors.white, width: 1),
//                                 //           borderRadius: BorderRadius.circular(5),
//                                 //         ),
//                                 //         child: Padding(
//                                 //           padding: const EdgeInsets.all(8.0),
//                                 //           child: Center(
//                                 //             child: Text(
//                                 //               (Get.find<DashBoardController>()
//                                 //                               .bookingDetails
//                                 //                               ?.content
//                                 //                               ?.isPreWorkMediaUploaded ==
//                                 //                           false &&
//                                 //                       Get.find<DashBoardController>()
//                                 //                               .bookingDetails
//                                 //                               ?.content
//                                 //                               ?.isPostWorkMediaUploaded ==
//                                 //                           false)
//                                 //                   ? "Share Images & Video"
//                                 //                   : "Mark as Complete",
//                                 //               style: TextStyle(
//                                 //                 color: Colors.white,
//                                 //                 fontSize: 16,
//                                 //                 fontFamily: 'Albert Sans',
//                                 //                 fontWeight: FontWeight.w400,
//                                 //               ),
//                                 //             ),
//                                 //           ),
//                                 //         ),
//                                 //       ),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 // send customer otp button
//                               ]),
//                               // if (Get.find<DashBoardController>()
//                               //             .bookingDetails
//                               //             ?.content
//                               //             ?.bookingStatus ==
//                               //         'ongoing' &&
//                               //     Get.find<DashBoardController>()
//                               //             .bookingDetails
//                               //             ?.content
//                               //             ?.isPostWorkMediaUploaded ==
//                               //         false &&
//                               //     Get.find<DashBoardController>()
//                               //             .bookingDetails
//                               //             ?.content
//                               //             ?.isPreWorkMediaUploaded ==
//                               //         true)
//                               //   Padding(
//                               //     padding: const EdgeInsets.symmetric(
//                               //         horizontal: 10.0, vertical: 10),
//                               //     child: SizedBox(
//                               //       width: double.infinity,
//                               //       child: ElevatedButton(
//                               //         onPressed: () {
//                               //           final dashboardController =
//                               //               Get.find<DashBoardController>();
//                               //           final authController =
//                               //               Get.find<AuthController>();
//                               //
//                               //           authController.sendCustomerOtpApi(
//                               //             phone: widget.booking.content?.customer
//                               //                     ?.phone ??
//                               //                 "",
//                               //             bookingId:
//                               //                 widget.booking.content?.id ?? "",
//                               //             token: authController
//                               //                 .authRepo.apiClient.token
//                               //                 .toString(),
//                               //           );
//                               //         },
//                               //         style: ElevatedButton.styleFrom(
//                               //           backgroundColor: Colors.green,
//                               //           shape: RoundedRectangleBorder(
//                               //             borderRadius: BorderRadius.circular(8),
//                               //           ),
//                               //         ),
//                               //         child: const Text(
//                               //           "Complete Job",
//                               //           style: TextStyle(
//                               //             fontSize: 16,
//                               //             fontWeight: FontWeight.w600,
//                               //           ),
//                               //         ),
//                               //       ),
//                               //     ),
//                               //   )
//                             ],
//                           ),
//                         )
//                       ],
//                       SizedBox(
//                         height: 5,
//                       ),
//                     ],
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _launchDialer(String phoneNumber) async {
//     final Uri url = Uri.parse("tel:$phoneNumber");
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       debugPrint("Could not launch dialer for $phoneNumber");
//     }
//   }
// }

Future<bool> isWithin25Meters(double targetLat, double targetLng) async {
  try {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied again
        print('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      print('Location permissions are permanently denied');
      return false;
    }

    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double distanceInMeters = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      targetLat,
      targetLng,
    );

    debugPrint("Distance in meters: $distanceInMeters");
    return distanceInMeters <= 25;
  } catch (e) {
    print('Error getting location: $e');
    return false;
  }
}

Future<Map<String, dynamic>?> pickFromCamera(BuildContext context) async {
  return showModalBottomSheet<Map<String, dynamic>?>(
    context: context,
    builder: (_) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_front),
              title: const Text("Front Camera"),
              onTap: () async {
                Navigator.pop(
                  context,
                  await pickFileOnlyCamera(
                    context,
                    frontCameraOnly: true,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_rear),
              title: const Text("Back Camera"),
              onTap: () async {
                Navigator.pop(
                  context,
                  await pickFileOnlyCamera(
                    context,
                    frontCameraOnly: false,
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
