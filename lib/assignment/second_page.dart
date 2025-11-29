import 'dart:async';
import 'package:flutter/material.dart';
import 'third_page.dart';

class SecondPage extends StatefulWidget {
  final int score;
  final int timeLeft;

  const SecondPage({
    super.key,
    required this.score,
    required this.timeLeft,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late int _timeLeft;
  late int _score;
  Timer? _timer;

  bool _answerYes = false; // does the sunset in the west? correct = Yes(true)

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.timeLeft;
    _score = widget.score;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _timeLeft--;
      });

      if (_timeLeft <= 0) {
        _timer?.cancel();
        _goToSummary();
      }
    });
  }

  void _goToSummary() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ThirdPage(score: _score),
      ),
    );
  }

  void _finishQuiz() {
    // check answer for Q2
    if (_answerYes) {
      _score++;
    }

    _timer?.cancel();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ThirdPage(score: _score),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Time: $_timeLeft',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '2. Does the sunset in the west?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('No'),
                Switch(
                  value: _answerYes,
                  onChanged: (value) {
                    setState(() {
                      _answerYes = value;
                    });
                  },
                ),
                const Text('Yes'),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: FilledButton(
                onPressed: () {
                  if (_timeLeft <= 0) return;
                  _finishQuiz();
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
