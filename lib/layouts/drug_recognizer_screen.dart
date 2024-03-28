import 'package:flutter/material.dart';

class DrugRecognizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drug Recognizer'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'imgs/tylenol.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tylenol is a medication that is used for treating pain and fever.', // Replace with the actual description
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Usage',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tylenol is used to relieve pain from various conditions such as headache, dental pain, menstrual cramps, muscle aches, or arthritis.', // Replace with the actual usage
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}