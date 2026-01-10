import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/app/widgets/custom_textfield.dart';
import 'package:dofix_technichian/helper/route_helper.dart';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:dofix_technichian/utils/sizeboxes.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginLocationPickScreen extends StatelessWidget {
  LoginLocationPickScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.icLoginBg), fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  Images.iclogoWhite,
                  height: 100,
                  width: 160,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: Get.size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius40))),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      children: [
                        sizedBox50(),
                        Text(
                          "Set Your Location",
                          style: albertSansBold.copyWith(
                              fontSize: Dimensions.fontSize30),
                        ),
                        sizedBox8(),
                       Image.asset(
          "assets/images/ic_location_holder.png",
          width: 220,
          height: 220,
                  ),
                 
                        
                        sizedBox30(),
                          CustomButtonWidget(
                            icon: Icons.location_on,
                          
                          buttonText: "Use Current Location",
                          onPressed: () {
                            Get.toNamed(RouteHelper.getDashboardRoute());
                         
                          },
                        ),
                        sizedBox10(),
                            CustomButtonWidget(transparent: true,
                             icon: CupertinoIcons.search,
                          buttonText: "Search Location Manually",
                          onPressed: () {
                            
                          },
                        ),
                      
                        sizedBox4(),
                       
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
