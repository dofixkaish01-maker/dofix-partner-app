import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/sizeboxes.dart';
import '../../utils/styles.dart';
import '../../utils/theme.dart';
import 'custom_buttons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final bool isTitleExist;
  final bool? isSearchButtonExist;
  final Function? onBackPressed;
  final Widget? menuWidget;
  final Widget? drawerButton;
  final Color? bgColor;
  final Color? iconColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.isBackButtonExist = false,
    this.menuWidget,
    this.drawerButton,
    this.bgColor,
    this.iconColor,
    this.isSearchButtonExist = true,
    this.isTitleExist = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  polish values
    final double bottomRadius = 18;
    final Color borderClr = Colors.black.withOpacity(0.06);

    return AppBar(
      shadowColor: Colors.transparent,
      elevation: 0,
      backgroundColor: Colors.transparent,
      //  so ClipRRect radius works cleanly
      automaticallyImplyLeading: false,

      //  Bottom radius + border + subtle shadow
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(bottomRadius),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(bottomRadius),
            ),
            border: Border(
              bottom: BorderSide(color: borderClr, width: 1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: GetBuilder<DashBoardController>(builder: (controller) {
            return FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Images.iclogo,
                              height: 70,
                              width: 70,
                            ),
                          ],
                        ),
                        // CustomNotificationButton(
                        //   icon: Icons.shopping_cart,
                        //   tap: () {},
                        //   color: Theme.of(context).primaryColor,
                        // )
                      ],
                    ),
                    Visibility(
                      visible: !isBackButtonExist && !isTitleExist,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_sharp,
                                color: iconColor ?? Colors.black,
                                size: Dimensions.fontSize18),
                            Expanded(
                              child: Text(
                                controller.address ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: albertSansRegular.copyWith(
                                  fontSize: Dimensions.fontSize14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isTitleExist,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              title ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Albert Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(child: menuWidget ?? const SizedBox())
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isBackButtonExist,
                      child: const SizedBox(height: 10),
                    ),
                    Visibility(
                      visible: isBackButtonExist,
                      child: InkWell(
                        onTap: () {
                          // logic same
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back,
                                color: iconColor ?? Colors.black,
                                size: Dimensions.fontSize18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                title ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: albertSansRegular.copyWith(
                                  fontSize: Dimensions.fontSize14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(child: menuWidget ?? const SizedBox())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),

      //  Search bar (same condition) — add subtle border polish
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Visibility(
          visible: isSearchButtonExist ?? true,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // Get.to(() => SearchScreen());
                  },
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize10),
                    decoration: BoxDecoration(
                      color: primaryColorDuskyWhite,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      border: Border.all(color: borderClr, width: 1), //  border
                    ),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.search,
                          color: Theme.of(context).hintColor,
                        ),
                        sizedBoxW10(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Search Service",
                                style: albertSansRegular.copyWith(
                                  fontSize: Dimensions.fontSize13,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight((isSearchButtonExist ?? true) ? 180 : 140);
}

class CustomMenuButton extends StatelessWidget {
  final Function() tap;

  const CustomMenuButton({super.key, required this.tap});

  @override
  Widget build(BuildContext context) {
    return CustomNotificationButton(
      icon: Icons.shopping_cart,
      tap: () {
        tap; // (same as your code)
      },
      color: Theme.of(context).primaryColor,
    );
  }
}

// import 'package:dofix_technichian/controllers/dashboard_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import '../../utils/dimensions.dart';
// import '../../utils/images.dart';
// import '../../utils/sizeboxes.dart';
// import '../../utils/styles.dart';
// import '../../utils/theme.dart';
// import 'custom_buttons.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final bool isBackButtonExist;
//   final bool isTitleExist;
//   final bool? isSearchButtonExist;
//   final Function? onBackPressed;
//   final Widget? menuWidget;
//   final Widget? drawerButton;
//   final Color? bgColor;
//   final Color? iconColor;
//
//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     this.onBackPressed,
//     this.isBackButtonExist = false,
//     this.menuWidget,
//     this.drawerButton,
//     this.bgColor,
//     this.iconColor,
//     this.isSearchButtonExist = true,
//     this.isTitleExist = true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       shadowColor: Colors.transparent,
//       backgroundColor: Colors.white,
//       automaticallyImplyLeading: false,
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(40.0),
//         child: Visibility(
//           visible: isSearchButtonExist ?? true,
//           child: Padding(
//             padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     // Get.to(() => SearchScreen());
//                   },
//                   child: Container(
//                     height: 45,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: Dimensions.paddingSize10),
//                     decoration: BoxDecoration(
//                       color: primaryColorDuskyWhite,
//                       borderRadius: BorderRadius.circular(Dimensions.radius15),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           CupertinoIcons.search,
//                           color: Theme.of(context).hintColor,
//                         ),
//                         sizedBoxW10(),
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Search Service",
//                                 style: albertSansRegular.copyWith(
//                                     fontSize: Dimensions.fontSize13,
//                                     color: Theme.of(context)
//                                         .hintColor), // Different color for "resend"
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       flexibleSpace: GetBuilder<DashBoardController>(builder: (controller) {
//         return FlexibleSpaceBar(
//           background: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: Dimensions.paddingSizeDefault),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           Images.iclogo,
//                           height: 70,
//                           width: 70,
//                         ),
//                       ],
//                     ),
//                     // CustomNotificationButton(
//                     //   icon: Icons.shopping_cart,
//                     //   tap: () {},
//                     //   color: Theme
//                     //       .of(context)
//                     //       .primaryColor,
//                     // )
//                   ],
//                 ),
//                 Visibility(
//                   visible: !isBackButtonExist && !isTitleExist,
//                   child: InkWell(
//                     onTap: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(Icons.location_on_sharp,
//                             color: Colors.black, size: Dimensions.fontSize18),
//                         Expanded(
//                             child: Text(
//                           controller.address ?? "",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: albertSansRegular.copyWith(
//                               fontSize: Dimensions.fontSize14,
//                               color: Theme.of(context).hintColor),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: isTitleExist,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                           child: Text(
//                         title ?? "",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontFamily: 'Albert Sans',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Flexible(child: menuWidget ?? SizedBox())
//                     ],
//                   ),
//                 ),
//                 Visibility(
//                   visible: isBackButtonExist,
//                   child: SizedBox(
//                     height: 10,
//                   ),
//                 ),
//                 Visibility(
//                   visible: isBackButtonExist,
//                   child: InkWell(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(Icons.arrow_back,
//                             color: Colors.black, size: Dimensions.fontSize18),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                             child: Text(
//                           title ?? "",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: albertSansRegular.copyWith(
//                               fontSize: Dimensions.fontSize14,
//                               color: Theme.of(context).hintColor),
//                         )),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Flexible(child: menuWidget ?? SizedBox())
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   @override
//   Size get preferredSize =>
//       Size.fromHeight((isSearchButtonExist ?? true) ? 180 : 140);
// }
//
// class CustomMenuButton extends StatelessWidget {
//   final Function() tap;
//
//   const CustomMenuButton({super.key, required this.tap});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomNotificationButton(
//       icon: Icons.shopping_cart,
//       tap: () {
//         tap;
//       },
//       color: Theme.of(context).primaryColor,
//     );
//   }
// }
