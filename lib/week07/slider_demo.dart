import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double sliderValue = 0.5;
  double customValue = 100;
  void updateSlider(double? value) {
    setState(() {
      sliderValue = value!;
    });
  }

  void updateCustom(double? value) {
    setState(() {
      customValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Default Slider: $sliderValue"),
            Slider(value: sliderValue, onChanged: updateSlider),
            Text("Custom Slider: $customValue"),
            Slider(
              min: 0,
              max: 100,
              divisions: 10,
              value: customValue,
              label: customValue.round().toString(),
              onChanged: updateCustom,
            ),
          ],
        ),
      ),
    );
  }
}
