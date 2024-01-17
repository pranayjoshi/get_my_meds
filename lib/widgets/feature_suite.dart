import 'package:flutter/material.dart';

class FeatureSuite extends StatelessWidget {
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
            _createGridItem('Box 1', Colors.lightGreen[400]!, context),
            _createGridItem('Box 2', Colors.lightGreen[400]!, context),
            _createGridItem('Box 3', Colors.lightGreen[400]!, context),
            _createGridItem('Box 4', Colors.lightGreen[400]!, context),
          ],
        ),
      ),
    );
  }

Widget _createGridItem(String title, Color color, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.01,
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