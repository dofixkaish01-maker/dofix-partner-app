
import 'package:dofix_technichian/views/home/component/top_ac_services_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/dashboard_controller.dart';
import '../../model/category_model.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/sizeboxes.dart';
import '../../utils/styles.dart';
import '../../utils/theme.dart';
import '../widgets/custom_buttons.dart';
import 'component/banner_widget.dart';
import 'component/category_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Call visitChildElements() here
      // Get.find<DashBoardController>().handleLocationPermission(context);

      // getData("6","1");
    });

  }

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
                  expandedHeight: 190.0,
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

                          InkWell(onTap: () {

                          },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                               Icon(Icons.location_on_sharp,color : Colors.black,size:Dimensions.fontSize18),
                               Expanded(
                                     child: Text(controller.address ?? "",
                                       maxLines: 1, overflow: TextOverflow.ellipsis,
                                       style: albertSansRegular.copyWith(fontSize: Dimensions.fontSize14,
                                           color: Theme.of(context).hintColor),)),


                            ],),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(40.0),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Column(children: [
                        InkWell(onTap: () {

                        },
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSize10),
                            decoration: BoxDecoration(
                              color: primaryColorDuskyWhite,
                              borderRadius:
                              BorderRadius.circular(Dimensions.radius15),

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
                                            color: Theme.of(context)
                                                .hintColor), // Different color for "resend"
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
                SliverToBoxAdapter(
                  child:
                  Column(
                    children: [
                      // BannerComponent(),
                      CategoryComponents(categoryList: controller.categoryList ?? CategoryModel(data: [])),
                      TopAcServicesComponent()


                    ],
                  ),
                )
              ],
            );
      }
    );
  }
}