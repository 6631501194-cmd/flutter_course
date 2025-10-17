import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String name;
  final int price;
  final List date;

  Page2({
    super.key,
    required this.name,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 2"), centerTitle: false),
      body: Column(
        children: [
          Text("Name: $name"),
          Text("Price: $price"),  // Fixed this line
          Text("Origin date: ${date[0]}"),  // Fixed this line
          Text("Expiration date: ${date[1]}"),  // Fixed this line
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}
