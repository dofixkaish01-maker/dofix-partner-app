import 'dart:io';
import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_camera_picker.dart';
import '../../widgets/custom_text_field.dart';

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
  int imageType, {bool isRequired=true} // 1 for adhar, 2 for pan, 3 for driving license
) {
  String hintText = "Upload image";
  File? selectedImageFile;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: CustomTextField(
          showTitle: true,
          isAmount: isAmount,
          hintText: title,
          validation: isRequired ? _validateRequired : null,
          controller: controller,
          inputType: inputType,
          isRequired: isRequired ? true : false,
          onChanged: (value) {
            number(value);
          },
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// IMAGE LABEL
            Text(
              imageLabel,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            /// MAX SIZE TEXT
            Text(
              "Max size: 2 MB",
              style: TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 6),

            /// IMAGE PICKER FIELD
            CustomTextField(
              validation: isRequired ? _validateRequired : null,
              readOnly: true,
              controller: imageController,
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
              hintText: "Upload image",
              showBorder: false,
              prefixIcon: Icons.camera_alt,
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
