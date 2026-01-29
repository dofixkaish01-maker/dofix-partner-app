import 'dart:io';
import 'package:dofix_technichian/app/widgets/custom_button_widget.dart';
import 'package:dofix_technichian/app/widgets/custom_textfield.dart';
import 'package:dofix_technichian/controllers/auth_controller.dart';
import 'package:dofix_technichian/utils/dimensions.dart';
import 'package:dofix_technichian/utils/images.dart';
import 'package:dofix_technichian/utils/sizeboxes.dart';
import 'package:dofix_technichian/utils/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_camera_picker.dart';

class AccountSetupScreenSecond extends StatefulWidget {
  final String phone;

  AccountSetupScreenSecond({super.key, required this.phone});

  @override
  State<AccountSetupScreenSecond> createState() =>
      _AccountSetupScreenSecondState();
}

class _AccountSetupScreenSecondState extends State<AccountSetupScreenSecond> {
  final _accountHolderName = TextEditingController();

  final _accountName = TextEditingController();

  final _branchName = TextEditingController();

  final _ifscController = TextEditingController();

  final _cancelChequeImageController = TextEditingController();
  final _profileImage = TextEditingController();

  final _passbookImageController = TextEditingController();

  final _cancelChequeImage = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            /// Background Image
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
                              "Bank Details",
                              style: albertSansBold.copyWith(
                                fontSize: Dimensions.fontSize30,
                              ),
                            ),
                            sizedBox30(),

                            /// PROFILE SHIFTED TO TOP (NO DELETE)
                            buildInteractiveProfile(context),
                            sizedBox10(),
                            Text("Upload Profile Photo",
                                style: TextStyle(
                                    color: Colors.grey)),
                            sizedBox30(),

                            /// Company Name
                            CustomTextField(
                              showTitle: true,
                              capitalization: TextCapitalization.words,
                              controller: _accountHolderName,
                              hintText: "Account Holder Name",
                              onChanged: (value) {
                                Get.find<AuthController>().accountHolderName =
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
                            sizedBox20(),

                            /// Full Nam
                            CustomTextField(
                              showTitle: true,
                              capitalization: TextCapitalization.words,
                              controller: _branchName,
                              hintText: "Bank Branch Name",
                              onChanged: (value) {
                                Get.find<AuthController>().branchName = value;
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
                            CustomTextField(
                              showTitle: true,
                              capitalization: TextCapitalization.words,
                              controller: _accountName,
                              inputType: TextInputType.number,
                              hintText: "Account Number",
                              onChanged: (value) {
                                Get.find<AuthController>().accountName = value;
                              },
                              validation: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your account number';
                                }
                                return null;
                              },
                            ),
                            sizedBox20(),

                            /// Contact Number & Alternate Number
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    maxLines: 1,
                                    showTitle: true,
                                    isPhone: false,
                                    hintText: 'IFSC Code',
                                    onChanged: (value) {
                                      Get.find<AuthController>().ifscCode =
                                          value;
                                    },
                                    controller: _ifscController,
                                    validation: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter IFSC code';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            sizedBox20(),

                            /// Email Address

                            /// Driving License & Image Upload
                            buildDocumentField(
                                "Check Image",
                                _cancelChequeImageController,
                                "Check Image",
                                context,
                                _cancelChequeImageController, (value) {
                              Get.find<AuthController>().cancelchequeNumber =
                                  value;
                            }, (file) {
                              Get.find<AuthController>().cancelchequeImage =
                                  file;
                              Get.find<AuthController>().update();
                              debugPrint("Image Path: ${file.path}");
                            }, false),
                            sizedBox20(),
                            buildDocumentField(
                              "Passbook Photo",
                              _passbookImageController,
                              "Passbook Photo",
                              context,
                              _passbookImageController,
                              (value) {
                                Get.find<AuthController>().profileNumber =
                                    value;
                              },
                              (file) {
                                Get.find<AuthController>().passbookImage = file;
                                Get.find<AuthController>().update();
                                debugPrint("Image Path: ${file.path}");
                              },
                              true,
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
                if (_formKey.currentState!.validate()) {
                  //  Get.find<DashBoardController>().getzoneIdForRegisteration();
                  Get.find<AuthController>().register();                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDocumentField(
    String title,
    TextEditingController controller,
    String imageLabel,
    BuildContext context,
    TextEditingController imageController,
    Function(String value) number,
    Function(File) image,
    bool? useFrontCameraOnly,
  ) {
    String hintText = "Upload image";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(imageLabel),
              SizedBox(
                height: 10,
              ),
              DottedBorder(
                strokeCap: StrokeCap.round,
                radius: Radius.circular(5),
                color: Colors.grey,
                borderType: BorderType.RRect,
                child: CustomTextField(
                  validation: _validateRequired,
                  readOnly: true,
                  controller: imageController,
                  onTap: () async {
                    var data = await pickFile(
                      context,
                      frontCameraOnly: useFrontCameraOnly ?? false,
                    ).then((value) {
                      debugPrint(value.toString());
                      if (value != null && value.containsKey("filename")) {
                        imageController.text = value["filename"].toString();
                        hintText = imageController.text;
                        debugPrint("Image Path: ${imageController.text}");
                        image(value["file"] as File);
                      }
                    }); // Await the function
                  },
                  hintText: hintText,
                  showBorder: false,
                  prefixIcon: Icons.camera_alt,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String? _validateRequired(String? value) {
    return (value == null || value.trim().isEmpty)
        ? 'This field is required'
        : null;
  }

  //========= profile ===========
Widget buildInteractiveProfile(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          var value = await pickFile(
            context,
            frontCameraOnly: false,
          );

          if (value != null && value.containsKey("filename")) {
            _profileImage.text = value["filename"];
            Get.find<AuthController>().profileImage =
                value["file"] as File;
            Get.find<AuthController>().update();
          }
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            GetBuilder<AuthController>(
              builder: (controller) {
                return CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: controller.profileImage != null
                      ? FileImage(controller.profileImage!)
                      : null,
                  child: controller.profileImage == null
                      ? Icon(Icons.person,
                          size: 60, color: Colors.white)
                      : null,
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt,
                  size: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
