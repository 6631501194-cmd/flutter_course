import 'package:flutter/material.dart';
import 'welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Given accounts
  final List<Map<String, String>> accounts = [
    {'username': 'James', 'password': '1111'},
    {'username': 'Lara', 'password': '2222'},
  ];

  void _signIn() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    // Check empty or invalid
    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog();
      return;
    }

    Map<String, String>? foundUser;
    for (var acc in accounts) {
      if (acc['username'] == username && acc['password'] == password) {
        foundUser = acc;
        break;
      }
    }

    if (foundUser == null) {
      // wrong username or password
      _showErrorDialog();
    } else {
      // correct → go to welcome page
      // Use pushReplacement so back button cannot return to login from welcome
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => WelcomePage(username: foundUser!['username']!),
        ),
      );
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // tap outside = no close
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Error'),
          content: const Text('Wrong username or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // close dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _signIn,
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
