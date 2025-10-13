import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int gValue = 0;
  List fruits = ['Apple', 'Banana', 'Orange', 'Papaya'];

  // List<Widget> createRadio() {
  //   List<Widget> widgets = [];
  //   for (int i = 0; i < fruits.length; i++) {
  //     widgets.add(Radio(value: i, groupValue: gValue, onChanged: updateRadio));
  //     widgets.add(Text(fruits[i]));
  //   }
  //   return widgets;
  // }

  List<Widget> createRadio() {
    List<Widget> widgets = List.generate(
      fruits.length,
      (index) =>
          Radio(value: index, groupValue: gValue, onChanged: updateRadio),
    );
    return widgets;
  }

  void updateRadio(int? value) {
    setState(() {
      gValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(children: createRadio()),
            Text("You choose: $gValue"),
          ],
        ),
      ),
    );
  }
}
