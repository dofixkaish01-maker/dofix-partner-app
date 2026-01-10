import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  final bool multiCapture;
  final bool frontCameraOnly;

  const CameraScreen({
    super.key,
    this.multiCapture = false,
    this.frontCameraOnly = false,
  });

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  final List<String> _capturedImages = [];

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    CameraDescription? selectedCamera;
    if (_cameras != null && _cameras!.isNotEmpty) {
      if (widget.frontCameraOnly) {
        selectedCamera = _cameras!.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => _cameras!.first,
        );
      } else {
        selectedCamera = _cameras!.first;
      }

      _controller = CameraController(selectedCamera, ResolutionPreset.medium);
      await _controller!.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;

    try {
      final XFile file = await _controller!.takePicture();
      if (widget.multiCapture) {
        _capturedImages.add(file.path);

        if (_capturedImages.length == 3) {
          Navigator.pop(context, _capturedImages); // return list of 3
        } else {
          setState(() {}); // Update UI for counter
        }
      } else {
        Navigator.pop(context, file.path); // single image
      }
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CameraPreview(_controller!),
          if (widget.multiCapture)
            Positioned(
              top: 60,
              left: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${_capturedImages.length}/3',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: FloatingActionButton(
            onPressed: _takePicture,
            child: const Icon(Icons.camera),
          ),
        ),
      ),
    );
  }
}
