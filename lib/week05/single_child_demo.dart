import 'package:flutter/material.dart';

class SingleChildDemo extends StatelessWidget {
  const SingleChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Single Child Demo")),
      body: SafeArea(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.yellow,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(30),
          alignment: Alignment(0, 0),
          child: Icon(Icons.star, size: 50, color: Colors.red),
        ),
      ),
    );
  }
}
