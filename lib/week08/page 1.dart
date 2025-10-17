import 'package:flutter/material.dart';
import 'package:flutter_course/week08/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1"), centerTitle: false),
      body: Align(
        alignment: Alignment.topCenter,
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page2(),
                settings: RouteSettings(
                  arguments: <String, dynamic>{
                    'name': 'apple',
                    'price': 15,
                    'date': ['15 Oct', '20 Oct'],
                  },
                ),
              ),
            );
          },
          child: Text("Next"),
        ),
      ),
    );
  }
}
