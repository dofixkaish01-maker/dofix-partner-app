// import 'package:dofix_technichian/controllers/dashboard_controller.dart';
// import 'package:dofix_technichian/model/booking_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../model/service_model.dart';
// import '../../widgets/custom_image_viewer.dart';
// import '../views/naya_kaam/service_details_screen.dart';
// import 'custom_button_widget.dart';
//
// class ServiceContainer extends StatelessWidget {
//   final ServiceModel? serviceModel;
//   final bool? isButtonShow;
//
//   const ServiceContainer({super.key, this.serviceModel, this.isButtonShow = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: GestureDetector(
//         onTap: () {
//           Get.find<DashBoardController>().getServicesDetails(serviceModel?.id ?? "");
//         },
//         child: Container(
//           padding: const EdgeInsets.all(10), // Added padding for better spacing
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
//                 children: [
//                   CustomNetworkImageWidget(
//                     image: serviceModel?.thumbnailFullPath ?? "",
//                     height: 91.0, // Fixed height instead of double.infinity
//                     width: 91.0,
//                   ),
//                   const SizedBox(width: 10), // Add spacing between image and text
//                   Flexible( // Prevents Row layout error
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min, // Avoids unnecessary expansion
//                       children: [
//                         Text(
//                           serviceModel?.name ?? "",
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Visibility(
//                           visible: serviceModel?.ratingCount != 0,
//                           child: Row(
//                             children: [
//                               Text(
//                                 serviceModel?.ratingCount?.toString() ?? "0",
//                                 style: const TextStyle(fontSize: 14),
//                               ),
//                               const SizedBox(width: 5),
//                               const Icon(Icons.star, color: Colors.yellow, size: 13),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 serviceModel?.category?.name ?? "N/A",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(fontSize: 14),
//                               ),
//                             ),
//                             Text(
//                               "₹ ${(double.tryParse(serviceModel?.minBiddingPrice ?? "0")?.toInt() ?? 0)}",
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF207FA7),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 5),
//                         if (isButtonShow ?? false)
//                           CustomButtonWidget(
//                             height: 40,
//                             onPressed: () {
//                               showBookingSheet(context, serviceModel?.id ?? "");
//                             },
//                             buttonText: "Book",
//                             transparent: false,
//                             textColor: Colors.white,
//                             borderSideColor: const Color(0xFF207FA7),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class BookingContainer extends StatelessWidget {
//   final Booking? booking;
//   final isButtonShow = false;
//   const BookingContainer({super.key, this.booking});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: GestureDetector(
//         onTap: (){
//           // Get.find<DashBoardController>().getServicesDetails(booking?.serviceId ?? "");
//         },
//         child: ListTile(
//           // leading: CustomNetworkImageWidget(
//           //   image: booking?.serviceDetails?.thumbnailFullPath ?? "",
//           //   height: 91,
//           //   width: 91,
//           // ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 booking?.date ?? "",
//                 style: const TextStyle(
//                     fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   Text(
//                     booking?.serviceDetails?.name.toString() ?? "0",
//                     maxLines: 1,
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                   // const SizedBox(width: 5),
//                   // Text(
//                   //   booking.serviceDetails..toString() ?? "0",
//                   //   maxLines: 1,
//                   //   style: const TextStyle(fontSize: 14,color: Colors.blueAccent),
//                   // ),
//                 ],
//               ),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   Text(
//                     booking?.serviceDetails?.category?.name?.toString() ?? "0",
//                     maxLines: 1,
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                   const Spacer(),
//                   GestureDetector(
//                     onTap: (){
//                       Get.find<DashBoardController>().getServicesDetails(booking?.serviceId ?? "");
//                     },
//                     child: Text(
//                       'View Details',
//                       style: TextStyle(
//                         color: Color(0xFF207FA7),
//                         fontSize: 12,
//                         fontFamily: 'Albert Sans',
//                         fontWeight: FontWeight.w400,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               // const SizedBox(height: 5),
//           //     Visibility(
//           //       visible: isButtonShow,
//           //       child: Text(
//           //         "₹ ${(double.tryParse(serviceModel?.minBiddingPrice ?? "0")?.toInt() ?? 0)}",
//           //         style: const TextStyle(
//           //             fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF207FA7)),
//           //       ),
//           //     ),
//           //     const SizedBox(height: 5),
//           //   ],
//           // ),
//           // trailing: Visibility(
//           //   visible: isButtonShow,
//           //   child: SizedBox(
//           //     width: 70, // Set a fixed width for the trailing widget
//           //     child: CustomButtonWidget(
//           //       height: 40,
//           //       onPressed: () {},
//           //       buttonText: "Add",
//           //       transparent: false,
//           //       textColor: Colors.white,
//           //       borderSideColor: const Color(0xFF207FA7),
//           //     ),
//           ]  ),
//           ),
//         ),
//       );
//   }
// }
