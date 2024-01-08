import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'landingpage.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => _email = value,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            onChanged: (value) => _password = value,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LandingPage()));
              } catch (e) {
                print('Error: $e');
                // Handle authentication errors here
              }
            },
            child: const Text('Sign Up'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LandingPage()));
              } catch (e) {
                print('Error: $e');
                // Handle authentication errors here
              }
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
