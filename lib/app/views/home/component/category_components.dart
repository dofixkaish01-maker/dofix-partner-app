import 'package:dofix_technichian/app/views/dashboard/dashboard_screen.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../shuru_kare.dart';

class SecondComponents extends StatefulWidget {
  SecondComponents({
    super.key,
  });

  @override
  State<SecondComponents> createState() => _SecondComponentsState();
}

class _SecondComponentsState extends State<SecondComponents> {
  CardSwiperController controller = CardSwiperController();

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

  final List<Color> cardColors = [
    Color(0xFFE9F2F6),
    Color(0xFFD2EEFA),
    Color(0xFFB4E4F9),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (dashBoardController) {
      final pendingBookings = (dashBoardController.bookingModel.data ?? [])
          .where((b) => b.bookingStatus == "accepted")
          .toList();

      return ((dashBoardController.bookingModel.data ?? []).isNotEmpty &&
              dashBoardController.bookingModel.data != null &&
              pendingBookings.isNotEmpty)
          ? Visibility(
              visible:
                  ((dashBoardController.bookingModel.data ?? []).isNotEmpty &&
                      dashBoardController.bookingModel.data != null &&
                      pendingBookings.isNotEmpty),
              child: Container(
                height: 280,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 25.0,
                        top: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Aaj ka kaam",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.offAll(
                              () => DashboardScreen(
                                pageIndex: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: CardSwiper(
                        controller: controller,
                        cardsCount: (pendingBookings.length) < 3
                            ? pendingBookings.length
                            : 3,
                        onSwipe: _onSwipe,
                        onUndo: _onUndo,
                        numberOfCardsDisplayed: (pendingBookings.length) < 3
                            ? pendingBookings.length
                            : 3,
                        allowedSwipeDirection:
                            AllowedSwipeDirection.only(left: true, right: true),
                        isLoop: true,
                        backCardOffset: const Offset(0, 20),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        cardBuilder: (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) =>
                            Container(
                          height: 150,
                          decoration: ShapeDecoration(
                            color: cardColors[index % cardColors.length],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 16,
                                  right: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      '${pendingBookings[index].subCategory.name}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateFormat("hh:mm a")
                                              .format(DateTime.parse(
                                                  pendingBookings[index]
                                                      .serviceSchedule))
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.40),
                                            fontFamily: 'Albert Sans',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 12, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "${pendingBookings[index].serviceAddress?.address ?? 'Address not available'}",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.40),
                                        fontFamily: 'Albert Sans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 12,
                                  right: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "₹ ${pendingBookings[index].totalBookingAmount}",
                                      style: TextStyle(
                                        color: const Color(0xFF207FA7),
                                        fontSize: 16,
                                        fontFamily: 'Albert Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => ShuruKare(
                                              id: pendingBookings[index].id ??
                                                  "",
                                            ));
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 30,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              color: const Color(0xFF207FA7),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Start',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xFF207FA7),
                                              fontSize: 12,
                                              fontFamily: 'Albert Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Text("");
    });
  }
}
