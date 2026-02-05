import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_widget.dart';

Future<Map<String, dynamic>?> pickFileOnlyCamera(
    BuildContext context, {
      bool multiCapture = false,
      bool onlyCameraOption = false,
      required bool frontCameraOnly,
      bool showImage = false,
      String showImageUrl = '',
      File? showImageFile,
    }) async {
  List<File>? selectedFiles;
  File? selectedFile;
  String? fileName;

  Completer<Map<String, dynamic>?> completer = Completer();

  await showModalBottomSheet(
    context: context,
    builder: (context) {
      log("Show image url: $showImageUrl");
      return SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Camera"),
              onTap: () async {
                Navigator.pop(context);

                if (multiCapture) {
                  final List<String>? imagePaths = await Get.to(
                        () => CameraScreen(
                      multiCapture: true,
                      frontCameraOnly: frontCameraOnly,
                    ),
                  );
                  if (imagePaths != null && imagePaths.isNotEmpty) {
                    selectedFiles = imagePaths.map((e) => File(e)).toList();
                    debugPrint("Multi-Capture Selected Files: $selectedFiles");
                    completer.complete({
                      "files": selectedFiles,
                      "filenames": selectedFiles
                          ?.map((e) => e.path.split('/').last)
                          .toList(),
                    });
                  } else {
                    completer.complete(null);
                  }
                } else {
                  final String? imagePath = await Get.to(() => CameraScreen(
                    frontCameraOnly: frontCameraOnly,
                  ));
                  if (imagePath != null) {
                    selectedFile = File(imagePath);
                    fileName = imagePath.split('/').last;
                    debugPrint("Camera Selected File: $selectedFile");
                    completer.complete({
                      "file": selectedFile,
                      "filename": fileName,
                    });
                  } else {
                    completer.complete(null);
                  }
                }
              },
            ),
            Visibility(
              visible: showImage,
              child: ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Show Image"),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.7),
                    builder: (context) => Center(
                      child: Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: showImageFile != null
                              ? Image.file(
                            showImageFile,
                            fit: BoxFit.contain,
                          )
                              : Image(
                            image: NetworkImage(showImageUrl),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );

  return completer.future;
}
