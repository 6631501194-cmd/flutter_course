import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
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
        title: const Text('ListView Demo'),
      ),
      body: Column(
        children: [
          // Add button on the top-right
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 8),
            child: FilledButton.icon(
              onPressed: _addItem,
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add'),
            ),
          ),
          // Horizontal list
          SizedBox(
            height: 220, // enough height for card + image + text
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fruit.length,
              itemBuilder: (context, index) {
                final item = fruit[index];

                return GestureDetector(
                  onLongPress: () => _confirmDelete(index),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 130, // fixed width for each card
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets1/images/MD09-images/${item['image']}',
                            height: 90,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${item['price']} baht'),
                        ],
                      ),
                    ),
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
