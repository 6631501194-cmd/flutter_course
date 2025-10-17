import 'package:flutter/material.dart';

class PageviewDemo extends StatelessWidget {
  const PageviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: PageView(
        children: [
          Container(color: Colors.yellow, child: Text("Page 1")),
          Container(color: Colors.green, child: Text("Page 2")),
          Container(color: Colors.red, child: Text("Page 3")),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.arrow_forward),),

    );
  }
}
