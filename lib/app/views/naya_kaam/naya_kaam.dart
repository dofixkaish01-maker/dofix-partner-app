import 'package:dofix_technichian/model/booking_model.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/dashboard_controller.dart';
import '../shuru_kare.dart';

class Naya_kaam extends StatefulWidget {
  const Naya_kaam({super.key});

  @override
  State<Naya_kaam> createState() => _Naya_kaamState();
}

class _Naya_kaamState extends State<Naya_kaam> {
// To prevent multiple API calls

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DashBoardController>().getListOfBookings(isRefresh: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashBoardController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {
              // Ye method sirf refresh ke liye loader ke bina call karega
              await Get.find<DashBoardController>().getListOfBookings(isRefresh: true);
            },
            child: SingleChildScrollView(
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Aaj ke jobs',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '${controller.bookingModel.data?.where((e) => e.bookingStatus == "completed").length ?? 0}',
                                          style: TextStyle(
                                            color: const Color(0xFF207FA7),
                                            fontSize: 20,
                                            fontFamily: 'Albert Sans',
                                            fontWeight: FontWeight.w800,
                                            height: 1.40,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '/${controller.bookingModel.data?.length}',
                                          style: TextStyle(
                                            color: const Color(0xFF207FA7),
                                            fontSize: 16,
                                            fontFamily: 'Albert Sans',
                                            fontWeight: FontWeight.w800,
                                            height: 1.40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: controller.bookingModel.data?.isEmpty ?? true
                            ? Center(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.work_off,
                                size: 48,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "No Work For Today",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(bottom: 80),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  debugPrint(
                                      "formated Date ${controller.bookingModel.data?[index].subCategory.name}");
                                  return GestureDetector(
                                    onTap: () {},
                                    child: detailsComponent(
                                        DateFormat("hh:mm a")
                                            .format(DateTime.parse(controller
                                                .bookingModel
                                                .data?[index]
                                                .serviceSchedule))
                                            .toString(),
                                        "${controller.bookingModel.data?[index].subCategory.name}",
                                        "${controller.bookingModel.data?[index].serviceAddress?.address ?? 'Address not available'}",
                                        index,
                                        controller.bookingModel.data?[index]
                                                .bookingStatus ==
                                            "accepted",
                                        controller.bookingModel.data?[index]
                                                .bookingStatus ==
                                            "completed"),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: controller.bookingModel.data?.length ?? 0),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
            ),
          );
        },
      ),
    );
  }
}

Widget detailsComponent(
  String time,
  String title,
  String location,
  int index,
  bool isAccepted,
  bool isCompleted,
) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              time,
              style: TextStyle(
                color: Colors.black.withAlpha(77),
                fontSize: 18,
                fontFamily: 'Albert Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Visibility(
                  visible: isCompleted,
                  child: Text(
                    " ( Completed )",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontFamily: 'Albert Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageIcon(
                AssetImage("assets/icons/ic_location.png"),
                size: 14,
                color: primaryAppColor,
              ),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                width: Get.width / 2,
                child: Text(
                  location,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.black.withAlpha(102),
                    fontSize: 12,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => ShuruKare(
                  id: Get.find<DashBoardController>()
                          .bookingModel
                          .data?[index]
                          .id ??
                      "",
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: ShapeDecoration(
                color: primaryAppColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                isAccepted ? 'Suru Karein' : 'View Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        width: 328,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.black.withAlpha(38),
            ),
          ),
        ),
      )
    ],
  );
}
