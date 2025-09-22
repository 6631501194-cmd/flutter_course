import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class BakerDemo extends StatelessWidget {
  const BakerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Image.asset('assets1/images/baking.jpg', fit: BoxFit.cover),
          ),
          Spacer(),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Text(
                  "Baking lessons".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Master The Art of Baking".toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
                Spacer(),
                FilledButton.icon(
                  onPressed: () {},
                  style: FilledButton.styleFrom(backgroundColor: primaryColor),
                  label: Text(
                    "Start Learning".toUpperCase(),
                    style: TextStyle(color: bgColor),
                  ),
                  icon: Icon(Icons.arrow_forward, color: Colors.black),
                  iconAlignment: IconAlignment.end,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}