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
    'Night': {
      "Alarm 4": TimeOfDay(hour: 20, minute: 0)
    },
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
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: alarms[key]!.length,
                    itemBuilder: (context, index) {
                      String alarmKey = alarms[key]!.keys.elementAt(index);
                      
                      return ListTile(
                        title: Text(alarmKey),
                        subtitle: Text(alarms[key]![alarmKey]!.format(context)),
                        trailing: IconButton(
                          icon: Icon(Icons.alarm),
                          onPressed: () async {
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: alarms[key]![alarmKey]!,
                            );
                            if (selectedTime != null) {
                              setState(() {
                                alarms[key]![alarmKey] = selectedTime;
                              });
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}