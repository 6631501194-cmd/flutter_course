import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  // state variable
  String message = '';
  TextEditingController tcName = TextEditingController();

  // functions
  void updateText() {
    setState(() {
      message = tcName.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Demo", style: TextStyle(fontFamily: "IndieFlower")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tcName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter your name",
                suffixIcon: IconButton(
                  onPressed: () {
                    tcName.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: updateText, child: Text('OK')),
          SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(fontFamily: 'IndieFlower', fontSize: 22),
          ),
        ],
      ),
    );
  }
}
