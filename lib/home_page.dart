import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Column(
        children: [
          // Implement your home page UI here
          // Slider, icons (My Profile, My Questions, Legal Guidance, Study Material)
        ],
      ),
    );
  }
}
