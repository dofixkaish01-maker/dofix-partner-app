import 'dart:io';
import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controllers/account_controller.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../utils/images.dart';
import '../../../utils/sizeboxes.dart';
import '../../widgets/account_setup_custom_textfield.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_document_field.dart';
import '../../widgets/custom_textfield.dart';
import '../MapScreen/map_screen2.dart';

class ApkaProfileScreen extends StatefulWidget {
  const ApkaProfileScreen({super.key});

  @override
  State<ApkaProfileScreen> createState() => _ApkaProfileScreenState();
}

class _ApkaProfileScreenState extends State<ApkaProfileScreen> {
  final AccountController accController = Get.find();
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    accController.clearProfileVariables();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await accController.fetchUserProfile(Get.find<DashBoardController>()
                .providerDashboardModel
                .content
                ?.providerInfo
                ?.id ??
            "");
      },
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
    );
  }

  Widget _buildUploadImageButton(String label) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
      ),
      child: const Center(
        child: Icon(Icons.upload_file, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                accController.updateProfile();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2297CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Apka Profile',
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: GetBuilder<AccountController>(
            builder: (accountController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: accController.profileImage != null
                        ? Image.file(
                            accController.profileImage!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/img_placeholder.png', // Your fallback asset
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.network(
                            '${AppConstants.imgProfileBaseUrl}${accController.profileImageUrl}',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/img_placeholder.png', // Your fallback asset
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  const SizedBox(height: 5),
                  TextButton.icon(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          accController.profileImage = File(pickedFile.path);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: primaryAppColor,
                    ),
                    label: const Text(
                      'Upload Profile Picture',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "PARTNER ID",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        accountController.userProfile?.content?.provider?.dofixPartnerId?.toString()
                            ?? "ID not available",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ],
                  ),
                  sizedBox8(),
                  CustomTextField(
                    showTitle: true,
                    capitalization: TextCapitalization.words,
                    controller: accountController.companyNameController,
                    hintText: "Company Name",
                    onChanged: (value) {
                      // Get.find<AuthController>().accountHolderName =
                      //     value;
                    },
                    validation: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your company name';
                      } else if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
                        return 'Name can only contain letters and spaces';
                      } else if (value.trim().length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  sizedBox20(),
                  CustomTextField(
                    showTitle: true,
                    capitalization: TextCapitalization.words,
                    controller: accountController.fullNameController,
                    hintText: "Full Name",
                    onChanged: (value) {
                      // Get.find<AuthController>().accountHolderName =
                      //     value;
                    },
                    validation: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your full name';
                      } else if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
                        return 'Name can only contain letters and spaces';
                      } else if (value.trim().length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  sizedBox20(),
                  Row(
                    children: [
                      Expanded(
                        child: AccountCustomTextField(
                          showTitle: true,
                          isNumber: true,
                          isPhone: true,
                          controller: accountController.contactNumberController,
                          hintText: "Contact Number",
                          inputType: TextInputType.phone,
                          maxLines: 1,
                          maxLength: 10,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your contact number';
                            } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AccountCustomTextField(
                          showTitle: true,
                          isNumber: true,
                          isPhone: true,
                          maxLines: 1,
                          maxLength: 10,
                          inputType: TextInputType.phone,
                          controller:
                              accountController.alternateNumberController,
                          hintText: "Alternate Number",
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your alternate number';
                            } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    showTitle: true,
                    hintText: 'Email Address',
                    inputType: TextInputType.emailAddress,
                    controller: accountController.emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  sizedBox20(),
                  CustomTextField(
                    showTitle: true,
                    hintText: 'Location',
                    readOnly: true,
                    isLocation: true,
                    controller: accountController.addressController,
                    onTap: () {
                      Get.to(() => MapScreenSecond());
                    },
                  ),
                  sizedBox20(),
                  buildDocumentField(
                    "Aadhar Card Number",
                    accountController.aadharCardNumberController,
                    "Aadhar Card Image",
                    context,
                    true,
                    accountController.aadharCardImageController,
                    TextInputType.number,
                    (String value) {
                      Get.find<AccountController>().adharNumber = value;
                    },
                    (File value) {
                      Get.find<AccountController>().adharImage = value;
                    },
                    1,
                  ),
                  sizedBox20(),

                  /// Pan Card & Image Upload
                  buildDocumentField(
                    "Pan Card Number",
                    accountController.panCardNumberController,
                    "Pan Card Image",
                    context,
                    false,
                    accountController.panCardImageController,
                    TextInputType.text,
                    (v) => authController.panNumber = v,
                    (f) => authController.panImage = f,
                    2,
                  ),
                  sizedBox20(),

                  /// Driving License & Image Upload
                  buildDocumentField(
                    "Driving License Number",
                    accountController.dlCardNumberController,
                    "Driving License Image",
                    context,
                    false,
                    accountController.dlCardImageController,
                    TextInputType.text,
                    (v) => authController.drivingLicencesNumber = v,
                    (f) => authController.drivingLicencesImage = f,
                    3,
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
