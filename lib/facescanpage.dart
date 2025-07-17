import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FaceScanPage extends StatefulWidget {
  final List<CameraDescription> cameras; // ✅ Add this!

  const FaceScanPage({Key? key, required this.cameras}) : super(key: key);

  @override
  _FaceScanPageState createState() => _FaceScanPageState();
}

class _FaceScanPageState extends State<FaceScanPage> {
  CameraController? _controller;
  bool _isScanning = true;

  @override
  void initState() {
    super.initState();
    _initCamera();
    _startFakeScan(); // simulate face detection
  }

  Future<void> _initCamera() async {
    _controller = CameraController(widget.cameras.first, ResolutionPreset.medium); // ✅ Use widget.cameras
    await _controller?.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  void _startFakeScan() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _isScanning = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SuccessPage()),
      );
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
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Face Scanning")),
      body: Stack(
        children: [
          CameraPreview(_controller!),
          if (_isScanning)
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Scanning Face...',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Success")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified_user, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text("Welcome!", style: TextStyle(fontSize: 24)),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        ),
      ),
    );
  }
}
