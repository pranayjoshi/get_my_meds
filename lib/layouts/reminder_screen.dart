import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  Map<String, Map<String, TimeOfDay>> alarms = {
    'Morning': {
      "Alarm 1": TimeOfDay(hour: 7, minute: 0),
      "Alarm 2": TimeOfDay(hour: 9, minute: 0)
    },
    'Afternoon': {
      "Alarm 3": TimeOfDay(hour: 12, minute: 0),
    },
    'Evening': {},
    'Night': {"Alarm 4": TimeOfDay(hour: 20, minute: 0)},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder Screen'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          String key = alarms.keys.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  key,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ...alarms[key]!.entries.map((alarm) {
                return Card(
                  child: ListTile(
                    title: Text(alarm.key),
                    subtitle: Text(alarm.value.format(context), style: TextStyle(fontSize: 20)),
                    trailing: IconButton(
                      icon: Icon(Icons.alarm, color: Colors.green,),
                      onPressed: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          context: context,
                          initialTime: alarm.value,
                        );
                        if (selectedTime != null) {
                          setState(() {
                            alarms[key]![alarm.key] = selectedTime;
                          });
                        }
                      },
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
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
