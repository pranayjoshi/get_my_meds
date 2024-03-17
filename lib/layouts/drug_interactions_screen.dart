import 'package:flutter/material.dart';

class DrugInteractionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Drug Interactions'),
      ),
      body: Center(
        child: Text(
          'No Drug Interactions',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}