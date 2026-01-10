
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../helper/route_helper.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../model/category_model.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/sizeboxes.dart';
import '../../../utils/styles.dart';
import '../../../widgets/custom_image_viewer.dart';
import '../../widgets/custom_containers.dart';

class CategoryComponents extends StatelessWidget {
  CategoryModel? categoryList = CategoryModel(data: []);
  CategoryComponents({super.key, this.categoryList});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service Categories",
                style: albertSansRegular.copyWith(),
              ),
              TextButton(
                onPressed: () {
                  // Get.offAll(DashboardScreen(pageIndex: 1));
                },
                child: Text(
                  "See All",
                  style: albertSansRegular.copyWith(
                    fontSize: Dimensions.fontSize13,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
            ],
          ),

          Visibility(
            visible: (categoryList?.data ?? []).isNotEmpty,
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10.0, // Horizontal spacing
                runSpacing: 10.0, // Vertical spacing
                children: List.generate((categoryList?.data ?? []).length, (i) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 3 - 20, // Ensures 3 items per row
                    child: GestureDetector(
                      onTap: (){
                        debugPrint("Category ID: ${(categoryList?.data ?? [])[i].id}");
                        Get.find<DashBoardController>().getCategoriesToServices(id: (categoryList?.data ?? [])[i].id.toString(), limit: '10',offset: "1");
                      },
                      child: CustomDecoratedContainer(
                        borderColor: Theme.of(context).hintColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomNetworkImageWidget(
                              height: 100, image: categoryList?.data?[i].imageFullPath ?? "",
                            ),
                            sizedBox4(),
                            Text(
                              textAlign: TextAlign.center,
                              categoryList?.data?[i].name ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: albertSansRegular.copyWith(
                                fontSize: Dimensions.fontSize12,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Visibility(
            visible: (categoryList?.data ?? []).isEmpty,
            child: Center(child: CircularProgressIndicator(),)
          ),

        ],
      ),
    );
  }
}
