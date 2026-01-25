import 'package:dofix_technichian/app/views/account/apka_profile_screen.dart';
import 'package:dofix_technichian/app/views/account/banking_details.dart';
import 'package:dofix_technichian/app/views/account/review_ratings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../model/pages_model.dart';
import '../../../utils/images.dart';
import '../../../utils/sizeboxes.dart';
import '../../../utils/styles.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button_widget.dart';
import '../HtmlPage/html_pages.dart';
import '../subscription/subscription_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<DashBoardController>().getAccountInfo(true);
      await Get.find<DashBoardController>().getPagesData();

      final controller=Get.find<DashBoardController>();
      await controller.getAccountOverview();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              title: 'Account',
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  sizedBox10(),
                  Obx(() {
                    if (controller.accountIsActive.value == -1) {
                      return const CircularProgressIndicator();
                    }

                    final bool isActive = controller.accountIsActive.value == 1;

                    return Container(
                      width: double.infinity,
                      height: 65,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.green.withOpacity(0.15)
                            : Colors.red.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isActive ? Colors.green : Colors.red,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isActive ? Icons.check_circle : Icons.cancel,
                            color: isActive ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isActive ? "Active" : "Inactive",
                            style: TextStyle(
                              color: isActive ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  sizedBox20(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ApkaProfileScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "Apka Profile",
                          style: albertSansRegular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  sizedBox10(),
                  Divider(color: Colors.black.withAlpha(38), thickness: 1),
                  sizedBox10(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => BankingDetails());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "Banking Details",
                          style: albertSansRegular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  sizedBox10(),
                  Divider(color: Colors.black.withAlpha(38), thickness: 1),
                  sizedBox10(),
                  GestureDetector(
                    onTap: () async {
                      await Get.find<AccountController>()
                          .fetchProviderReviews();
                      Get.to(() => ReviewRatingsScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "Ratings aur reviews",
                          style: albertSansRegular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  sizedBox10(),
                  Divider(color: Colors.black.withAlpha(38), thickness: 1),
                  sizedBox10(),
                  GestureDetector(
                    onTap: () async {
                      await Get.find<AccountController>()
                          .fetchSubscriptionPackages();
                      await Get.find<AccountController>()
                          .fetchMySubscriptionDetails();
                      Get.to(() => SubscriptionScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "Subscription ka plan",
                          style: albertSansRegular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  sizedBox10(),
                  Divider(color: Colors.black.withAlpha(38), thickness: 1),
                  sizedBox10(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HtmlContentScreen(
                          title: "Privacy Policy",
                          htmlContent:
                              (controller.apiResponse.content.privacyPolicy ??
                                      PageInfo(
                                          id: '',
                                          key: '',
                                          value: '',
                                          type: '',
                                          isActive: 0,
                                          createdAt: '',
                                          updatedAt: '',
                                          translations: []))
                                  .value));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "Privacy Policy",
                          style: albertSansRegular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  sizedBox10(),
                  Divider(color: Colors.black.withAlpha(38), thickness: 1),
                  sizedBox10(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HtmlContentScreen(
                          title: "Terms & Conditions",
                          htmlContent: (controller
                                      .apiResponse.content.termsAndConditions ??
                                  PageInfo(
                                      id: '',
                                      key: '',
                                      value: '',
                                      type: '',
                                      isActive: 0,
                                      createdAt: '',
                                      updatedAt: '',
                                      translations: []))
                              .value));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "Terms & Conditions",
                          style: albertSansRegular.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  sizedBox10(),
                  Divider(color: Colors.black.withAlpha(38), thickness: 1),
                  sizedBox10(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HtmlContentScreen(
                          title: "About DoFix Partner",
                          htmlContent:
                              (controller.apiResponse.content.aboutUs ??
                                      PageInfo(
                                          id: '',
                                          key: '',
                                          value: '',
                                          type: '',
                                          isActive: 0,
                                          createdAt: '',
                                          updatedAt: '',
                                          translations: []))
                                  .value));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "About DoFix Partner",
                          style: albertSansRegular.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  sizedBox50(),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _showLogoutDialog();
                      },
                    ),
                  ),

                ],
              ),
            )),
      );
    });
  }
  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: const [
            Icon(Icons.logout, color: Colors.red),
            SizedBox(width: 8),
            Text(
              "Confirm Logout",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: const Text(
          "Kya aap sure hain ki aap apne account se logout karna chahte ho?",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              Get.back(); // dialog close
              Get.find<AuthController>().logout();
            },
            child: const Text(
              "Log Out",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

}
