import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/widgets/custom_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../../model/booking_details_content/booking_details_content.dart';
import '../../utils/dimensions.dart';
import '../subcategory_service_view/subcategory_service_view.dart';
import '../widgets/custom_appbar.dart';

enum BookingEditType { regular, repeat, subBooking }

class BookingEditScreen extends StatefulWidget {
  final BookingEditType bookingEditType;
  const BookingEditScreen({super.key, required this.bookingEditType});
  @override
  State<BookingEditScreen> createState() => _BookingEditScreenState();
}

class _BookingEditScreenState extends State<BookingEditScreen> {
  @override
  void initState() {
    super.initState();

    var bookingDetails2Controller = Get.find<DashBoardController>();

    Get.find<DashBoardController>().initializedControllerValue(
      bookingDetails2Controller.bookingDetails2?.content,
      shouldUpdate: false,
    );

    // Get.find<DashBoardController>().updateIsCheckedAllUpcomingBooking(shouldUpdate: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Booking".tr,
        onBackPressed: () {
          Get.back();
        },
        isBackButtonExist: true,
        isSearchButtonExist: false,
      ),
      body: GetBuilder<DashBoardController>(builder: (bookingEditController) {
        // String? providerId = Get.find<UserProfileController>().providerModel?.content?.providerInfo?.id;
        // RepeatBooking ? nextBooking = BookingHelper.getNextUpcomingRepeatBooking(Get.find<bookingDetails2Controller>().bookingDetails2?.content, providerId);

        return Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service List'.tr,
                          style: albertSansRegular.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: Dimensions.fontSize20),
                        ),
                        widget.bookingEditType == BookingEditType.regular
                            ? TextButton(
                                onPressed: bookingEditController
                                                .cartList.length ==
                                            1 &&
                                        bookingEditController
                                                .cartList[0].variantKey ==
                                            null
                                    ? null
                                    : () async {
                                        await bookingEditController
                                            .getServiceListBasedOnSubcategory(
                                                subCategoryId:
                                                    bookingEditController
                                                            .bookingDetails2
                                                            ?.content
                                                            ?.subcategoryId ??
                                                        "");

                                        showModalBottomSheet(
                                            useRootNavigator: true,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) =>
                                                SubcategoryServiceView(
                                                  categoryId: "",
                                                  subCategoryId: '',
                                                  serviceList:
                                                      bookingEditController
                                                              .serviceList ??
                                                          [],
                                                ));
                                      },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                        color: bookingEditController
                                                        .cartList.length ==
                                                    1 &&
                                                bookingEditController
                                                        .cartList[0]
                                                        .variantKey ==
                                                    null
                                            ? Theme.of(context).hintColor
                                            : Theme.of(context)
                                                .primaryColor), // Customize the border color here
                                  ),
                                ),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: bookingEditController
                                                        .cartList.length ==
                                                    1 &&
                                                bookingEditController
                                                        .cartList[0]
                                                        .variantKey ==
                                                    null
                                            ? Theme.of(context).hintColor
                                            : Theme.of(context).primaryColor,
                                        size: Dimensions.fontSizeDefault,
                                      ),
                                      const SizedBox(
                                          width:
                                              8.0), // Adjust the spacing between the icon and text here
                                      Text(
                                        "Add Service".tr,
                                        style: albertSansMedium.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: bookingEditController
                                                          .cartList.length ==
                                                      1 &&
                                                  bookingEditController
                                                          .cartList[0]
                                                          .variantKey ==
                                                      null
                                              ? Theme.of(context).hintColor
                                              : Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ]),
                              )
                            : const SizedBox()
                      ],
                    ),

                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),

                    GridView.builder(
                      key: UniqueKey(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: Dimensions.paddingSize30,
                        mainAxisSpacing: Dimensions.paddingSizeDefault,
                        childAspectRatio: 6,
                        crossAxisCount: 1,
                        mainAxisExtent: 110,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bookingEditController.cartList.length,
                      itemBuilder: (context, index) {
                        bool disableQuantityButton =
                            bookingEditController.cartList.length == 1 &&
                                bookingEditController.cartList[0].variantKey ==
                                    null;
                        return CartServiceWidget(
                          bookingEditType: widget.bookingEditType,
                          cart: bookingEditController.cartList[index],
                          cartIndex: index,
                          disableQuantityButton: disableQuantityButton,
                        );
                      },
                    ),

                    SizedBox(
                      height: widget.bookingEditType == BookingEditType.repeat
                          ? 20
                          : 0,
                    ),

                    // widget.bookingEditType == BookingEditType.repeat ? const _CheckAllUpcomingBookingWidget() : const SizedBox(),

                    const SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault, vertical: 10),
              child: SafeArea(
                child: CustomButtonWidget(
                  buttonText: "Update Status".tr,
                  // isLoading: bookingEditController.statusUpdateLoading,
                  onPressed: () {
                    bookingEditController.updateBooking(
                      bookingId: Get.find<DashBoardController>()
                          .bookingDetails2
                          ?.content
                          ?.id,
                      subBookingId: Get.find<DashBoardController>()
                          .subBookingDetails
                          ?.content
                          ?.id,
                      zoneId: Get.find<DashBoardController>()
                          .bookingDetails2
                          ?.content
                          ?.zoneId,
                      bookingEditType: widget.bookingEditType,
                    );
                  },
                ),
              ),
            ),
          )
        ]);
      }),
    );
  }
}

class CartServiceWidget extends StatelessWidget {
  final CartModel? cart;
  final int cartIndex;
  final bool disableQuantityButton;
  final BookingEditType bookingEditType;

  const CartServiceWidget({
    super.key,
    required this.cart,
    required this.cartIndex,
    required this.disableQuantityButton,
    required this.bookingEditType,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (bookingEditController) {
      return Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              // Positioned(
              //   right: Get.find<LocalizationController>().isLtr ? 22 : null,
              //   left: Get.find<LocalizationController>().isLtr ? null : 22,
              //   child: Image.asset(Images.servicemanDelete, width: 22.0),
              // ),

              bookingEditController.cartList.length > 1 &&
                      bookingEditType == BookingEditType.regular
                  ? Dismissible(
                      key: UniqueKey(),
                      onDismissed: (DismissDirection direction) =>
                          bookingEditController.removeCartItem(cartIndex),
                      child: CartItemView(
                        bookingEditController: bookingEditController,
                        cart: cart,
                        cartIndex: cartIndex,
                        disableQuantityButton: disableQuantityButton,
                        bookingEditType: bookingEditType,
                      ),
                    )
                  : CartItemView(
                      bookingEditController: bookingEditController,
                      cart: cart,
                      cartIndex: cartIndex,
                      disableQuantityButton: disableQuantityButton,
                      bookingEditType: bookingEditType,
                    ),
            ]),
      );
    });
  }
}

class CartItemView extends StatelessWidget {
  final DashBoardController bookingEditController;
  final CartModel? cart;
  final int cartIndex;
  final bool disableQuantityButton;
  final BookingEditType bookingEditType;
  const CartItemView(
      {super.key,
      required this.bookingEditController,
      this.cart,
      required this.cartIndex,
      required this.disableQuantityButton,
      required this.bookingEditType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeDefault,
          horizontal: Dimensions.paddingSize25),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Colors.white.withValues(alpha: .2)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 5,
            spreadRadius: 0.5,
            offset: const Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: Get.width / 1,
                child: Row(children: [
                  const SizedBox(width: Dimensions.paddingSize12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomNetworkImageWidget(
                      image: '${cart?.serviceThumbnail}',
                      height: 65,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: Dimensions.paddingSize12),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cart?.serviceName ?? "",
                            style: albertSansRegular.copyWith(fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          if (cart?.variantKey != null)
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Text(
                                cart?.variantKey ?? "",
                                style: albertSansMedium.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withValues(alpha: .6),
                                    fontSize: Dimensions.fontSizeDefault),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          const SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              "₹ " + (cart?.totalCost?.toString() ?? "0"),
                              style: albertSansMedium.copyWith(
                                  fontSize: Dimensions.fontSizeDefault,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withValues(alpha: .6)),
                            ),
                          ),
                          // const SizedBox(height: 5),
                        ]),
                  ),
                ]),
              ),
            ),
            if (!disableQuantityButton)
              Align(
                alignment: Alignment.centerRight,
                child: Row(children: [
                  if (cart!.quantity! > 1)
                    QuantityButton(
                      onTap: () {
                        bookingEditController.updateCartItemQuantity(
                            cart!, cartIndex,
                            increment: false);
                      },
                      isIncrement: false,
                    ),
                  if (cart!.quantity == 1 &&
                      bookingEditController.cartList.length > 1 &&
                      bookingEditType == BookingEditType.regular)
                    InkWell(
                      onTap: () {
                        showCustomDialog(
                          child: ConfirmationDialog(
                              icon: "",
                              description:
                                  'Are You Sure Your want to delete the service'
                                      .tr,
                              onYesPressed: () {
                                bookingEditController.removeCartItem(cartIndex);
                                Get.back();
                              }),
                          useSafeArea: false,
                          barrierDismissible: true,
                        );
                      },
                      child: Container(
                        height: 22,
                        width: 22,
                        margin: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize12),
                        child: Icon(
                          Icons.delete_forever,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  Text(cart!.quantity.toString(),
                      style: albertSansMedium.copyWith(
                          fontSize: Dimensions.fontSize20)),
                  QuantityButton(
                    onTap: () {
                      bookingEditController.updateCartItemQuantity(
                          cart!, cartIndex,
                          increment: true);
                    },
                    isIncrement: true,
                  ),
                ]),
              ),
          ]),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final bool isIncrement;
  final Function()? onTap;
  const QuantityButton(
      {super.key, required this.isIncrement, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (bookingEditController) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 30,
          width: 30,
          margin:
              const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize12),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.tertiary),
          alignment: Alignment.center,
          child: Icon(
            isIncrement ? Icons.add : Icons.remove,
            size: 15,
            color: Theme.of(context).cardColor,
          ),
        ),
      );
    });
  }
}

showCustomDialog(
    {required Widget child,
    bool barrierDismissible = false,
    useSafeArea = true}) {
  Future.delayed(const Duration(milliseconds: 10), () {
    //   Get.find<UserProfileController>().trialWidgetShow(route: "show-dialog");
    // });

    Get.dialog(child,
            barrierDismissible: barrierDismissible, useSafeArea: useSafeArea)
        .then((value) {
      // Get.find<UserProfileController>().trialWidgetShow(route: Get.currentRoute.contains(RouteHelper.businessPlan) ? "show-dialog" :"");
    });
  });
}

class ConfirmationDialog extends StatelessWidget {
  final String? icon;
  final double iconSize;
  final Icon? iconWidget;
  final String? title;
  final String? description;
  final Color? yesButtonColor;
  final Function()? onYesPressed;
  final String? noButtonText;
  final String? yesButtonText;
  final Color? noTextColor;
  final Color? yesTextColor;
  final Color? noButtonColor;
  final Widget? customButton;

  final Function? onNoPressed;
  final bool isLoading;
  const ConfirmationDialog(
      {super.key,
      this.icon,
      this.iconSize = 50,
      this.title,
      this.description,
      this.onYesPressed,
      this.onNoPressed,
      this.yesButtonColor = const Color(0xFFF24646),
      this.isLoading = false,
      this.iconWidget,
      this.noTextColor,
      this.yesTextColor,
      this.noButtonColor,
      this.noButtonText,
      this.yesButtonText,
      this.customButton});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Theme.of(context).cardColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSize30),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSize30),
                child: iconWidget ?? Image.asset(icon!, width: iconSize),
              ),
              title != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSize12),
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: albertSansMedium.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                      ),
                    )
                  : const SizedBox(),
              (description != null)
                  ? Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSize12),
                      child: Text(
                        description!.tr,
                        style: albertSansRegular.copyWith(
                            fontSize: Dimensions.fontSize12,
                            color: Theme.of(context).hintColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
              const SizedBox(height: Dimensions.paddingSize30),
              customButton ??
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: Dimensions.paddingSize30),
                        Expanded(
                            child: TextButton(
                          onPressed: () =>
                              onNoPressed != null ? onNoPressed!() : Get.back(),
                          style: TextButton.styleFrom(
                            backgroundColor: noButtonColor ??
                                Theme.of(context)
                                    .hintColor
                                    .withValues(alpha: 0.3),
                            minimumSize: const Size(Dimensions.webMaxWidth, 40),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            noButtonText?.tr ?? 'no'.tr,
                            textAlign: TextAlign.center,
                            style: albertSansBold.copyWith(
                              color: noTextColor ??
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                        )),
                        const SizedBox(width: Dimensions.paddingSize30),
                        Expanded(
                          child: CustomButtonWidget(
                            textColor: yesTextColor,
                            buttonText: yesButtonText?.tr ?? 'yes'.tr,
                            onPressed: () => onYesPressed != null
                                ? onYesPressed!()
                                : Get.back(),
                            radius: 12,
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: Dimensions.paddingSize30),
                      ]),
            ]),
          )),
    );
  }
}
