import 'dart:async';

import 'package:flutter/material.dart';

class TimerDeomo extends StatefulWidget {
  const TimerDeomo({super.key});

  @override
  State<TimerDeomo> createState() => _TimerDeomoState();
}

class _TimerDeomoState extends State<TimerDeomo> {
  String message = "Start";
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {});
    setState(() {
      message = "Stop";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(message, style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
