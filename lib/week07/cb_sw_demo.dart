import 'package:flutter/material.dart';

class CbSwDemo extends StatefulWidget {
  const CbSwDemo({super.key});

  @override
  State<CbSwDemo> createState() => _CbSwDemoState();
}

class _CbSwDemoState extends State<CbSwDemo> {
  //state variable for checkbox
  bool cb = false;
  bool sw = false;

  void updateSW(bool? value) {
    setState(() {
      sw = value!;
    });
  }

  //Function to update the checkbox
  void updateCB(bool? value) {
    setState(() {
      cb = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value: cb, onChanged: updateCB),
                Text('Checkbox : $cb'),
              ],
            ),

            Row(
              children: [
                Switch(value: sw, onChanged: updateSW),
                Text("Switch: $sw"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
