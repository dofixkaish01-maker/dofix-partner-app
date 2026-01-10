import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class VideoRecorderWidget extends StatefulWidget {
  final int maxSeconds;
  const VideoRecorderWidget({
    this.maxSeconds = 30,
    super.key,
  });

  @override
  State<VideoRecorderWidget> createState() => _VideoRecorderWidgetState();
}

class _VideoRecorderWidgetState extends State<VideoRecorderWidget> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(_cameras!.first, ResolutionPreset.medium);
      await _controller!.initialize();
      if (mounted) setState(() {});
    }
  }

  Future<void> _startRecording() async {
    if (_controller == null || _isRecording) return;
    await _controller!.prepareForVideoRecording();
    await _controller!.startVideoRecording();
    setState(() => _isRecording = true);

    // Stop after maxSeconds
    Future.delayed(
      Duration(seconds: widget.maxSeconds),
      () async {
        if (_isRecording) await _stopRecording();
      },
    );
  }

  Future<void> _stopRecording() async {
    if (_controller == null || !_isRecording) return;
    final file = await _controller!.stopVideoRecording();
    setState(() {
      _isRecording = false;
    });

    String path = file.path;
    if (path.endsWith('.temp')) {
      final newPath = path.replaceAll('.temp', '.mp4');
      final mp4File = await File(path).copy(newPath);
      Navigator.pop(context, mp4File);
    } else {
      Navigator.pop(context, File(path));
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Record Video')),
        body: Stack(
          children: [
            CameraPreview(_controller!),
            if (!_isRecording)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: FloatingActionButton(
                    onPressed: _startRecording,
                    child: Icon(Icons.videocam),
                  ),
                ),
              ),
            if (_isRecording)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Recording... (max ${widget.maxSeconds}sec)',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
