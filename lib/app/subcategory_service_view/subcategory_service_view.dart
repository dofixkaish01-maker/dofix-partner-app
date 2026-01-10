
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dofix_technichian/widgets/custom_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shimmer/shimmer.dart';


import '../../model/service_model_second/service_model_second.dart';
import '../../utils/dimensions.dart';
import '../../utils/price_controller.dart';
import '../views/service_center_dialog.dart';

class SubcategoryServiceView extends StatefulWidget {
  final String categoryId;
  final String subCategoryId;
  final List<ServiceModel> serviceList;
  const SubcategoryServiceView({super.key, required this.categoryId, required this.subCategoryId, required this.serviceList});

  @override
  State<SubcategoryServiceView> createState() => _SubcategoryServiceViewState();
}

class _SubcategoryServiceViewState extends State<SubcategoryServiceView>  with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (categoryController){
      return Container(
        height: Get.height/1.7,
        width:Get.width,
        padding: const EdgeInsets.only(top: Dimensions.paddingSize30),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: [

            Center(child: Container(height: 5,width: 90,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.fontSizeDefault),
              color: Theme.of(context).hintColor,
            ),)),
            const SizedBox(height: Dimensions.paddingSizeDefault,),
            //
            GetBuilder<DashBoardController>(builder: (serviceController){

              if(widget.serviceList.isEmpty){
                return SizedBox( height: Get.height/2, child: Text("NO SERVICE FOUND"));

              }else if(widget.serviceList.isNotEmpty){
                return Padding(padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault,
                  bottom:  Dimensions.paddingSizeDefault,
                ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: Dimensions.paddingSize30,),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.serviceList.length,
                      itemBuilder: (context, index) {
                        final discountModel = PriceConverter.discountCalculation(widget.serviceList[index]);                        num lowestPrice = 0.0;
                        if(widget.serviceList[index].variations != null){
                          lowestPrice = widget.serviceList[index].variations ![0].price!;
                          for (var i = 0; i < widget.serviceList[index].variations !.length; i++) {
                            if (widget.serviceList[index].variations ![i].price! < lowestPrice) {
                              lowestPrice = widget.serviceList[index].variations ![i].price!;
                            }
                          }
                        }
                        return GestureDetector(
                          onTap: (){
                            Get.back();
                            showModalBottomSheet(
                                useRootNavigator: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context, builder: (context) => ServiceCenterDialog(service: widget.serviceList[index],selectedServiceIndex: index,));
                          },
                          child: Padding(
                            padding:  const EdgeInsets.symmetric(vertical:Dimensions.paddingSize4,horizontal: Dimensions.paddingSizeDefault),
                            child: Container(
                              padding: const EdgeInsets.all(Dimensions.paddingSize5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow:  [BoxShadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 10,
                                    color: Get.isDarkMode ? Colors.grey.shade800 :  Colors.grey.shade200,
                                  )],
                                  color: Theme.of(context).cardColor
                              ),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                ClipRRect(borderRadius: BorderRadius.circular(12),
                                    child: CustomNetworkImageWidget(height: 90, width: 90, fit: BoxFit.cover,
                                        image: "${widget.serviceList[index].thumbnailFullPath}")),

                                const SizedBox(width: Dimensions.paddingSizeDefault,),
                                Expanded(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    const SizedBox(height: Dimensions.paddingSize5,),
                                    Text( widget.serviceList[index].name??"", style: albertSansMedium.copyWith(fontSize: 16),
                                        maxLines: 1, overflow: TextOverflow.ellipsis),
                                    const SizedBox(height: Dimensions.paddingSize5),
                                    Text("Start From".tr,style: albertSansRegular.copyWith(fontSize: 16,
                                        color: Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha:0.5)),),
                                    const SizedBox(height: Dimensions.paddingSize5),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if(discountModel.discountAmount! > 0)
                                          Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: Text(
                                              "₹ "+
                                              PriceConverter.convertPrice(lowestPrice.toDouble()),
                                              maxLines: 2,
                                              style: albertSansRegular.copyWith(
                                                  fontSize: 8,
                                                  decoration: TextDecoration.lineThrough,
                                                  color: Theme.of(context).colorScheme.error.withValues(alpha:.8)),),
                                          ),
                                        discountModel.discountAmount! > 0?
                                        Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Text( "₹ "+
                                            PriceConverter.convertPrice(
                                                lowestPrice.toDouble(),
                                                discount: discountModel.discountAmount!.toDouble(),
                                                discountType: discountModel.discountAmountType),
                                            style: albertSansRegular.copyWith(
                                                fontSize: 16,
                                                color:  Get.isDarkMode? Theme.of(context).primaryColorLight: Theme.of(context).primaryColor),
                                          ),
                                        ): Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Text( "₹ "+PriceConverter.convertPrice(lowestPrice.toDouble()),
                                            style: albertSansMedium.copyWith(fontSize: 16,
                                              color: Get.isDarkMode? Theme.of(context).primaryColorLight: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],),
                                )
                              ],),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSize40),
                  ]),
                );
              }else{
                return  GridView.builder(
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: Dimensions.paddingSize30,
                    mainAxisSpacing:  Dimensions.paddingSizeDefault ,
                    crossAxisCount:  1,
                    mainAxisExtent:  120,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: Dimensions.paddingSize40,top: Dimensions.paddingSizeDefault),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder:(BuildContext context, index) {
                    return  const Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                      child: SubCategoryShimmer(isEnabled: true, hasDivider: false),
                    );
                  },
                );
              }
            })
          ]),
        ),
      );
    });
  }
}

class SubCategoryShimmer extends StatelessWidget {
  final bool? isEnabled;
  final bool? hasDivider;
  const SubCategoryShimmer({super.key, required this.isEnabled, required this.hasDivider});

  @override
  Widget build(BuildContext context) {


    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(
        color: Get.isDarkMode?Colors.grey[700]:Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Get.isDarkMode? null: [BoxShadow(color: Colors.grey[300]!, blurRadius: 10, spreadRadius: 1)],
      ),
      child: Shimmer(
        direction: ShimmerDirection.ltr,
        enabled: isEnabled!,
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade300,
            Colors.grey.shade100,
            Colors.grey.shade300,
          ],
          stops: const [0.1, 0.3, 0.4],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width:  50,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeDefault,),
                Expanded(
                  flex: 5,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      height:  20,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height:  8,
                      margin: const EdgeInsets.only(right: Dimensions.paddingSize30),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSize5),
                    Container(
                      height:  8,
                      margin: const EdgeInsets.only(right: 100),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
