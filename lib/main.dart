import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get_my_meds/layouts/home_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var status = await Permission.camera.status;
  if (!status.isGranted) {
    status = await Permission.camera.request();
    if (!status.isGranted) {
      // Handle the case where the user did not grant the permission
      return;
    }
  }
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  MyApp({required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get My Meds',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.light(
          primary: Colors.green,
          secondary: Colors.green,
        ),
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.green,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(cameras: cameras),
    );
  }
}