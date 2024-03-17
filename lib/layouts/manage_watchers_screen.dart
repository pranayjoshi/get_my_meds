import 'package:flutter/material.dart';

class ManageWatchersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Watchers'),
      ),
      body: ListView(
        children: <Widget>[
          for (int i = 0; i < 3; i++)
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('A$i'),
                ),
                title: Text('Name $i'),
                subtitle: Text('Title $i'),
                trailing: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Option 1"),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text("Option 2"),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text("Option 3"),
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