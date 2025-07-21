import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'pages/auth_page.dart';
import 'pages/main_navigation.dart';

void main() {
  runApp(const WellnessAIApp());
}

class WellnessAIApp extends StatelessWidget {
  const WellnessAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Automatically detect platform and use appropriate design
    if (Platform.isIOS) {
      return CupertinoApp(
        title: 'Wellness AI',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemGreen,
          brightness: Brightness.light,
        ),
        home: const AuthWrapper(),
      );
    } else {
      return MaterialApp(
        title: 'Wellness AI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4CAF50), // Green theme for wellness
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
      );
    }
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Check if user is authenticated
    bool isAuthenticated = true; // Temporarily set to true to see tabs
    
    if (isAuthenticated) {
      return const MainNavigation();
    } else {
      return const AuthPage();
    }
  }
}
