import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdComponent extends StatefulWidget {
  const ThirdComponent({super.key});

  @override
  _ThirdComponentState createState() => _ThirdComponentState();
}

class _ThirdComponentState extends State<ThirdComponent> {
  final List<String> imageList = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  int _currentIndex = 0; // Track active index

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      final pendingBookings = (controller.bookingModel.data ?? [])
          .where((b) => b.bookingStatus == "accepted")
          .toList();

      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              // offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F2F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/pending_notificationicon.png",
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Pending Notifications',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Albert Sans',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),
              Divider(height: 1, thickness: 1, color: Colors.black12),
              const SizedBox(height: 14),

              Visibility(
                visible: pendingBookings.isNotEmpty,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0x33C61414)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline,
                          size: 18, color: Color(0xFFC61414)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Aaj ke ${pendingBookings.length} kaam pending hai',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFC61414),
                            fontSize: 14,
                            fontFamily: 'Albert Sans',
                            fontWeight: FontWeight.w500,
                            height: 1.35,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// spacing after pending msg
              Visibility(
                visible: pendingBookings.isNotEmpty,
                child: const SizedBox(height: 14),
              ),

              Visibility(
                visible: pendingBookings.isEmpty,
                child: Container(
                  height: 74,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black.withOpacity(0.06)),
                  ),
                  child: Center(
                    child: Text(
                      "No Notifications Found",
                      style: TextStyle(
                        color: Colors.black.withAlpha(102),
                        fontSize: 14,
                        fontFamily: 'Albert Sans',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ListView.separated(
              //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, i) {
              //     return Column(
              //       children: [
              //         Row(
              //           children: [
              //             Expanded(
              //                 child: Text(
              //               'Shilpa Singh',
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 14,
              //                 fontFamily: 'Albert Sans',
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             )),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: [
              //                 Text(
              //                   '10-10-2024',
              //                   style: TextStyle(
              //                     color: Colors.black.withAlpha(102),
              //                     fontSize: 14,
              //                     fontFamily: 'Albert Sans',
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //               ],
              //             )
              //           ],
              //         ),
              //         SizedBox(height: 5),
              //         Row(
              //           children: [
              //             Expanded(
              //                 child: Text(
              //               'AC service ke baad aa rahi hai smell',
              //               style: TextStyle(
              //                 color: Colors.black.withValues(alpha: 102),
              //                 fontSize: 14,
              //                 fontFamily: 'Albert Sans',
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             )),
              //           ],
              //         ),
              //         SizedBox(height: 15),
              //         Row(
              //           children: [
              //             Flexible(
              //               child: Container(
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                     side: BorderSide(
              //                       width: 0.5,
              //                       strokeAlign: BorderSide.strokeAlignCenter,
              //                       color: Colors.grey,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         )
              //       ],
              //     );
              //   },
              //   separatorBuilder: (context, i) {
              //     return SizedBox(height: 15);
              //   },
              //   itemCount: imageList.length,
              // ),

              const SizedBox(height: 6),
            ],
          ),
        ),
      );
    });
  }
}
