import 'dart:math';
import 'package:flutter/material.dart';

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});

  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  String result = '';
  TextEditingController tcMin = TextEditingController();
  TextEditingController tcMax = TextEditingController();

  void generateRandom() {
    int? min = int.tryParse(tcMin.text);
    int? max = int.tryParse(tcMax.text);
    if (min == null || max == null || min > max) {
      setState(() {
        result = 'Wrong inputs!';
      });
    } else {
      // generate a random integer
      int random = min + Random().nextInt(max - min + 1);
      setState(() {
        // result = random.toString();
        result = '$random';
      });
    }
  }

  void clear() {
    setState(() {
      tcMin.clear();
      tcMax.clear();
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Random Integer Number'),
              TextField(
                controller: tcMin,
                decoration: InputDecoration(hintText: 'min'),
              ),
              TextField(
                controller: tcMax,
                decoration: InputDecoration(hintText: 'max'),
              ),
              SizedBox(height: 8),
              Text(result, style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: generateRandom,
                    child: Text('Generate'),
                  ),
                  SizedBox(width: 4),
                  FilledButton(onPressed: clear, child: Text('Clear')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
