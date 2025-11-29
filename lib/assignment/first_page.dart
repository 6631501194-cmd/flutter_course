import 'dart:async';
import 'package:flutter/material.dart';
import 'second_page.dart';
import 'third_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _timeLeft = 10; // total time for the whole quiz
  int _score = 0;
  Timer? _timer;
  String? _selectedAnswer; // Apple / Banana / Kiwi

  @override
  void initState() {
    super.initState();
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

  void _goToSecondPage() {
    // check answer for Q1
    if (_selectedAnswer == 'Banana') {
      _score++;
    }

    _timer?.cancel(); // stop timer here, restart in second page with remaining time

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SecondPage(
          score: _score,
          timeLeft: _timeLeft,
        ),
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
              '1. Which is yellow?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const Text('Apple'),
              value: 'Apple',
              groupValue: _selectedAnswer,
              onChanged: (value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Banana'),
              value: 'Banana',
              groupValue: _selectedAnswer,
              onChanged: (value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Kiwi'),
              value: 'Kiwi',
              groupValue: _selectedAnswer,
              onChanged: (value) {
                setState(() {
                  _selectedAnswer = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: FilledButton(
                onPressed: () {
                  // if time already 0, do nothing (timer will navigate)
                  if (_timeLeft <= 0) return;
                  _goToSecondPage();
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
