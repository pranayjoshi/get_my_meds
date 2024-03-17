import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get_my_meds/layouts/drug_interactions_screen.dart';
import 'package:get_my_meds/layouts/drug_scanner_screen.dart';
import 'package:get_my_meds/layouts/manage_watchers_screen.dart';
import 'package:get_my_meds/layouts/reminder_screen.dart';

class FeatureSuite extends StatelessWidget {
  final List<CameraDescription> cameras;

  FeatureSuite({required this.cameras});
  @override
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: <Widget>[
            _createGridItem('Reminders', Colors.lightGreen[400]!, Icons.alarm, context, ),
  _createGridItem('Drug Recognizer', Colors.lightGreen[400]!, Icons.camera_alt, context),
  _createGridItem('Drug Interations', Colors.lightGreen[400]!, Icons.warning, context),
  _createGridItem('Manage Watchers', Colors.lightGreen[400]!, Icons.people, context),
          ],
        ),
      ),
    );
  }

Widget _createGridItem(String title, Color color, IconData iconData, BuildContext context) {
  return GestureDetector(
    onTap: () {
      switch (title) {
        case 'Drug Interations':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrugInteractionsScreen()),
          );
          break;
        case 'Manage Watchers':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ManageWatchersScreen()),
          );
          break;
        case 'Reminders':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReminderScreen()),
          );
          break;
        case 'Drug Recognizer':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrugScannerScreen(cameras: cameras)),
          );
          break;
        // Add more cases for other screens
        default:
          break;
      }
    },
    child: Container(
      height: MediaQuery.of(context).size.height * 0.01,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
            size: 30.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
}