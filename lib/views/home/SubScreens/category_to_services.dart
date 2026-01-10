import 'package:dofix_technichian/views/widgets/service_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/sizeboxes.dart';
import '../../../../utils/styles.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../model/service_model.dart';
import '../../widgets/custom_buttons.dart';


class CategoryToServices extends StatelessWidget {
  const CategoryToServices({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: 135.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                    child: Column(
                      children: [
                        sizedBox65(),
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
                            CustomNotificationButton(icon: Icons.shopping_cart,
                              tap: () {
                              },color: Theme.of(context).primaryColor,)
                          ],
                        ),

                        InkWell(
                          splashColor: Colors.grey.withOpacity(0.5),
                          onTap: () {
                            Get.back();

                        },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back,color : Colors.black,size:Dimensions.fontSize18),
                              SizedBox(width: 10,),
                              Expanded(
                                  child: Text("Services",
                                    maxLines: 1, overflow: TextOverflow.ellipsis,
                                    style: albertSansRegular.copyWith(fontSize: Dimensions.fontSize14,
                                        color: Theme.of(context).hintColor),)),


                            ],),
                        ),
                      ],
                    ),
                  ),
                ),
                // bottom: PreferredSize(
                //   preferredSize: const Size.fromHeight(40.0),
                //   child: Padding(
                //     padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                //     child: Column(children: [
                //       InkWell(onTap: () {
                //
                //       },
                //         child: Container(
                //           height: 45,
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: Dimensions.paddingSize10),
                //           decoration: BoxDecoration(
                //             color: primaryColorDuskyWhite,
                //             borderRadius:
                //             BorderRadius.circular(Dimensions.radius15),
                //
                //           ),
                //           child: Row(
                //             children: [
                //               Icon(
                //                 CupertinoIcons.search,
                //                 color: Theme.of(context).hintColor,
                //               ),
                //               sizedBoxW10(),
                //               RichText(
                //                 text: TextSpan(
                //                   children: [
                //                     TextSpan(
                //                       text: "Search Service",
                //                       style: albertSansRegular.copyWith(
                //                           fontSize: Dimensions.fontSize13,
                //                           color: Theme.of(context)
                //                               .hintColor), // Different color for "resend"
                //                     ),
                //
                //                   ],
                //                 ),
                //               ),
                //
                //
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //     ),
                //   ),
                // ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: Get.size.height,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context,i){
                    return Container(child: ServiceContainer(serviceModel: ((controller.categoriesToServiceListing ?? Services(data: [])).data ?? [])[i],));
                  }, separatorBuilder: (context,i){
                    return SizedBox(height: 5,);
                  }, itemCount: ((controller.categoriesToServiceListing ?? Services(data: [])).data ?? []).length
                  ),
                )
              )
            ],
          );
        }
    );
  }
}
