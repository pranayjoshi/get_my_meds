import 'package:flutter/material.dart';

class ManageWatchersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cards = [
    {'avatar': 'SO', 'name': 'Shawn Owens', 'title': 'Your Device', "tags": ["Morning", "Evening"]},
    {'avatar': 'MO', 'name': 'Michael Owens', 'title': 'Your Son', "tags": ["Morning", "Afternoon","Night"]},
    {'avatar': 'RO', 'name': 'Rachael Owens', 'title': 'Your Daughter', "tags": ["Morning", "Afternoon","Evening"]},
    {'avatar': 'JO', 'name': 'Josh Owens', 'title': 'Your Grandson', "tags": ["Afternoon", "Night"]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Watchers'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: cards.map((card) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(card['avatar']!),
                  ),
                  title: Text(card['name']!),
                  subtitle: Text(card['title']!),
                  trailing: PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Make Admin", style: TextStyle(color: Colors.black)),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Remove", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton(onPressed: (){}, child: Text('Edit')),
                    Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 2.0, // gap between lines
                  children: card['tags'].map<Widget>((tag) {
  return Chip(
    label: Text(tag, style: TextStyle(color: Colors.green)),
    shape: StadiumBorder(side: BorderSide(color: Colors.green)),
  );
}).toList(),
                ),
                  ],
                ),
                
              ],
            ),
          );
        }).toList(),
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
          },
          child: Icon(
            Icons.add,
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