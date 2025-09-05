import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //state variable
  String message = 'Hello friends';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 255, 0, 242),
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: 32,
            color: const Color.fromARGB(255, 47, 18, 174),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //print('test');
          //debugPrint('test');
          setState(() {
            message = message == 'Hello friends' ? 'Hello me' : 'Hello friends';
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
