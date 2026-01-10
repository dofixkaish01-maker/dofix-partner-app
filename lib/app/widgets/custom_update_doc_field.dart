import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomUpdateDocField extends StatefulWidget {
  final String initialImageUrl;
  final void Function(File) onImageSelected;

  const CustomUpdateDocField({
    super.key,
    required this.initialImageUrl,
    required this.onImageSelected,
  });

  @override
  State<CustomUpdateDocField> createState() => _CustomUpdateDocFieldState();
}

class _CustomUpdateDocFieldState extends State<CustomUpdateDocField> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      widget.onImageSelected(image);
      setState(() => _selectedImage = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    log("Initial Image URL: ${widget.initialImageUrl}");
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: _selectedImage != null
              ? Image.file(_selectedImage!, fit: BoxFit.cover)
              : Image.network(
                  widget.initialImageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image,
                          size: 50, color: Colors.grey),
                    );
                  },
                ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
            onTap: _pickImage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.camera_alt, color: Colors.white, size: 18),
                  SizedBox(width: 5),
                  Text(
                    "Upload Image",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
