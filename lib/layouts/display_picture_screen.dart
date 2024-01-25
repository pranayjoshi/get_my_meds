import 'dart:io';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: Image.file(File(imagePath)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.scanner), // Replace with your scan logo
        onPressed: () async {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new CircularProgressIndicator(),
                    new Text("Loading"),
                  ],
                ),
              );
            },
          );
          await Future.delayed(Duration(seconds: 2));
          Navigator.pop(context); // pop the dialog
          Navigator.pop(context); // pop the screen
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}