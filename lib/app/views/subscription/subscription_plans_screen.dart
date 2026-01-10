import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';
import '../../../model/account/subscription_list_model.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_appbar.dart';
import 'widgets/plans_card.dart';

class SubscriptionPlansScreen extends StatefulWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  State<SubscriptionPlansScreen> createState() =>
      _SubscriptionPlansScreenState();
}

class _SubscriptionPlansScreenState extends State<SubscriptionPlansScreen> {
  final accountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Subscription Plans',
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
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: accountController.packages?.length,
              itemBuilder: (context, index) {
                PackageModel plan = accountController.packages![index];
                return Column(
                  children: [
                    PlansCard(
                      plan: plan,
                    ),
                    if (index != accountController.packages!.length - 1)
                      const SizedBox(
                        height: 16,
                      ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
