import 'package:dofix_technichian/app/views/account/apka_profile_screen.dart';
import 'package:dofix_technichian/app/views/account/banking_details.dart';
import 'package:dofix_technichian/app/views/account/help_and_support/faq_screen.dart';
import 'package:dofix_technichian/app/views/account/help_and_support/help_and_support_screen.dart';
import 'package:dofix_technichian/app/views/account/review_ratings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

      final controller = Get.find<DashBoardController>();
      await controller.getAccountOverview();
    });
  }

  static const Color primaryColor = Color(0xff227fa8);

  @override
// 🔥 Only UI improved, logic untouched

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffF6F8FB),
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
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 65),
            child: FloatingActionButton.extended(
              backgroundColor: primaryColor,
              onPressed: () {
                Get.to(() => const HelpSupportScreen());
              },
              label: Row(
                children: [
                  const Icon(Icons.support_agent_rounded, color: Colors.white),
                  const SizedBox(width: 7),
                  Text(
                    'Help & Support',
                    style: GoogleFonts.roboto(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              /// SCROLLABLE CONTENT
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.getAccountInfo(true);
                    await controller.getPagesData();
                    await controller.getAccountOverview();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),

                        /// STATUS CARD (unchanged logic)
                        Obx(() {
                          if (controller.accountIsActive.value == -1) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final bool isActive =
                              controller.accountIsActive.value == 1;

                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: isActive
                                      ? Colors.green.withOpacity(0.15)
                                      : Colors.red.withOpacity(0.15),
                                  child: Icon(
                                    isActive
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    color: isActive ? Colors.green : Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  isActive
                                      ? "Account Active"
                                      : "Account Inactive",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isActive ? Colors.green : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),

                        const SizedBox(height: 24),

                        /// 🔥 MAIN ACCOUNT SECTION
                        _buildSectionCard([
                          _buildMenuItem(
                            title: "Apka Profile",
                            onTap: () {
                              Get.to(() => ApkaProfileScreen());
                            },
                          ),
                          _buildMenuItem(
                            title: "Banking Details",
                            onTap: () {
                              Get.to(() => BankingDetails());
                            },
                          ),
                          _buildMenuItem(
                            title: "Ratings aur reviews",
                            onTap: () async {
                              await Get.find<AccountController>()
                                  .fetchProviderReviews();
                              Get.to(() => ReviewRatingsScreen());
                            },
                          ),
                          _buildMenuItem(
                            title: "Subscription ka plan",
                            onTap: () async {
                              await Get.find<AccountController>()
                                  .fetchSubscriptionPackages();
                              await Get.find<AccountController>()
                                  .fetchMySubscriptionDetails();
                              Get.to(() => SubscriptionScreen());
                            },
                          ),
                          _buildMenuItem(
                            title: "About DoFix Partner",
                            onTap: () {
                              Get.to(() => HtmlContentScreen(
                                    title: "About DoFix Partner",
                                    htmlContent: controller.apiResponse.content
                                            .aboutUs?.value ??
                                        "",
                                  ));
                            },
                          ),
                        ]),

                        const SizedBox(height: 24),

                        /// 🔥 LEGAL SECTION (Separate)
                        Text(
                          "Legal",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 12),

                        _buildSectionCard([
                          _buildMenuItem(
                            title: "Privacy Policy",
                            onTap: () {
                              Get.to(() => HtmlContentScreen(
                                    title: "Privacy Policy",
                                    htmlContent: controller.apiResponse.content
                                            .privacyPolicy?.value ??
                                        "",
                                  ));
                            },
                          ),
                          _buildMenuItem(
                            title: "Terms & Conditions",
                            onTap: () {
                              Get.to(() => HtmlContentScreen(
                                    title: "Terms & Conditions",
                                    htmlContent: controller.apiResponse.content
                                            .termsAndConditions?.value ??
                                        "",
                                  ));
                            },
                          ),
                        ]),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🔥 FIXED LOGOUT BUTTON
              Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.logout, color: Colors.red),
                    label: const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      _showLogoutDialog();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSectionCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: List.generate(children.length * 2 - 1, (index) {
          if (index.isOdd) {
            return Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            );
          }
          return children[index ~/ 2];
        }),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // Widget _buildMenuCard({
  //   required String title,
  //   required VoidCallback onTap,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 12),
  //     child: Material(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(14),
  //       elevation: 1,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(14),
  //         onTap: onTap,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 title,
  //                 style: GoogleFonts.inter(
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               const Icon(Icons.arrow_forward_ios,
  //                   size: 16, color: Colors.grey),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _showLogoutDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// 🔴 Icon
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                  size: 30,
                ),
              ),

              const SizedBox(height: 18),

              /// Title
              const Text(
                "Confirm Logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              /// Description
              const Text(
                "Kya aap sure hain ki aap apne account se logout karna chahte ho?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 28),

              /// Buttons Row
              Row(
                children: [
                  /// Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Get.back(),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  /// Logout Button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.back(); // dialog close
                        Get.find<AuthController>().logout();
                      },
                      child: const Text(
                        "Log Out",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
