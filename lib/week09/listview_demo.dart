import 'package:flutter/material.dart';

class ListviewDemo extends StatefulWidget {
  ListviewDemo({super.key});

  @override
  State<ListviewDemo> createState() => _ListviewDemoState();
}

class _ListviewDemoState extends State<ListviewDemo> {
  List data = [
    {
      'image': 'apple.png',
      'fruit': 'Apple',
      'price': 100,
      'icon2': Icons.delete,
    },
    {
      'image': 'banana.png',
      'fruit': 'Banana',
      'price': 6,
      'icon2': Icons.delete,
    },
    {
      'image': 'orange.png',
      'fruit': 'Orange',
      'price': 8,
      'icon2': Icons.delete,
    },
    {'image': 'kiwi.png', 'fruit': 'kiwi', 'price': 8, 'icon2': Icons.delete},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                'assets1/images/MD09-images/${data[index]['image']}',
                width: 80,
              ),
              title: Text(data[index]['fruit']),
              subtitle: Text('Price: ${data[index]['price']}'),
              trailing: IconButton(
                onPressed: () {setState(() {
                  data.removeAt(index);
                });
                  
                },
                icon: Icon(Icons.delete),
              ),
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(data[index]['fruit'])));
              },
            ),
          );
        },
      ),
      // body: SafeArea(
      //   child: ListView(
      //     children: [
      // Card(
      // child: ListTile(
      //   leading: Icon(Icons.ac_unit),
      //   title: Text('First'),
      //   subtitle: Text('Subtitle'),
      //   trailing: Icon(Icons.delete),
      // ),
      // ),

      //     ],
      //   ),
      // ),
    );
  }
}
