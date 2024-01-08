import 'package:flutter/material.dart';

class StudyMaterialPage extends StatelessWidget {
  const StudyMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Material'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implement your study material page UI here
            Text('Study Material Page'),
          ],
        ),
      ),
    );
  }
}
