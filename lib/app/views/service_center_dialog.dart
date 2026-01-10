import 'package:dofix_technichian/app/views/dashboard/dashboard_screen.dart';
import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/widgets/custom_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/service_model_second/service_model_second.dart';
import '../../utils/dimensions.dart';
import '../../utils/price_controller.dart';

class ServiceCenterDialog extends StatefulWidget {
  final ServiceModel? service;
  final int selectedServiceIndex;
  const ServiceCenterDialog({super.key, this.service, required this.selectedServiceIndex});

  @override
  State<ServiceCenterDialog> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ServiceCenterDialog> {

  @override
  void initState() {
    super.initState();
    Get.find<DashBoardController>().resetSelectedServiceVariationQuantity(widget.selectedServiceIndex);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (bookingEditController){

      return Container(
        width: Dimensions.webMaxWidth,
        padding: const EdgeInsets.all(Dimensions.paddingSize30),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child:  Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: Dimensions.paddingSize25*2,),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeDefault)),
                child: CustomNetworkImageWidget(
                  image: '${widget.service?.thumbnailFullPath}',
                  height: 60, width: 60,
                ),
              ),
              Container( height: 40, width: 40, alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70.withValues(alpha:0.6),
                    boxShadow:Get.isDarkMode ? null : [BoxShadow(color: Colors.grey[300]!, blurRadius: 2, spreadRadius: 1,)]
                ),
                child: InkWell( onTap: () => Get.back(),
                  child: const Icon(Icons.close, color: Colors.black54,),
                ),
              )
            ],
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize30),
            child: Text( widget.service?.name??"", style: albertSansMedium.copyWith(fontSize: Dimensions.fontSizeDefault), textAlign: TextAlign.center, maxLines: 2,),
          ),


          Text(
            "${widget.service?.variations?.length??"0"} ${'Variation Available'.tr}",
            style: albertSansRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha:.5)),
          ),

          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: Get.height * 0.1,
                maxHeight: Get.height * 0.4
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.service?.variations?.length,
                padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  const EdgeInsets.symmetric(vertical:Dimensions.paddingSize12),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,Dimensions.paddingSize12,0,Dimensions.paddingSize5),
                      decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [
                        BoxShadow(
                          color: Get.isDarkMode ? Colors.transparent : Theme.of(context).primaryColor.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeDefault),),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${widget.service?.variations?[index].variantKey.toString().capitalizeFirst}".replaceAll('-', ' '), style: albertSansMedium.copyWith(fontSize: Dimensions.fontSize13),
                                  maxLines: 2, overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: Dimensions.paddingSize5,),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text("₹ "+ PriceConverter.convertPrice(widget.service?.variations?[index].price,isShowLongPrice:true),
                                      style: albertSansMedium.copyWith(color:  Get.isDarkMode? Theme.of(context).primaryColorLight: Theme.of(context).primaryColor, fontSize: Dimensions.fontSize13)),
                                ),
                              ],
                            ),
                          ),

                          Expanded( flex:1,
                            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                              widget.service!.variations![index].quantity > 0 ? InkWell(
                                onTap: (){
                                  bookingEditController.updatedVariationQuantity(widget.selectedServiceIndex, index, increment: false);
                                },
                                child: Container(
                                  height: 30, width: 30,
                                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize12),
                                  decoration: BoxDecoration(shape: BoxShape.circle, color:  Theme.of(context).colorScheme.tertiary),
                                  alignment: Alignment.center,
                                  child: Icon(Icons.remove , size: 15, color:Theme.of(context).cardColor,),
                                ),
                              ) : const SizedBox(),

                              widget.service!.variations![index].quantity > 0 ? Text(
                                widget.service!.variations![index].quantity.toString(),
                              ) : const SizedBox(),

                              GestureDetector(
                                onTap: (){
                                  bookingEditController.updatedVariationQuantity(widget.selectedServiceIndex, index, increment: true);
                                },
                                child: Container(
                                  height: 30, width: 30,
                                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize12),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:  Theme.of(context).colorScheme.tertiary
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add ,
                                    size: 15,
                                    color:Theme.of(context).cardColor,
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ]),
                      ),
                    ),
                  );
                }),
          ),

          CustomButtonWidget(
            height: 45,
            onPressed: bookingEditController.isCartButtonActive? () async {
              await bookingEditController.addMultipleCartItem(widget.selectedServiceIndex);
              Get.back();
            } : null,
            buttonText: 'Add TO Cart'.tr,
          ),
        ],
        ),
      );
    });
  }
}
