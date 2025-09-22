import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    debugPrint('button print');
                  },
                  icon: Icon(Icons.volume_up, color: Colors.red),
                ),
                SizedBox(width: 8),
                Ink(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    onPressed: () {
                      debugPrint("button print");
                    },
                    icon: Icon(Icons.android, color: Colors.white),
                  ),
                ),
                SizedBox(width: 8),
                Ink(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.android),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            OverflowBar(
              children: [
                OutlinedButton(onPressed: () {}, child: Text("OutlineButton")),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text("OutlineButton"),
                ),
              ],
            ),
            Wrap(
              children: [
                TextButton(onPressed: () {}, child: Text("TextButton")),
                SizedBox(width: 30),
                ElevatedButton(onPressed: () {}, child: Text("ElevatedButton")),
                SizedBox(width: 30),
                FilledButton(onPressed: () {}, child: Text("FilledButton")),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("FilledButton"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}