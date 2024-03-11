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
            child: Image.network(
              'https://www.kroger.com/product/images/large/front/0001111079990', // Replace with the actual link to the image
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
                    'Ibuprofen is a medication in the nonsteroidal anti-inflammatory drug (NSAID) class that is used for treating pain, fever, and inflammation.', // Replace with the actual description
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Usage',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ibuprofen is used to relieve pain from various conditions such as headache, dental pain, menstrual cramps, muscle aches, or arthritis.', // Replace with the actual usage
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