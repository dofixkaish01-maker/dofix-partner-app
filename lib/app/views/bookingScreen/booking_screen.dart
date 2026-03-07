import 'package:dofix_technichian/utils/theme.dart';
import 'package:dofix_technichian/widgets/common_loading.dart';
import 'package:dofix_technichian/widgets/orbit_loader.dart';
import 'package:dofix_technichian/widgets/dot_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../model/booking_status/booking_status.dart';
import '../../../utils/dimensions.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.fontSize14,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              /// LOCATION
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    const AssetImage("assets/icons/ic_location.png"),
                    size: 14,
                    color: primaryAppColor,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      location,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withAlpha(140),
                        fontSize: Dimensions.fontSize12,
                        fontFamily: 'Albert Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// TIME
              Row(
                children: [
                  const ImageIcon(
                    AssetImage("assets/icons/ic_clock.png"),
                    size: 14,
                    color: Color(0xFF207FA7),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.black.withAlpha(140),
                      fontSize: Dimensions.fontSize12,
                      fontFamily: 'Albert Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// CALENDAR + BUTTON (Responsive Clean Layout)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// LEFT - CALENDAR
                  Expanded(
                    child: Row(
                      children: [
                        const ImageIcon(
                          AssetImage("assets/icons/ic_calender.png"),
                          size: 14,
                          color: Color(0xFF207FA7),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            calender,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black.withAlpha(102),
                              fontSize: Dimensions.fontSize12,
                              fontFamily: 'Albert Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// RIGHT - BUTTON (Logic untouched)
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF207FA7),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 10),
                              child: Text(
                                'Suru Karein',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.fontSize12,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w500,
                                ),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF207FA7),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 10),
                              child: Text(
                                "View Details",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.fontSize12,
                                  fontFamily: 'Albert Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),

              const SizedBox(height: 14),

              /// SEPARATOR LINE
              Divider(
                color: Colors.black.withAlpha(38),
                thickness: 1,
              ),
            ],
          ),

          /// CANCELLED BANNER (same logic)
          if (isCancelled)
            const Positioned(
              top: 0,
              right: 0,
              child: Banner(
                message: "Canceled",
                location: BannerLocation.topEnd,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildListView() {
    if (_isLoading) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: DotWaveLoader(),
      ));
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.00),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: detailsComponent(
                DateFormat("hh:mm a")
                    .format(DateTime.parse(
                        _items[index]?.serviceSchedule ?? '11:00 AM'))
                    .toString(),
                _items[index]?.subCategory?.name ?? 'Service Name',
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
        backgroundColor: const Color(0xFFF7F8FA),
        body: SafeArea(
          child: Column(
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
        ),
      );
    });
  }
}
