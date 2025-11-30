import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  final List<Map<String, dynamic>> fruit = [
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'},
  ];

  void _addItem() {
    setState(() {
      fruit.add(
        {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
      );
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Are you sure to remove this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  fruit.removeAt(index); // delete item
                });
                Navigator.pop(context); // close dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 1'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 8),
            child: FilledButton.icon(
              onPressed: _addItem,
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fruit.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(fruit[index]['name']),
                    subtitle: Text('${fruit[index]['price']} baht'),
                    trailing: Image.asset(
                      'assets1/images/MD09-images/${fruit[index]['image']}',
                      height: 100,
                    ),
                    onLongPress: () => _confirmDelete(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
