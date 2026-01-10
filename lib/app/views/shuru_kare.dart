import 'dart:developer';
import 'dart:io';
import 'package:dofix_technichian/app/views/PaymentScreen/razorpay_qr_screen.dart';
import 'package:dofix_technichian/app/views/add_on_services_screen.dart';
import 'package:dofix_technichian/app/widgets/custom_addon_listing_item.dart';
import 'package:dofix_technichian/app/widgets/custom_booking_detail_item.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/model/booking_details_content/booking_details_model.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/views/payment_method_show_dialog.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:dofix_technichian/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/images.dart';
import '../../utils/theme.dart';
import '../../views/widgets/details_component.dart';
import '../../widgets/custom_camera_picker.dart';
import '../../widgets/video_recorder_widget.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/media_upload_widget.dart';
import 'package:video_player/video_player.dart';

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
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        final details = controller.bookingDetails?.content?.detail ?? [];
        final mainServices = details.where((d) => d.isAddOn == 0).toList();
        debugPrint(
            "ShuruKare===> ${Get.find<DashBoardController>().isBookingDetailsLoading}");
        return SafeArea(
          child: Scaffold(
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
                ? SingleChildScrollView(
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
                        const SizedBox(
                          height: 15,
                        ),
                        Visibility(
                          visible: (dashboardController
                                  .bookingDetails?.content?.bookingStatus !=
                              'completed'),
                          child: InkWell(
                            onTap: () async {
                              String phone = Get.find<DashBoardController>()
                                      .bookingDetails
                                      ?.content
                                      ?.customer
                                      ?.phone ??
                                  "";
                              if (phone.isNotEmpty) {
                                final Uri phoneUri = Uri(
                                  scheme: 'tel',
                                  path: phone,
                                );
                                if (await canLaunchUrl(
                                  phoneUri,
                                )) {
                                  await launchUrl(
                                    phoneUri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {}
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                    child: Text(
                                      "Call Customer",
                                      style: TextStyle(
                                        color: primaryAppColor,
                                        fontSize: 14,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                              const SizedBox(
                                height: 30,
                              ),
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
                                          final images =
                                              Get.find<DashBoardController>()
                                                  .jobStartImages;
                                          log("Image at index $index: ${images.length > index ? images[index].path : 'No image'}");
                                          return UploadMediaWidget(
                                            label: "Add Photo",
                                            icon: Icons.image_outlined,
                                            onTap: () async {
                                              final value = await pickFile(
                                                frontCameraOnly: false,
                                                context,
                                                onlyCameraOption: true,
                                              );
                                              if (value != null &&
                                                  value['file'] != null) {
                                                Get.find<DashBoardController>()
                                                    .addJobStartImage(
                                                        value['file']);
                                              }
                                            },
                                            imageFile: images.length > index
                                                ? images[index]
                                                : null,
                                            width: 100,
                                            height: 100,
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
                                              height:
                                                  200, // or any height you want for the video area
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
                                          return UploadMediaWidget(
                                            label: "Add Photo",
                                            icon: Icons.image_outlined,
                                            onTap: () async {
                                              final value = await pickFile(
                                                frontCameraOnly: false,
                                                context,
                                                onlyCameraOption: true,
                                              );
                                              if (value != null &&
                                                  value['file'] != null) {
                                                Get.find<DashBoardController>()
                                                    .addJobStartImage(
                                                        value['file']);
                                              }
                                            },
                                            imageFile: images.length > index
                                                ? images[index]
                                                : null,
                                            width: 100,
                                            height: 100,
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
                                              height:
                                                  200, // or any height you want for the video area
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
                  )
                : Center(
                    child: Text("Fetching Data..."),
                  ),
            bottomNavigationBar: SingleChildScrollView(
              child:
                  !(Get.find<DashBoardController>().isBookingDetailsLoading ??
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
    return Column(
      children: [
        Visibility(
          visible: (widget.booking.content?.bookingStatus == "completed" &&
              dashBoardController.capturedImage == null),
          child: Container(
            width: Get.size.width,
            height: 35,
            decoration:
                BoxDecoration(color: Colors.greenAccent.withOpacity(0.1)),
            child: Center(
                child: Text(
              "Completed",
              style: albertSansBold.copyWith(color: Colors.green),
            )),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: widget.booking.content?.bookingStatus == "ongoing"
                ? Colors.white
                : primaryAppColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                  widget.booking.content?.bookingStatus == "completed"
                      ? 0
                      : 20),
              topRight: Radius.circular(
                  widget.booking.content?.bookingStatus == "completed"
                      ? 0
                      : 20),
            ),
          ),
          child: widget.booking.content?.bookingStatus == "canceled"
              ? SizedBox.shrink()
              : Column(
                  children: [
                    if ((dashBoardController.capturedImage == null &&
                            widget.booking.content?.bookingStatus ==
                                "accepted") ||
                        widget.booking.content?.bookingStatus == "completed")
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 16, bottom: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                widget.booking.content?.customer?.firstName ??
                                    "No Name Provided",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              '₹ ${widget.booking.content!.totalBookingAmount.toString()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Albert Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    if ((dashBoardController.capturedImage == null &&
                            widget.booking.content?.bookingStatus == "accepted")
                        //         ||
                        // widget.booking.content?.bookingStatus == "completed"
                        )
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icons/ic_phone.png",
                              scale: 3,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                widget.booking.content?.customer?.phone ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(0, 0)),
                              onPressed: () {
                                _launchDialer(
                                    widget.booking.content?.customer?.phone ??
                                        "");
                              },
                              child: Text(
                                'Call Karein',
                                style: TextStyle(
                                  color: const Color(0xFF64D64D),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    if ((dashBoardController.capturedImage == null &&
                            widget.booking.content?.bookingStatus ==
                                "accepted") ||
                        widget.booking.content?.bookingStatus == "completed")
                      SizedBox(
                        height: 10,
                      ),
                    if ((dashBoardController.capturedImage == null &&
                            widget.booking.content?.bookingStatus ==
                                "accepted") ||
                        widget.booking.content?.bookingStatus == "completed")
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icons/ic_location.png",
                              color: Colors.white,
                              scale: 3,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                widget.booking.content?.serviceAddress
                                        ?.address ??
                                    "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if ((dashBoardController.capturedImage == null &&
                            widget.booking.content?.bookingStatus ==
                                "accepted") ||
                        widget.booking.content?.bookingStatus == "completed")
                      SizedBox(
                        height: 20,
                      ),
                    if (dashBoardController.capturedImage != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          bottom: 16.0,
                          top: 16.0,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              dashBoardController.capturedImage
                                  .toString()
                                  .split('/')
                                  .last,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: widget.booking.content?.bookingStatus ==
                                      "completed"
                                  ? false
                                  : widget.booking.content?.bookingStatus ==
                                          "canceled"
                                      ? false
                                      : true,
                              child: Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    // Retake photo
                                    final value = await pickFile(context,
                                        frontCameraOnly: true,
                                        onlyCameraOption: true);
                                    if (value != null &&
                                        value['file'] != null) {
                                      dashBoardController
                                          .setCapturedImage(value['file']);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          "Retake Photo",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Albert Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Visibility(
                              visible: widget.booking.content?.bookingStatus ==
                                      "ongoing"
                                  ? false
                                  : widget.booking.content?.bookingStatus ==
                                          "completed"
                                      ? false
                                      : widget.booking.content?.bookingStatus ==
                                              "canceled"
                                          ? false
                                          : true,
                              child: Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (dashBoardController.capturedImage !=
                                        null) {
                                      Map<String, String> body = {
                                        "booking_id": widget.booking.content!.id
                                            .toString(),
                                        "booking_status": "ongoing"
                                      };
                                      await Get.find<DashBoardController>()
                                          .updateBookingStatus(body,
                                              imageName: dashBoardController
                                                  .capturedImage);
                                      if (widget.onBookingUpdated != null) {
                                        widget.onBookingUpdated!();
                                      }
                                      await Get.find<DashBoardController>()
                                          .getListOfBookings(isRefresh: false);
                                      Get.back();
                                      Get.snackbar(
                                        "Success",
                                        "Job started continue in Follow up!",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                        duration: Duration(seconds: 5),
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
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          "Share Photo",
                                          style: TextStyle(
                                            color: primaryAppColor,
                                            fontSize: 14,
                                            fontFamily: 'Albert Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
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
                      Visibility(
                        visible:
                            widget.booking.content?.bookingStatus == "ongoing"
                                ? true
                                : false,
                        child: Expanded(
                          child: GestureDetector(
                            onTap: () {
                              pickFile(
                                context,
                                multiCapture: true,
                                onlyCameraOption: true,
                                frontCameraOnly: false,
                              ).then(
                                (value) {
                                  if (value != null) {
                                    debugPrint("File path: $value");
                                    final files = (value['files'] ?? []);
                                    final isMultiple = files is List;

                                    Map<String, String> body = {
                                      "booking_id":
                                          widget.booking.content!.id.toString(),
                                      "booking_status": "completed"
                                    };

                                    if (isMultiple) {
                                      // Handle multiple image files
                                      debugPrint("File path: $files");
                                      Get.find<DashBoardController>()
                                          .updateBookingStatus(body,
                                              images: files);
                                    } else {
                                      // // Single file
                                      // debugPrint("File path: $files");
                                      // Get.find<DashBoardController>().updateBookingStatus(body, imageName: files);
                                    }
                                  }
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Text(
                                    "Mark as Complete",
                                    style: TextStyle(
                                      color: primaryAppColor,
                                      fontSize: 14,
                                      fontFamily: 'Albert Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: widget.booking.content?.bookingStatus ==
                                      "completed"
                                  ? false
                                  : widget.booking.content?.bookingStatus ==
                                          "canceled"
                                      ? false
                                      : widget.booking.content?.bookingStatus ==
                                              "ongoing"
                                          ? false
                                          : true,
                              child: Expanded(
                                  child: GestureDetector(
                                onTap: () async {
                                  final lat = widget
                                          .booking.content?.serviceAddress?.lat
                                          ?.toString() ??
                                      "0.0";
                                  final lon = widget
                                          .booking.content?.serviceAddress?.lon
                                          ?.toString() ??
                                      "0.0";
                                  String googleMapsUrl =
                                      "https://www.google.com/maps/search/?api=1&query=$lat,$lon";
                                  String appleMapsUrl =
                                      "http://maps.apple.com/?ll=$lat,$lon";

                                  if (Platform.isIOS) {
                                    // Try Google Maps first
                                    final googleMapsSchemeUrl = Uri.parse(
                                        "comgooglemaps://?q=$lat,$lon");
                                    if (await canLaunchUrl(
                                        googleMapsSchemeUrl)) {
                                      await launchUrl(googleMapsSchemeUrl);
                                    } else if (await canLaunchUrl(
                                        Uri.parse(appleMapsUrl))) {
                                      await launchUrl(Uri.parse(appleMapsUrl));
                                    } else {
                                      await launchUrl(Uri.parse(googleMapsUrl),
                                          mode: LaunchMode.externalApplication);
                                    }
                                  } else {
                                    // Android or others: open Google Maps in browser/app
                                    if (await canLaunchUrl(
                                        Uri.parse(googleMapsUrl))) {
                                      await launchUrl(Uri.parse(googleMapsUrl),
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      debugPrint(
                                          "Could not launch map for $lat, $lon");
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(
                                      child: Text(
                                        "See on Map",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Albert Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Visibility(
                              visible: widget.booking.content?.bookingStatus ==
                                      "ongoing"
                                  ? false
                                  : widget.booking.content?.bookingStatus ==
                                          "completed"
                                      ? false
                                      : widget.booking.content?.bookingStatus ==
                                              "canceled"
                                          ? false
                                          : true,
                              child: Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final value = await pickFile(context,
                                        frontCameraOnly: true,
                                        onlyCameraOption: true);
                                    if (value != null &&
                                        value['file'] != null) {
                                      dashBoardController
                                          .setCapturedImage(value['file']);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          "Kaam Start Kare",
                                          style: TextStyle(
                                            color: primaryAppColor,
                                            fontSize: 14,
                                            fontFamily: 'Albert Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: (widget.booking.content?.bookingStatus ==
                                          "ongoing" &&
                                      Get.find<DashBoardController>()
                                              .bookingDetails
                                              ?.content
                                              ?.isPreWorkMediaUploaded ==
                                          true &&
                                      Get.find<DashBoardController>()
                                              .bookingDetails
                                              ?.content
                                              ?.isPostWorkMediaUploaded ==
                                          false)
                                  ? true
                                  : false,
                              child: Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    await Get.find<DashBoardController>()
                                        .getExtraServicesList(
                                            subcategoryid: widget
                                                .booking.content!.subCategoryId
                                                .toString());
                                    await Get.find<DashBoardController>()
                                        .getSavedAddOns(
                                            bookingId: widget
                                                .booking.content!.id
                                                .toString());
                                    Get.to(() => AddOnServicesScreen(
                                        bookingId: widget.booking.content!.id
                                            .toString()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryAppColor,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          "Extra Service",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Albert Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: (widget.booking.content?.bookingStatus ==
                                          "ongoing" &&
                                      Get.find<DashBoardController>()
                                              .bookingDetails
                                              ?.content
                                              ?.isPreWorkMediaUploaded ==
                                          true &&
                                      Get.find<DashBoardController>()
                                              .bookingDetails
                                              ?.content
                                              ?.isPostWorkMediaUploaded ==
                                          false)
                                  ? true
                                  : false,
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            Visibility(
                              visible: widget.booking.content?.bookingStatus ==
                                      "ongoing"
                                  ? true
                                  : false,
                              child: Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (Get.find<DashBoardController>()
                                                .bookingDetails
                                                ?.content
                                                ?.isPreWorkMediaUploaded ==
                                            false &&
                                        Get.find<DashBoardController>()
                                                .bookingDetails
                                                ?.content
                                                ?.isPostWorkMediaUploaded ==
                                            false) {
                                      final controller =
                                          Get.find<DashBoardController>();
                                      if (controller.jobStartImages.isEmpty &&
                                          controller.jobStartVideo == null) {
                                        Get.snackbar(
                                          "Error",
                                          "Please add at least one image & video before sharing.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                        );
                                        return;
                                      }

                                      Map<String, String> body = {
                                        "booking_id": widget.booking.content!.id
                                            .toString(),
                                        "booking_status": "ongoing"
                                      };

                                      await controller.updateBookingStatus(
                                        body,
                                        images: controller.jobStartImages,
                                        videos: controller.jobStartVideo,
                                      );
                                      Get.find<DashBoardController>()
                                          .clearJobStartMedia();
                                    } else if (Get.find<DashBoardController>()
                                                .bookingDetails
                                                ?.content
                                                ?.isPreWorkMediaUploaded ==
                                            true &&
                                        Get.find<DashBoardController>()
                                                .bookingDetails
                                                ?.content
                                                ?.isPostWorkMediaUploaded ==
                                            false) {
                                      final controller =
                                          Get.find<DashBoardController>();
                                      if (controller.jobStartImages.isEmpty &&
                                          controller.jobStartVideo == null) {
                                        Get.snackbar(
                                          "Error",
                                          "Please add at least one image & video before sharing.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                        );
                                        return;
                                      }
                                      if (controller.dueAmount.value == 0) {
                                        Map<String, String> body = {
                                          "booking_id": widget
                                              .booking.content!.id
                                              .toString(),
                                          "booking_status": "completed"
                                        };

                                        await controller.updateBookingStatus(
                                          body,
                                          images: controller.jobStartImages,
                                          videos: controller.jobStartVideo,
                                          postImageName: 'evidence_photos',
                                          postVideoName: 'post_work_video',
                                        );
                                        return;
                                      }

                                      String? selectedPaymentMethod =
                                          await showDialog<String>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return PaymentMethodShowDialog(
                                            amount: double.tryParse(Get.find<
                                                        DashBoardController>()
                                                    .dueAmount
                                                    .value
                                                    .toString()) ??
                                                0.0,
                                          );
                                        },
                                      );

                                      if (selectedPaymentMethod ==
                                          "Pay by Cash") {
                                        Get.find<DashBoardController>()
                                            .transactionId
                                            .value = "";
                                        await Get.find<DashBoardController>()
                                            .updateBookingDueAmount(
                                                isRazorpay: false,
                                                bookingId: widget
                                                        .booking.content?.id ??
                                                    "",
                                                amount: Get.find<
                                                        DashBoardController>()
                                                    .dueAmount
                                                    .value
                                                    .toString());
                                        await Get.find<DashBoardController>()
                                            .getBookingDueAmount(
                                                bookingId: widget
                                                        .booking.content?.id ??
                                                    "");
                                        if (controller.dueAmountPaid.value) {
                                          Map<String, String> body = {
                                            "booking_id": widget
                                                .booking.content!.id
                                                .toString(),
                                            "booking_status": "completed"
                                          };

                                          await controller.updateBookingStatus(
                                            body,
                                            images: controller.jobStartImages,
                                            videos: controller.jobStartVideo,
                                            postImageName: 'evidence_photos',
                                            postVideoName: 'post_work_video',
                                          );
                                        }

                                        return;
                                      } else if (selectedPaymentMethod ==
                                          "Pay Online") {
                                        if (Get.find<DashBoardController>()
                                                    .bookingDetails
                                                    ?.content
                                                    ?.isPreWorkMediaUploaded ==
                                                true &&
                                            Get.find<DashBoardController>()
                                                    .dueAmount
                                                    .value >
                                                0) {
                                          int amount =
                                              Get.find<DashBoardController>()
                                                  .dueAmount
                                                  .value
                                                  .ceil();
                                          log("Amount cannot be zero $amount");
                                          log("Amount cannot be zero ${Get.find<DashBoardController>().dueAmount.value.toString()}");
                                          if (amount == 0) {
                                            Get.snackbar(
                                              "Error",
                                              "Amount cannot be zero.",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white,
                                            );
                                            return;
                                          }
                                          final result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RazorpayQRScreen(
                                                amount: amount * 100,
                                                description:
                                                    'Add-on Services Payment',
                                              ),
                                            ),
                                          );

                                          if (result == true) {
                                            await Get.find<
                                                    DashBoardController>()
                                                .updateBookingDueAmount(
                                              bookingId:
                                                  widget.booking.content?.id ??
                                                      "",
                                              amount: Get.find<
                                                      DashBoardController>()
                                                  .dueAmount
                                                  .value
                                                  .toString(),
                                              isRazorpay: true,
                                            );
                                            await Get.find<
                                                    DashBoardController>()
                                                .getBookingDueAmount(
                                                    bookingId: widget.booking
                                                            .content?.id ??
                                                        "");
                                            if (controller
                                                .dueAmountPaid.value) {
                                              Map<String, String> body = {
                                                "booking_id": widget
                                                    .booking.content!.id
                                                    .toString(),
                                                "booking_status": "completed",
                                                "payment_method": "razor_pay"
                                              };

                                              await controller
                                                  .updateBookingStatus(
                                                body,
                                                images:
                                                    controller.jobStartImages,
                                                videos:
                                                    controller.jobStartVideo,
                                                postImageName:
                                                    'evidence_photos',
                                                postVideoName:
                                                    'post_work_video',
                                              );
                                            }
                                            print('Payment completed! hahaha');
                                          }
                                        }
                                        return;
                                      } else {
                                        log("Payment method is : $selectedPaymentMethod");
                                        return;
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryAppColor,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          (Get.find<DashBoardController>()
                                                          .bookingDetails
                                                          ?.content
                                                          ?.isPreWorkMediaUploaded ==
                                                      false &&
                                                  Get.find<DashBoardController>()
                                                          .bookingDetails
                                                          ?.content
                                                          ?.isPostWorkMediaUploaded ==
                                                      false)
                                              ? "Share Images & Video"
                                              : "Mark as Complete",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Albert Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
        ),
      ],
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
