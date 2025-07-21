import 'package:flutter/cupertino.dart';

class BarcodeScannerPage extends StatelessWidget {
  const BarcodeScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Barcode Scanner'),
      ),
      child: const Center(
        child: Text('Barcode Scanner'),
      ),
    );
  }
} 
