
import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';
import '../../../utils/sizeboxes.dart';
import '../../../utils/styles.dart';
import '../../widgets/custom_containers.dart';

class TopAcServicesComponent extends StatelessWidget {
  const TopAcServicesComponent({super.key});

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
                "Top AC Rated Services",
                style: albertSansRegular.copyWith(),
              ),
              TextButton(
                onPressed: () {},
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

          SizedBox(height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              
              itemBuilder: (_,i) {
              return CustomDecoratedContainer(
                bgColor: Colors.white,
                 child: Column(
                   children: [
                     Image.asset(height: 100,width: 100,
                      "assets/images/img_ac_repiar_demo.png",fit: BoxFit.cover,),
                      sizedBox5(),
                        Text(maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        "Ac Repair",
                        style: albertSansRegular.copyWith(
                          fontSize: Dimensions.fontSize14,
                          color: Colors.black,
                        ),
                      )
                   ],
                 ),

              );
            }, separatorBuilder: (BuildContext context, int index) => sizedBoxW10(), 
            itemCount: 6,),
          )
        
        ],
      ),
    );
  }
}