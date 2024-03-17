import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  Map<String, TimeOfDay> alarms = {
    'Morning': TimeOfDay(hour: 7, minute: 0),
    'Afternoon': TimeOfDay(hour: 12, minute: 0),
    'Evening': TimeOfDay(hour: 18, minute: 0),
    'Night': TimeOfDay(hour: 22, minute: 0),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder Screen'),
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          String key = alarms.keys.elementAt(index);
          return ListTile(
            title: Text('$key Alarm'),
            subtitle: Text(alarms[key]!.format(context)),
            trailing: IconButton(
              icon: Icon(Icons.alarm),
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: alarms[key]!,
                );
                if (selectedTime != null) {
                  setState(() {
                    alarms[key] = selectedTime;
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}