import 'dart:async';

import 'package:flutter/material.dart';

class TimerDeomo1 extends StatefulWidget {
  const TimerDeomo1({super.key});

  @override
  State<TimerDeomo1> createState() => _TimerDeomo1State();
}

class _TimerDeomo1State extends State<TimerDeomo1> {
  // String message = "Start";
  int count = 5;
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 3), () {});
    // setState(() {
    //   message = "Stop";
    // });
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      
      setState(() {
        count--;
        if(count==0){
          timer.cancel();
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(count.toString(), style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
