import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms Of Use',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Penal Code!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'By accessing or using our mobile application, Penal Code, you agree to comply with and be bound by the following terms and conditions. Please read these Terms of Use carefully before using our app.',
              ),
              SizedBox(height: 16),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'By using Penal Code, you acknowledge that you have read, understood, and agree to be bound by these Terms of Use. If you do not agree to these terms, please refrain from using our app.',
              ),
              SizedBox(height: 16),
              Text(
                '2. Applicability of Penal Code Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Penal Code provides information related to penal codes for educational and informational purposes only. The content presented in this app does not constitute legal advice, and we encourage users to consult with legal professionals for specific legal concerns.',
              ),
              SizedBox(height: 16),
              Text(
                '3. User Responsibilities',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'You agree to use Penal Code responsibly and not engage in any activities that may violate applicable laws, regulations, or the rights of others. You are solely responsible for the content you submit, and you must not engage in any unlawful or unauthorized activities.',
              ),
              SizedBox(height: 16),
              Text(
                '4. Accuracy of Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'While we strive to provide accurate and up-to-date information, Penal Code makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability of the information provided. Reliance on any information from the app is at your own risk.',
              ),
              SizedBox(height: 16),
              Text(
                '5. Changes to Terms',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Penal Code reserves the right to modify or replace these Terms of Use at any time. It is your responsibility to check for updates periodically. Your continued use of the app after any changes to these terms constitutes acceptance of those changes.',
              ),
              SizedBox(height: 16),
              Text(
                '6. Termination',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Penal Code reserves the right to terminate or suspend your access to the app at any time, without notice, for any reason, including a breach of these Terms of Use.',
              ),
              SizedBox(height: 16),
              Text(
                '7. Governing Law',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'These Terms of Use are governed by and construed in accordance with the laws of Pakistan. Any dispute arising out of or in connection with these terms shall be subject to the exclusive jurisdiction of the courts in Pakistan.',
              ),
              SizedBox(height: 16),
              Text(
                'Thank you for using Penal Code! If you have any questions or concerns about these Terms of Use, please contact us at penalcode@gmail.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const TermsOfUsePage(),
    theme: ThemeData(
      primaryColor: Colors.brown,
      scaffoldBackgroundColor: Colors.white,
    ),
  ));
}
