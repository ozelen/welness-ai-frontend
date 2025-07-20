import 'package:flutter/material.dart';

class BarcodeScannerPage extends StatelessWidget {
  const BarcodeScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'Scan Food Barcode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Point your camera at a food barcode\nto get nutritional information',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40),
            // TODO: Add barcode scanner widget
          ],
        ),
      ),
    );
  }
} 