import 'package:flutter/material.dart';

class MultipleChildDemo extends StatelessWidget {
  const MultipleChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // children: [
          //   Container(width: 100, height: 100, color: Colors.red),
          //   Container(width: 100, height: 200, color: Colors.green),
          //   Container(width: 100, height: 100, color: Colors.blue),
          // ],
          // children: [
          //   Container(width: 100, height: 100, color: Colors.red),
          //   Spacer(flex: 1),
          //   Container(width: 100, height: 200, color: Colors.green),
          //   Spacer(flex: 1),
          //   Container(width: 100, height: 100, color: Colors.blue),
          // ],
          children: [
            Expanded(
              flex: 1,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
            Container(width: 100, height: 200, color: Colors.green),
            Expanded(
              flex: 1,
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
