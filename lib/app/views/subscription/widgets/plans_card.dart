import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../controllers/account_controller.dart';
import '../../../../model/account/subscription_list_model.dart';
import '../../../../utils/theme.dart';

class PlansCard extends StatelessWidget {
  final PackageModel plan;
  const PlansCard({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return (plan.isActive == 1)
        ? Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryAppColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      height: 28.0,
                      decoration: BoxDecoration(
                        color: brownColor.withOpacity(0.14),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                        ),
                      ),
                      child: Text(
                        '${plan.duration} Days',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: brownColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      plan.name.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        '₹ ${plan.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: greenColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plan Description',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: primaryAppColor,
                      ),
                    ),
                    Html(data: plan.description),
                    Row(
                      children: [
                        Text(
                          'Booking Limit: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${plan.featureLimit?.booking.toString()} Bookings',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: Colors.black.withOpacity(0.2),
                  thickness: 1,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Start Date: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: textGrey,
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(
                            DateTime.now(),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'End Date: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: textGrey,
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(
                            DateTime.now().add(
                              Duration(days: plan.duration),
                            ),
                          ),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: redColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      await Get.find<AccountController>().purchasePlanApi(
                        packageId: plan.id,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryAppColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      'Purchase Plan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
