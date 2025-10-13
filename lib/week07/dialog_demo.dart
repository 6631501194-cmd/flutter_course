import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({super.key});

  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  String date = '';
  String time = '';
  String status = '';
  void showDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );
    if (dt != null) {
      setState(() {
        date = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

  void showTime() async {
    TimeOfDay? td = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (td != null) {
      setState(() {
        time = '${td.hour}: ${td.minute}';
      });
    }
  }

  void showAlert() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Column(
            children: [
              Image.network(
                width: 80,
                'https://icons.iconarchive.com/icons/awicons/vista-artistic/256/delete-icon.png',
              ),
              Text('Are you sure?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  status = 'All files deleted';
                });
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FilledButton(onPressed: showDate, child: Text('Select Date')),
            Text(date),

            FilledButton(onPressed: showTime, child: Text('Select Time')),
            Text(time),

            FilledButton(
              onPressed: showAlert,
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Delete'),
            ),

            Text(status, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}