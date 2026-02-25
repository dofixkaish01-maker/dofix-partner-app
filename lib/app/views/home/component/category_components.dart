import 'package:dofix_technichian/app/views/dashboard/dashboard_screen.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/theme.dart';
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
                height: 250,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 14,
                        left: 12,
                        right: 12,
                        bottom: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Aaj ka kaam",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.offAll(
                                  () => DashboardScreen(
                                pageIndex: 1,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff3683ab),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 6),

                    Flexible(
                      child: CardSwiper(
                        controller: controller,
                        cardsCount: (pendingBookings.length) < 3 ? pendingBookings.length : 3,
                        onSwipe: _onSwipe,
                        onUndo: _onUndo,
                        numberOfCardsDisplayed:
                        (pendingBookings.length) < 3 ? pendingBookings.length : 3,
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// TOP ROW: SERVICE + TIME
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${pendingBookings[index].subCategory.name}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Albert Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          DateFormat("hh:mm a")
                                              .format(DateTime.parse(
                                              pendingBookings[index].serviceSchedule))
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.45),
                                            fontFamily: 'Albert Sans',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    /// ADDRESS
                                    Text(
                                      "${pendingBookings[index].serviceAddress?.address ?? 'Address not available'}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.45),
                                        fontFamily: 'Albert Sans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25,
                                      ),
                                    ),

                                    const Spacer(),

                                    /// AMOUNT + START BUTTON
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "₹ ${pendingBookings[index].totalBookingAmount}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xFF207FA7),
                                              fontSize: 16,
                                              fontFamily: 'Albert Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => ShuruKare(
                                              id: pendingBookings[index].id ?? "",
                                            ));
                                          },
                                          child: Container(
                                            width: 84,
                                            height: 32,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF207FA7),
                                                ),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Start',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF207FA7),
                                                  fontSize: 12,
                                                  fontFamily: 'Albert Sans',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 2),
                                  ],
                                ),
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
