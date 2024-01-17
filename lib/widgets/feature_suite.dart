import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: <Widget>[
          _createGridItem('Box 1', Colors.lightBlue[100]!),
          _createGridItem('Box 2', Colors.lightGreen[100]!),
          _createGridItem('Box 3', Colors.pink[100]!),
          _createGridItem('Box 4', Colors.yellow[100]!),
        ],
      ),
    );
  }

  Widget _createGridItem(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}