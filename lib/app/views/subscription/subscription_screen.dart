import 'package:dofix_technichian/app/views/subscription/subscription_plans_screen.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/account_controller.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_appbar.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({
    super.key,
  });

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final accountContrller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ((accountContrller.mySubscriptionDetails != null &&
                    accountContrller.mySubscriptionDetails!.packageEndDate !=
                        '' &&
                    DateTime.parse(accountContrller
                                .mySubscriptionDetails!.packageEndDate)
                            .difference(DateTime.now())
                            .inDays <=
                        5 &&
                    DateTime.parse(accountContrller
                                .mySubscriptionDetails!.packageEndDate)
                            .difference(DateTime.now())
                            .inDays >=
                        0) ||
                (accountContrller.mySubscriptionDetails != null &&
                    accountContrller.mySubscriptionDetails!.isCanceled == 1) ||
                accountContrller.mySubscriptionDetails == null)
            ? Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => SubscriptionPlansScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryAppColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: Text(
                      (accountContrller.mySubscriptionDetails != null &&
                              accountContrller
                                      .mySubscriptionDetails!.packageEndDate !=
                                  '' &&
                              DateTime.parse(accountContrller
                                          .mySubscriptionDetails!
                                          .packageEndDate)
                                      .difference(DateTime.now())
                                      .inDays <=
                                  5 &&
                              DateTime.parse(accountContrller
                                          .mySubscriptionDetails!
                                          .packageEndDate)
                                      .difference(DateTime.now())
                                      .inDays >=
                                  0)
                          ? 'Renew Plan'
                          : 'Purchase Plan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Subscribe Kiya Plan',
          isSearchButtonExist: false,
          isBackButtonExist: true,
          isTitleExist: false,
          drawerButton: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              Images.iclogo,
              height: 70,
              width: 70,
            ),
          ),
        ),
        body: accountContrller.mySubscriptionDetails != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Aapka Current\nSubscribed plan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: primaryAppColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
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
                                  '${accountContrller.mySubscriptionDetails?.package?.duration.toString()} Days',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: brownColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '₹ ${accountContrller.mySubscriptionDetails?.package?.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: greenColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            accountContrller.mySubscriptionDetails!.packageName
                                .toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
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
                                      DateTime.parse(
                                        accountContrller.mySubscriptionDetails!
                                            .packageStartDate,
                                      ),
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
                                      DateTime.parse(
                                        accountContrller.mySubscriptionDetails!
                                            .packageEndDate,
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: redColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          if (accountContrller
                                  .mySubscriptionDetails!.isCanceled ==
                              1)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'Your subscription has been cancelled.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: redColor,
                                  ),
                                ),
                              ],
                            ),
                          if (accountContrller
                                  .mySubscriptionDetails!.isCanceled ==
                              1)
                            const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          Images.plansBackground,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  'No Subscription Details Found',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      ),
    );
  }
}
