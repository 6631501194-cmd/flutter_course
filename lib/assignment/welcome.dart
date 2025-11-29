import 'package:flutter/material.dart';
import 'login.dart';

class WelcomePage extends StatelessWidget {
  final String username;

  const WelcomePage({super.key, required this.username});

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Warning'),
          content: const Text('Are you sure to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // close dialog only
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Close dialog first
                Navigator.of(dialogContext).pop();

                // Go back to login and REMOVE all previous routes
                // so back button cannot return to welcome page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false, // remove everything
                );
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
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => _confirmLogout(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome $username',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
