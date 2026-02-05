import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadMediaWidget extends StatelessWidget {
  final File? imageFile;
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Widget? child;
  final bool showChild;
  final String? errorText;

  const UploadMediaWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.imageFile,
    this.width = 100,
    this.height = 100,
    this.child,
    this.showChild = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasError = errorText != null && errorText!.isNotEmpty;
    final borderColor = hasError ? Colors.red : Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showChild
            ? DottedBorder(
          color: borderColor, // error check added here
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [6, 4],
          child: Container(
            padding: const EdgeInsets.all(1),
            width: width,
            height: height,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: child!,
            ),
          ),
        )
            : InkWell(
          onTap: onTap,
          child: DottedBorder(
            color: borderColor, //same error check
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: const [6, 4],
            child: Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: imageFile != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: borderColor),
                  const SizedBox(height: 5),
                  Text(
                    label,
                    style: TextStyle(color: borderColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        // ERROR TEXT (hamesha dikhega agar error hai)
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 4),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
