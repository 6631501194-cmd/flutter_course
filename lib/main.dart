import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First App',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 255, 0, 242),
        ),
        body: Center(
          child: Text(
            'Hello world ',
            style: TextStyle(fontSize: 32, color: const Color.fromARGB(255, 47, 18, 174)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add action here
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    ),
  );
}
