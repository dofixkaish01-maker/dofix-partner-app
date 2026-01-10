import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/sizeboxes.dart';
import '../../../utils/styles.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_buttons.dart';

class PaiseScreen extends StatelessWidget {
  const PaiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          backgroundColor: Colors.white,
          expandedHeight: 190.0,
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
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_sharp,
                            color: Colors.black, size: Dimensions.fontSize18),
                        Expanded(
                            child: Text(
                          "address",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: albertSansRegular.copyWith(
                              fontSize: Dimensions.fontSize14,
                              color: Theme.of(context).hintColor),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Account",
                          style: albertSansRegular.copyWith(
                              fontSize: Dimensions.fontSize20)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                sizedBox20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Profile Settings",
                      style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize20),
                    )),
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                sizedBox30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Ratings",
                      style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize20),
                    )),
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                sizedBox30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Manage Addresses",
                      style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize20),
                    )),
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                sizedBox30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "About FixOn",
                      style: albertSansRegular.copyWith(
                        fontSize: Dimensions.fontSize14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 8,
                    ),
                  ],
                ),
                sizedBox30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Privacy Policy",
                      style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize20),
                    )),
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                sizedBox30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Terms & Conditions",
                      style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize20),
                    )),
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                sizedBox30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "Complaint center",
                      style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize20),
                    )),
                    Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                sizedBox50(),
                CustomButtonWidget(
                  buttonText: 'Log Out',
                  onPressed: () {
                    Get.find<AuthController>().logout();
                  },
                  transparent: true,
                  borderSideColor: Colors.red,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
