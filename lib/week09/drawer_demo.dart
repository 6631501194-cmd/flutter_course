import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  Widget createDrawer(context) {
    return Drawer(
      child: Column(
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
              Navigator.pop(context);
            },
          ),
          TextButton.icon(
            //onPressed:,
            label: Text("page 2"),
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: createDrawer(context),
      drawerEnableOpenDragGesture: false,
      body: Align(alignment: Alignment.topCenter, child: Text('First page')),
    );
  }
}
