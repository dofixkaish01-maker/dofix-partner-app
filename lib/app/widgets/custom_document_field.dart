import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_camera_picker.dart';
import '../../widgets/custom_text_field.dart';
import '../../utils/app_constants.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_camera_picker.dart';
import '../../widgets/custom_text_field.dart';
import '../../utils/app_constants.dart';

Widget buildDocumentField(
    String title,
    TextEditingController controller,
    String imageLabel,
    BuildContext context,
    bool isAmount,
    TextEditingController imageController,
    TextInputType inputType,
    Function(String value) number,
    Function(File) image,
    int imageType, {
      bool isRequired = true,
    }) {

  File? selectedImageFile;

  /// ✅ VALIDATOR SELECTOR
  String? Function(String?)? fieldValidator;

  if (!isRequired) {
    fieldValidator = null;
  } else if (imageType == 1) {
    fieldValidator = _validateAadhar; // Aadhar validation
  } else {
    fieldValidator = _validateRequired;
  }

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      /// ================= LEFT SIDE =================
      Expanded(
        child: CustomTextField(
          showTitle: true,
          isAmount: isAmount,
          hintText: title,
          controller: controller,
          inputType: inputType,
          isRequired: isRequired,
          validation: fieldValidator,

          /// 🔥 AADHAR CONTROL
          isNumber: imageType == 1 ? true : false,
          maxLength: imageType == 1 ? 12 : null,

          onChanged: (value) {
            number(value);
          },
        ),
      ),

      const SizedBox(width: 10),

      /// ================= RIGHT SIDE =================
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// LABEL
            Text(
              imageLabel,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),

            /// SIZE TEXT
            const Text(
              "Max size: 2 MB",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),

            const SizedBox(height: 6),

            /// IMAGE FIELD
            CustomTextField(
              validation: isRequired ? _validateRequired : null,
              readOnly: true,
              controller: imageController,
              hintText: "Upload image",
              showBorder: false,
              prefixIcon: Icons.camera_alt,
              onTap: () async {

                String imageBaseUrl = '';

                if (imageType == 1) {
                  imageBaseUrl = AppConstants.aadharImageUrl;
                } else if (imageType == 2) {
                  imageBaseUrl = AppConstants.panImageUrl;
                } else if (imageType == 3) {
                  imageBaseUrl = AppConstants.dlImageUrl;
                } else if (imageType == 4) {
                  imageBaseUrl = AppConstants.cancelChequeImageUrl;
                } else if (imageType == 5) {
                  imageBaseUrl = AppConstants.passbookImageUrl;
                } else if (imageType == 6) {
                  imageBaseUrl = AppConstants.imgProfileBaseUrl;
                }

                await pickFile(
                  context,
                  frontCameraOnly: false,
                  showImage: imageController.text.isNotEmpty,
                  showImageUrl: '$imageBaseUrl${imageController.text}',
                  showImageFile: selectedImageFile,
                ).then((value) {

                  if (value != null && value.containsKey("filename")) {
                    imageController.text = value["filename"].toString();
                    selectedImageFile = value["file"] as File;
                    image(selectedImageFile!);
                  }

                });
              },
            ),
          ],
        ),
      ),
    ],
  );
}







/// =======================================================
/// 🔻🔻🔻 VALIDATORS (YAHI ADD KARNE THE) 🔻🔻🔻
/// =======================================================

/// 🔴 REQUIRED VALIDATION
String? _validateRequired(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field is required';
  }
  return null;
}

/// 🟢 AADHAR VALIDATION
String? _validateAadhar(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Aadhar number is required';
  }

  String clean = value.replaceAll(' ', '');

  if (!RegExp(r'^[0-9]+$').hasMatch(clean)) {
    return 'Only digits allowed';
  }

  if (clean.length != 12) {
    return 'Aadhar must be 12 digits';
  }

  return null;
}
