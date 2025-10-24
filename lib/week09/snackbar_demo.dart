import 'package:flutter/material.dart';

class SnakbarDemo extends StatelessWidget {
  const SnakbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 8),
                  content: Text("You have completed your tast!"),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      debugPrint('Undo action!');
                    },
                  ),
                ),
              );
            },
            child: Text('Show'),
          ),
        ),
      ),
    );
  }
}
