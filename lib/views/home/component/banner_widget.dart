import 'package:flutter/material.dart';

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
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER
            Row(
              children: [
                Image.asset(
                  "assets/images/pending_notificationicon.png",
                  width: 18,
                  height: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Pending Notifications',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Albert Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// EMPTY STATE
            SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  "No Notifications Found",
                  style: TextStyle(
                    color: Colors.black.withAlpha(102),
                    fontSize: 14,
                    fontFamily: 'Albert Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

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

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
