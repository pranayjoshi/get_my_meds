import 'package:flutter/material.dart';
import 'package:get_my_meds/layouts/take_picture_screen.dart';
import 'package:get_my_meds/widgets/chart.dart';
import 'package:get_my_meds/widgets/feature_suite.dart';
import 'package:camera/camera.dart';

import 'package:camera/camera.dart';

List<CameraDescription> cameras  = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            WeeklyProgressChart(),
            FeatureSuite(),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            SizedBox(
              width: 48.0,
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
  width: 80.0,
  height: 80.0,
  margin: EdgeInsets.only(bottom: 10.0),
  child: FloatingActionButton(
    onPressed: () async {
  if (cameras.isNotEmpty) {
    final CameraController controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await controller.initialize();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(
          camera: cameras[0],
        ),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No camera found'),
          content: Text('This device does not have a camera.'),
          actions: <Widget>[

            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
},
    child: Icon(
      Icons.camera_alt,
      size: 40.0,
    ),
    elevation: 1.0,
    shape: CircleBorder(),
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}