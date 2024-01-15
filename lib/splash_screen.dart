import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer when the state is initialized
    Timer(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the landing page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 3), // Animation duration
          curve: Curves.easeInOutQuart, // Animation curve
          width: 250,
          height: 250,
          child: Image.asset('assets/logo.png'), // Replace with your image
        ),
      ),
    );
  }
}
