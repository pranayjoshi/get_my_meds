import 'package:flutter/material.dart';
import 'package:get_my_meds/layouts/take_picture_screen.dart';
import 'package:get_my_meds/widgets/chart.dart';
import 'package:get_my_meds/widgets/feature_suite.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

// List<CameraDescription> cameras = [];



class HomePage extends StatelessWidget {
  final List<CameraDescription> cameras;

  HomePage({required this.cameras});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle the menu button press
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              WeeklyProgressChart(),
              FeatureSuite(cameras: cameras,),
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TakePictureScreen(cameras: cameras,),
              ),
            );
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
