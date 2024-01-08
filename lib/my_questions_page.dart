import 'package:flutter/material.dart';

class MyQuestionsPage extends StatelessWidget {
  const MyQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Questions'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implement your my questions page UI here
            Text('My Questions Page'),
          ],
        ),
      ),
    );
  }
}
