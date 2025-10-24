import 'package:flutter/material.dart';
import 'package:flutter_course/week09/drawer_demo.dart';
import 'package:flutter_course/week09/drawer_demo2.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              children: [
                Image.asset('assets1/images/MD09-images/batman.png', width: 100),
                Text('Header'),
              ],
            ),
          ),
          TextButton.icon(
            //onPressed:,
            label: Text("page 1"),
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              // got to page 2 without history
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DrawerDemo()));
            },
          ),
          TextButton.icon(
            //onPressed:,
            label: Text("page 2"),
            icon: Icon(Icons.access_alarm),
            onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DrawerDemo2()));
            },
          ),
        ],
      ),
    );
  }
}