import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // TODO: Add profile settings and user onboarding
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.health_and_safety),
              title: Text('Health Goals'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
} 