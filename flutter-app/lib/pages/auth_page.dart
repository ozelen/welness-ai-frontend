import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../utils/platform_widgets.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Platform-aware icon and colors
    final icon = PlatformWidgets.platformIcon(
      iosIcon: CupertinoIcons.heart_fill,
      androidIcon: Icons.favorite,
    );
    
    final primaryColor = PlatformWidgets.platformColor(
      iosColor: CupertinoColors.systemGreen,
      androidColor: Colors.green,
    );

    return PlatformWidgets.platformPageScaffold(
      appBar: PlatformWidgets.platformAppBar(
        title: 'Wellness AI',
        context: context,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
              color: primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to Wellness AI',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Platform.isIOS ? CupertinoColors.label : Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your AI-powered wellness companion',
              style: TextStyle(
                fontSize: 16, 
                color: Platform.isIOS ? CupertinoColors.secondaryLabel : Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            // Platform-aware button example
            PlatformWidgets.platformButton(
              onPressed: () {
                // TODO: Add login functionality
              },
              backgroundColor: primaryColor,
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Platform.isIOS ? CupertinoColors.white : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 