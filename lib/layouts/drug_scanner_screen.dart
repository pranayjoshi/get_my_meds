import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get_my_meds/layouts/reminder_screen.dart';

class TakePictureScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  TakePictureScreen({required this.cameras});

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.cameras.first,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(16.0),
        height: 70,
        width: 70,
        child: FloatingActionButton(
        shape: CircleBorder(),
          onPressed: () async {
          try {
            final image = await _controller.takePicture();
        
            WidgetsBinding.instance?.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new CircularProgressIndicator(),
                    SizedBox(width: 10),
                    new Text("Scanning..."),
                  ],
                ),
              ),
            );
          },
        );
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReminderScreen(),
            ),
          );
        });
            });
        
          } catch (e) {
            print(e);
          }
        },
          child: const Icon(Icons.camera_alt, size: 40,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}