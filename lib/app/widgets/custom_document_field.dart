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
            Text(imageLabel),
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
                }
                await pickFile(
                  context,
                  frontCameraOnly: false,
                  showImage: imageController.text.isNotEmpty,
                  showImageUrl: '$imageBaseUrl${imageController.text}',
                  showImageFile: selectedImageFile,
                ).then(
                  (value) {
                    debugPrint(value.toString());
                    if (value != null && value.containsKey("filename")) {
                      imageController.text = value["filename"].toString();
                      hintText = imageController.text;
                      debugPrint("Image Path: ${imageController.text}");
                      selectedImageFile = value["file"] as File;
                      image(selectedImageFile!);
                    }
                  },
                ); // Await the function
              },
              hintText: hintText,
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
