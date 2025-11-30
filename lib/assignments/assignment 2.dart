import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  // List data
  final List<Map<String, dynamic>> fruit = [
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'},
  ];

  Map<String, dynamic>? _lastRemovedItem;
  int? _lastRemovedIndex;

  void _addItem() {
    // ⚠️ Teacher note: avoid adding many times (key may repeat)
    setState(() {
      fruit.add(
        {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
      );
    });
  }

  void _removeItemWithUndo(int index) {
    _lastRemovedItem = fruit[index];
    _lastRemovedIndex = index;

    setState(() {
      fruit.removeAt(index);
    });

    // show SnackBar with Undo
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${_lastRemovedItem!['name']} deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // put item back
              setState(() {
                if (_lastRemovedIndex != null && _lastRemovedItem != null) {
                  fruit.insert(_lastRemovedIndex!, _lastRemovedItem!);
                }
              });
            },
          ),
        ),
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
          Expanded(
            child: ListView.builder(
              itemCount: fruit.length,
              itemBuilder: (context, index) {
                final item = fruit[index];

                return Dismissible(
                  key: Key(item['name']), // needs to be unique
                  direction: DismissDirection.startToEnd, // swipe right
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    _removeItemWithUndo(index);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Text('${item['price']} baht'),
                      trailing: Image.asset(
                        'assets1/images/MD09-images/${item['image']}',
                        height: 100,
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
