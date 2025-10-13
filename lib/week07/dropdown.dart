import 'package:flutter/material.dart';

class Dropdowndemo extends StatefulWidget {
  const Dropdowndemo({super.key});

  @override
  State<Dropdowndemo> createState() => _DropdowndemoState();
}

class _DropdowndemoState extends State<Dropdowndemo> {
  int ddValue = 0;
  List fruits = ['Apple', 'Banana', 'Orange'];
  void updateDropdown(int? value) {
    setState(() {
      ddValue = value!;
    });
  }

  List<DropdownMenuItem<int>> createDropdown() {
    return List.generate(
      fruits.length,
      (index) => DropdownMenuItem(value: index, child: Text(fruits[index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton(
              value: ddValue,
              items: createDropdown(),
              onChanged: updateDropdown,
            ),
            Text('You choose: $ddValue'),
          ],
        ),
      ),
    );
  }
}
