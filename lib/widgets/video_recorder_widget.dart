import 'dart:async';
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
  bool _isPaused = false;
  int _seconds = 0;
  Timer? _timer;

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

  Future<void> _pauseRecording() async {
    if (_controller == null || !_isRecording || _isPaused) return;

    await _controller!.pauseVideoRecording();
    setState(() {
      _isPaused = true;
    });
  }

  Future<void> _resumeRecording() async {
    if (_controller == null || !_isRecording || !_isPaused) return;

    await _controller!.resumeVideoRecording();


    setState(() {
      _isPaused = false;
    });
  }

  Future<void> _startRecording() async {
    if (_controller == null || _isRecording) return;

    await _controller!.prepareForVideoRecording();
    await _controller!.startVideoRecording();

    setState(() {
      _isRecording = true;
      _isPaused = false;
      _seconds = widget.maxSeconds;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_isPaused && _seconds > 0) {
        setState(() {
          _seconds--;
        });
      }

      if (_seconds == 0) {
        _stopRecording();
      }
    });
  }

  Future<void> _stopRecording() async {
    if (_controller == null || !_isRecording) return;
    final file = await _controller!.stopVideoRecording();
    setState(() {
      _isRecording = false;
    });
    _timer?.cancel();
    _timer = null;
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
    _timer?.cancel();
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
        appBar: AppBar(title: Text('Record Video'),backgroundColor: Color(0xff3683ab),),
        body: Stack(
          children: [
            CameraPreview(_controller!),
            if (!_isRecording)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: GestureDetector(
                    onTap: _startRecording,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff3683ab),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.videocam, color: Colors.white),
                    ),
                  )
                ),
              ),
            if (_isRecording)
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _isPaused ? 'Paused ($_seconds s)' : '$_seconds s',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Pause / Resume Button
                        GestureDetector(
                          onTap: _isPaused ? _resumeRecording : _pauseRecording,
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Color(0xe293c8e6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isPaused ? Icons.play_arrow_rounded : Icons.pause,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),

                        /// Stop Button
                        GestureDetector(
                          onTap: _stopRecording,
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Color(0xff3683ab),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.stop, color: Colors.white),
                          ),
                        )                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
