import 'package:dofix_technichian/model/service_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controllers/dashboard_controller.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/sizeboxes.dart';
import '../../../../utils/styles.dart';
import '../../../../widgets/selectable_button.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/service_container.dart';

class CategoryToServices extends StatelessWidget {
  const CategoryToServices({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        appBar: CustomAppBar(
          title: "Services",
          isBackButtonExist: true,
          onBackPressed: () {
            Get.back();
          },
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0,
                      color: Colors.white,
                      // color:Color(0xFF207FA7)
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                width: Get.size.width,
                height: 150,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: (){
                          controller.getCategoriesToServices(id: ((controller.subCategoryModelListing ?? SubCategoryModel(data: [])).data ?? [])[i].id.toString(), limit: '10',offset: "1",isLoading: true);
                          controller.selectedSubCategories.clear();
                          controller.selectedSubCategories.add(((controller.subCategoryModelListing ?? SubCategoryModel(data: [])).data ?? [])[i]);
                        },
                        child: Container(
                          width: 120,
                          // height: 100,
                            decoration: ShapeDecoration(
                              color: controller.selectedSubCategories.contains(
                                  ((controller.subCategoryModelListing ??
                                      SubCategoryModel(data: []))
                                      .data ??
                                      [])[i])
                                  ? Color(0x26207FA7)
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1,
                                    color:
                                controller.selectedSubCategories.contains(
                                    ((controller.subCategoryModelListing ??
                                        SubCategoryModel(data: []))
                                        .data ??
                                        [])[i]) ?
                                Color(0xFF207FA7) :Colors.grey

                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  ((controller.subCategoryModelListing ??
                                      SubCategoryModel(data: []))
                                      .data ??
                                      [])[i]
                                      .thumbnailFullPath ??
                                      "",
                                  width: 80,
                                    color:
                                    controller.selectedSubCategories.contains(
                                        ((controller.subCategoryModelListing ??
                                            SubCategoryModel(data: []))
                                            .data ??
                                            [])[i]) ?
                                    Color(0xFF207FA7) :Colors.grey

                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    ((controller.subCategoryModelListing ??
                                        SubCategoryModel(
                                            data: []))
                                        .data ??
                                        [])[i]
                                        .name ??
                                        "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: albertSansRegular.copyWith(
                                        fontSize: Dimensions.fontSize12,
                                        decoration: TextDecoration.none,
                                        color:
                                        controller.selectedSubCategories.contains(
                                            ((controller.subCategoryModelListing ??
                                                SubCategoryModel(data: []))
                                                .data ??
                                                [])[i]) ?
                                        Color(0xFF207FA7) :Colors.grey
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: ((controller.subCategoryModelListing ??
                        SubCategoryModel(data: []))
                        .data ??
                        [])
                        .length),
              ),
              // SelectableButtonList(options: ((controller.subCategoryModelListing ?? SubCategoryModel(data: [])).data ?? []).map((looking) => looking.name).toList(), elementsPerRow: 0, onTap: (String ) {  }, buttonWidth: 87,buttonHeight: 89,),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: Get.size.width,
                height: Get.size.height,
                child: ((controller.categoriesToServiceListing ??
                    Services(data: []))
                    .data ??
                    []).isNotEmpty?ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Container();
                      //   Container(
                      //     child: ServiceContainer(
                      //       isButtonShow: true,
                      //       serviceModel: ((controller.categoriesToServiceListing ??
                      //           Services(data: []))
                      //           .data ??
                      //           [])[i],
                      //
                      //     )
                      // );
                    },
                    separatorBuilder: (context, i) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: ((controller.categoriesToServiceListing ??
                        Services(data: []))
                        .data ??
                        [])
                        .length):Column(children: [
                    SizedBox(height: 150,),
                    Text("No Service Available",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize12,
                          decoration: TextDecoration.none,
                          color: Colors.black
                      ),
          
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );


        CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 135.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault),
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
                        CustomNotificationButton(
                          icon: Icons.shopping_cart,
                          tap: () {},
                          color: Theme.of(context).primaryColor,
                        )
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
                          Icon(Icons.arrow_back,
                              color: Colors.black, size: Dimensions.fontSize18),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Services",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: albertSansRegular.copyWith(
                                fontSize: Dimensions.fontSize14,
                                color: Theme.of(context).hintColor),
                          )),
                        ],
                      ),
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
              child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0,
                      color: Colors.white,
                      // color:Color(0xFF207FA7)
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                width: Get.size.width,
                height: 150,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: (){
                          controller.getCategoriesToServices(id: ((controller.subCategoryModelListing ?? SubCategoryModel(data: [])).data ?? [])[i].id.toString(), limit: '10',offset: "1",isLoading: true);
                          controller.selectedSubCategories.clear();
                          controller.selectedSubCategories.add(((controller.subCategoryModelListing ?? SubCategoryModel(data: [])).data ?? [])[i]);
                        },
                        child: Container(
                            // width: 89,
                            // height: 89,
                            decoration: ShapeDecoration(
                              color: controller.selectedSubCategories.contains(
                                      ((controller.subCategoryModelListing ??
                                                  SubCategoryModel(data: []))
                                              .data ??
                                          [])[i])
                                  ? Color(0x26207FA7)
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF207FA7)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  ((controller.subCategoryModelListing ??
                                                      SubCategoryModel(data: []))
                                                  .data ??
                                              [])[i]
                                          .thumbnailFullPath ??
                                      "",
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    ((controller.subCategoryModelListing ??
                                                        SubCategoryModel(
                                                            data: []))
                                                    .data ??
                                                [])[i]
                                            .name ??
                                        "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: albertSansRegular.copyWith(
                                        fontSize: Dimensions.fontSize12,
                                        decoration: TextDecoration.none,
                                        color: Colors.black
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return SizedBox(
                        width: 5,
                      );
                    },
                    itemCount: ((controller.subCategoryModelListing ??
                                    SubCategoryModel(data: []))
                                .data ??
                            [])
                        .length),
              ),
              // SelectableButtonList(options: ((controller.subCategoryModelListing ?? SubCategoryModel(data: [])).data ?? []).map((looking) => looking.name).toList(), elementsPerRow: 0, onTap: (String ) {  }, buttonWidth: 87,buttonHeight: 89,),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: Get.size.width,
                height: Get.size.height,
                child: ((controller.categoriesToServiceListing ??
      Services(data: []))
          .data ??
      []).isNotEmpty?ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Container(
                       );
                    },
                    separatorBuilder: (context, i) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: ((controller.categoriesToServiceListing ??
                                    Services(data: []))
                                .data ??
                            [])
                        .length):Column(

                          children: [
                            SizedBox(height: 150,),
                            Text("No Service Available",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: albertSansRegular.copyWith(
                                                  fontSize: Dimensions.fontSize12,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.black
                                              ),

                                            ),
                          ],
                        ),
              ),
            ],
          ))
        ],
      );
    });
  }
}
