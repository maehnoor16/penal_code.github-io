import 'package:flutter/material.dart';

class LegalGuidancePage extends StatelessWidget {
  const LegalGuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Legal Guidance',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implement your legal guidance page UI here
            Text('Legal Guidance Page'),
          ],
        ),
      ),
    );
  }
}
