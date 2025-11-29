import 'package:flutter/material.dart';
import 'first_page.dart';

class ThirdPage extends StatelessWidget {
  final int score;

  const ThirdPage({super.key, required this.score});

  void _replay(BuildContext context) {
    // restart quiz and clear history so back button won't go back to old summary
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const FirstPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total score = $score',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => _replay(context),
              child: const Text('Replay'),
            ),
          ],
        ),
      ),
    );
  }
}
