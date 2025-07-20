import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness AI'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.health_and_safety,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Wellness AI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Your AI-powered wellness companion',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40),
            // TODO: Add login/signup buttons
          ],
        ),
      ),
    );
  }
} 