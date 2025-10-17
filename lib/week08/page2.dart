import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    // get the data from the previous page
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text("Page 2"), centerTitle: false),
      body: Column(
        children: [
          Text("Name: ${data['name']}"),
          Text("Name: ${data['price']}"),
          Text("Origin date: ${data['date'][0]}"),
          Text("Expiration date: ${data['date'][1]}"),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
    ;
  }
}
