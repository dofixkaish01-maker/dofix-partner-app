import 'package:dofix_technichian/utils/theme.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../model/booking_status/booking_status.dart';
import '../shuru_kare.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Booking?> _items = [];
  late TabController _tabController;
  bool _isLoading = false;
  final List<String> statusList = [
    "accepted",
    "ongoing",
    "completed",
    "canceled"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: statusList.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchDataForTab("accepted");
      _tabController.addListener(() {
        if (_tabController.indexIsChanging) return;
        fetchDataForTab(statusList[_tabController.index]);
      });

      // getData("6","1");
    });
  }

  Future<void> fetchDataForTab(String status) async {
    setState(() => _isLoading = true);
    final controller = Get.find<DashBoardController>();

    // Remove existing items with alternating direction animation
    int toggle = 0; // 0: right, 1: left
    for (int i = _items.length - 1; i >= 0; i--) {
      final removedItem = _items.removeAt(i);
      final removeToRight = toggle % 2 == 0;
      toggle++;

      _listKey.currentState?.removeItem(
        i,
        (context, animation) => SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(removeToRight ? 1.0 : -1.0, 0.0),
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
          )),
          child: detailsComponent(
            removedItem?.serviceSchedule ?? '11:00 AM',
            removedItem?.subCategory.name ?? 'Service Name',
            removedItem?.serviceAddressId ?? 'Location',
            removedItem?.serviceSchedule ?? "10-10-2024",
            removedItem?.bookingStatus == "completed",
            removedItem?.bookingStatus == "canceled",
            removedItem?.bookingStatus == "ongoing",
            removedItem?.bookingStatus == "accepted",
            i,
          ),
        ),
        duration: const Duration(milliseconds: 300),
      );
      await Future.delayed(const Duration(milliseconds: 50));
    }

    // Fetch new bookings
    await controller.getBooking(
        {"booking_status": status.toString(), "service_type": "all"});

    final data = controller.bookingModelSecond.data ?? [];

    // Insert with right-to-left animation
    for (int i = 0; i < data.length; i++) {
      _items.insert(i, data[i]);
      _listKey.currentState?.insertItem(i);
      await Future.delayed(const Duration(milliseconds: 100));
    }

    setState(() => _isLoading = false);
  }

  Widget detailsComponent(
    String time,
    String title,
    String location,
    String calender,
    bool isCompleted,
    bool isCancelled,
    bool isFollowUp,
    bool isPending,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Albert Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ImageIcon(
                    AssetImage("assets/icons/ic_location.png"),
                    size: 12,
                    color: primaryAppColor,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      location,
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
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ImageIcon(
                    AssetImage("assets/icons/ic_clock.png"),
                    size: 12,
                    color: const Color(0xFF207FA7),
                  ),
                  SizedBox(width: 5),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.black.withAlpha(102),
                      fontSize: 12,
                      fontFamily: 'Albert Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage("assets/icons/ic_calender.png"),
                        size: 12,
                        color: const Color(0xFF207FA7),
                      ),
                      SizedBox(width: 5),
                      Text(
                        calender,
                        style: TextStyle(
                          color: Colors.black.withAlpha(102),
                          fontSize: 12,
                          fontFamily: 'Albert Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  isPending
                      ? GestureDetector(
                          onTap: () {
                            Get.to(
                              () => ShuruKare(
                                id: Get.find<DashBoardController>()
                                        .bookingModelSecond
                                        .data?[index]
                                        .id ??
                                    "",
                                onBookingUpdated: () async {
                                  if (Get.isOverlaysOpen) {
                                    Get.back();
                                  }
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) async {
                                    if (mounted) {
                                      await fetchDataForTab("accepted");
                                    }
                                  });
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFF207FA7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Text(
                              'Suru Karein',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Albert Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Get.to(
                              () => ShuruKare(
                                id: Get.find<DashBoardController>()
                                        .bookingModelSecond
                                        .data?[index]
                                        .id ??
                                    "",
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFF207FA7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Text(
                              "View Details",
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
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Colors.black.withAlpha(38)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Canceled Banner
          if (isCancelled)
            Positioned(
              top: 0,
              right: 0,
              child: Banner(
                message: "Canceled",
                location: BannerLocation.topEnd,
                color: Colors.red,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildListView() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_items.isEmpty) {
      return const Center(child: Text("Oops! No Booking is there"));
    }

    return AnimatedList(
      key: _listKey,
      initialItemCount: _items.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0), // from right
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: detailsComponent(
                DateFormat("hh:mm a")
                    .format(DateTime.parse(
                        _items[index]?.serviceSchedule ?? '11:00 AM'))
                    .toString(),
                _items[index]?.subCategory.name ?? 'Service Name',
                _items[index]?.serviceAddress?.address ?? 'Location',
                DateFormat("d MMMM y")
                    .format(DateTime.parse(
                        _items[index]?.serviceSchedule ?? '11:00 AM'))
                    .toString(),
                _items[index]?.bookingStatus == "completed",
                _items[index]?.bookingStatus == "canceled",
                _items[index]?.bookingStatus == "ongoing",
                _items[index]?.bookingStatus == "accepted",
                index,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: primaryAppColor,
              unselectedLabelColor: Colors.black.withAlpha(102),
              indicatorColor: primaryAppColor,
              tabs: const [
                Tab(text: 'Pending'),
                Tab(text: 'Follow up'),
                Tab(text: 'Pura hua'),
                Tab(text: 'Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(statusList.length, (index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: buildListView(),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
