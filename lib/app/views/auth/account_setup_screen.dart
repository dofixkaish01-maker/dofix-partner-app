import 'dart:developer';
import 'dart:io';
import 'package:dofix_technichian/app/views/MapScreen/map_screen2.dart';
import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/app/widgets/custom_textfield.dart';
import 'package:dofix_technichian/controllers/auth_controller.dart';
import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:dofix_technichian/utils/sizeboxes.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_document_field.dart';
import 'account_setup_second.dart';

class AccountSetupScreen extends StatefulWidget {
  final String phone;

  AccountSetupScreen({super.key, required this.phone});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  final _companyNameController = TextEditingController();

  final _fullNameController = TextEditingController();

  final _contactNumberController = TextEditingController();

  final _alternativeContactNumberController = TextEditingController();

  final _emailController = TextEditingController();

  final _aadharCardNumberController = TextEditingController();

  final _panCardNumberController = TextEditingController();

  final _drivingLicenseController = TextEditingController();

  final _aadharCardImageController = TextEditingController();

  final _panCardImageController = TextEditingController();

  final _drivingLicenseImageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  final dashBoardController = Get.find<DashBoardController>();

  @override
  void initState() {
    super.initState();
    try {
      Get.find<AuthController>().contactNumber = widget.phone;
      _contactNumberController.text = widget.phone;
    } catch (e) {
      debugPrint("Catch error :  $e");
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await authController.getServiceCategoryListing();
    });
  }

  // Validation function for all fields including location and lat/long
  bool validateAccountSetupFields() {
    // Company Name
    if (_companyNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your company name');
      return false;
    }
    if (!RegExp(r'^[A-Za-z ]+').hasMatch(_companyNameController.text.trim())) {
      Get.snackbar('Error', 'Company name can only contain letters and spaces');
      return false;
    }
    if (_companyNameController.text.trim().length < 3) {
      Get.snackbar('Error', 'Company name must be at least 3 characters long');
      return false;
    }

    // Full Name
    if (_fullNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your full name');
      return false;
    }
    if (!RegExp(r'^[A-Za-z ]+').hasMatch(_fullNameController.text.trim())) {
      Get.snackbar('Error', 'Full name can only contain letters and spaces');
      return false;
    }
    if (_fullNameController.text.trim().length < 3) {
      Get.snackbar('Error', 'Full name must be at least 3 characters long');
      return false;
    }

    // Contact Number
    if (_contactNumberController.text.isEmpty ||
        !_contactNumberController.text.contains(RegExp(r'^\d{10}$'))) {
      Get.snackbar('Error', 'Please enter a valid 10-digit contact number');
      return false;
    }

    // Alternate Number
    if (_alternativeContactNumberController.text.isEmpty ||
        !_alternativeContactNumberController.text
            .contains(RegExp(r'^\d{10}$'))) {
      Get.snackbar('Error', 'Please enter a valid 10-digit alternate number');
      return false;
    }

    // Email
    if (_emailController.text.isEmpty ||
        !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
            .hasMatch(_emailController.text)) {
      Get.snackbar('Error', 'Please enter a valid email address');
      return false;
    }

    // Location
    if (dashBoardController.addressController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please select your location');
      return false;
    }

    // Service Category
    if (authController.selectedServiceCategoryId.value == null ||
        authController.selectedServiceCategoryId.value!.isEmpty) {
      Get.snackbar('Error', 'Please select a service category');
      return false;
    }

    // Aadhar Card Number & Image
    if (_aadharCardNumberController.text.isEmpty ||
        _aadharCardNumberController.text.length < 12) {
      Get.snackbar('Error', 'Please enter a valid 12-digit Aadhar card number');
      return false;
    }
    if (authController.adharImage == null) {
      Get.snackbar('Error', 'Please upload your Aadhar card image');
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Images.icLoginBg,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 25,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.iclogoWhite,
                      height: 100,
                      width: 160,
                    ),
                  ],
                ),
              ),

              /// Scrollable Content
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 150),

                    /// White Container Overlapping Effect
                    Container(
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius40),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              sizedBox30(),
                              Text(
                                "Account Setup",
                                style: albertSansBold.copyWith(
                                  fontSize: Dimensions.fontSize30,
                                ),
                              ),
                              sizedBox30(),

                              /// Service Category Dropdown
                              Obx(() {
                                final categories = authController
                                        .serviceCategoryModel.value?.content ??
                                    [];
                                return DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'Service Category',
                                    border: OutlineInputBorder(),
                                  ),
                                  value: authController
                                      .selectedServiceCategoryId.value,
                                  items: categories.map((cat) {
                                    return DropdownMenuItem<String>(
                                      value: cat.id,
                                      child: Text(cat.name ?? ''),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    authController
                                        .selectedServiceCategoryId.value = val;
                                    log("Id is ${authController.selectedServiceCategoryId.value}");
                                  },
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Please select a service category';
                                    }
                                    return null;
                                  },
                                );
                              }),
                              sizedBox30(),

                              /// Company Name
                              CustomTextField(
                                showTitle: true,
                                capitalization: TextCapitalization.words,
                                controller: _companyNameController,
                                hintText: "Company Name",
                                onChanged: (value) {
                                  Get.find<AuthController>().companyName =
                                      value;
                                },
                                validation: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your company name';
                                  } else if (!RegExp(r'^[A-Za-z ]+$')
                                      .hasMatch(value)) {
                                    return 'Name can only contain letters and spaces';
                                  } else if (value.trim().length < 3) {
                                    return 'Name must be at least 3 characters long';
                                  }
                                  return null;
                                },
                              ),
                              sizedBox30(),

                              /// Full Name
                              CustomTextField(
                                showTitle: true,
                                capitalization: TextCapitalization.words,
                                controller: _fullNameController,
                                hintText: "Full Name",
                                onChanged: (value) {
                                  Get.find<AuthController>().fullName = value;
                                },
                                validation: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your full name';
                                  } else if (!RegExp(r'^[A-Za-z ]+$')
                                      .hasMatch(value)) {
                                    return 'Name can only contain letters and spaces';
                                  } else if (value.trim().length < 3) {
                                    return 'Name must be at least 3 characters long';
                                  }
                                  return null;
                                },
                              ),
                              sizedBox20(),

                              /// Contact Number & Alternate Number
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      showTitle: true,
                                      isNumber: true,
                                      isPhone: true,
                                      readOnly: true,
                                      inputType: TextInputType.number,
                                      onChanged: (value) {
                                        Get.find<AuthController>()
                                            .contactNumber = value;
                                      },
                                      hintText: 'Contact Number',
                                      controller: _contactNumberController,
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your contact number';
                                        } else if (!RegExp(r'^\d{10}$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid 10-digit phone number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: CustomTextField(
                                      onChanged: (value) {
                                        Get.find<AuthController>()
                                            .alternativeNumber = value;
                                      },
                                      showTitle: true,
                                      isNumber: true,
                                      isPhone: true,
                                      inputType: TextInputType.number,
                                      hintText: 'Alternate Number',
                                      controller:
                                          _alternativeContactNumberController,
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter an alternate contact number';
                                        } else if (!RegExp(r'^\d{10}$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid 10-digit phone number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              sizedBox20(),

                              /// Email Address
                              CustomTextField(
                                showTitle: true,
                                hintText: 'Email Address',
                                inputType: TextInputType.emailAddress,
                                controller: _emailController,
                                onChanged: (value) {
                                  Get.find<AuthController>().email = value;
                                },
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!RegExp(
                                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
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
                                controller: Get.find<DashBoardController>()
                                    .addressController,
                                onTap: () {
                                  Get.to(() => MapScreenSecond());
                                },
                                validation: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please select your location';
                                  }
                                  return null;
                                },
                              ),
                              sizedBox30(),

                              /// Aadhar Card & Image Upload
                              buildDocumentField(
                                "Aadhar Card Number",
                                _aadharCardNumberController,
                                "Aadhar Card Image",
                                context,
                                true,
                                _aadharCardImageController,
                                TextInputType.number,
                                (v) => authController.adharNumber = v,
                                (f) => authController.adharImage = f,
                                1,
                                isRequired: true, //
                              ),

                              sizedBox20(),

                              /// Pan Card & Image Upload
                              buildDocumentField(
                                "Pan Card Number (Optional)",
                                _panCardNumberController,
                                "Pan Card Image (Optional)",
                                context,
                                false,
                                _panCardImageController,
                                TextInputType.text,
                                (v) => authController.panNumber = v,
                                (f) => authController.panImage = f,
                                2,
                                isRequired: false, // OPTIONAL
                              ),

                              sizedBox20(),

                              /// Driving License & Image Upload
                              buildDocumentField(
                                "Driving License Number (Optional)",
                                _drivingLicenseController,
                                "Driving License Image (Optional)",
                                context,
                                false,
                                _drivingLicenseImageController,
                                TextInputType.text,
                                (v) => authController.drivingLicencesNumber = v,
                                (f) => authController.drivingLicencesImage = f,
                                3,
                                isRequired: false, // OPTIONAL
                              ),
                              sizedBox30(),
                              sizedBox30(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButtonWidget(
                buttonText: "Create",
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      validateAccountSetupFields()) {
                    Get.to(
                      () => AccountSetupScreenSecond(
                        phone: widget.phone,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
