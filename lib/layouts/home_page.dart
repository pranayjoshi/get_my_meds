import 'package:flutter/material.dart';
import 'package:get_my_meds/widgets/chart.dart';

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
          child: WeeklyProgressChart(),
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
          onPressed: () {},
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