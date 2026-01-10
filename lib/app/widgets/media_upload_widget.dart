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

  const UploadMediaWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.imageFile,
    this.width = 100,
    this.child,
    this.showChild = false,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return showChild
        ? DottedBorder(
            color: Colors.grey,
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            dashPattern: [6, 4],
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
              color: Colors.grey,
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              dashPattern: [6, 4],
              child: Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: (imageFile != null)
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
                          Icon(icon, color: Colors.grey),
                          SizedBox(height: 5),
                          Text(
                            label,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
  }
}
