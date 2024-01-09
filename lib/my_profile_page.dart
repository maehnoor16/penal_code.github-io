import 'package:bhenskidum/update_information_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'legal_guidance_page.dart';
import 'update_information_page.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MyProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    User? user = _auth.currentUser;
    await user?.reload(); // Reload user data to get updated information
    user = _auth.currentUser; // Get the updated user data
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Profile Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _user != null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(_user!.photoURL ?? ''),
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome, ${_user!.displayName ?? 'User'}!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to update information page
                User? currentUser = FirebaseAuth.instance.currentUser;
                if (currentUser != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UpdateInformationPage(user: currentUser),
                    ),
                  );
                } else {
                  // Handle the case when the user is not logged in
                  print('User not logged in');
                }
              },
              child: Text('Update Information'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.brown,
                side: BorderSide(color: Colors.brown),
              ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LegalGuidancePage()),
                );
                // Implement your own navigation logic
              },
              child: Text('Legal Advice'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.brown,
                side: BorderSide(color: Colors.brown),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement your own navigation logic for study material
              },
              child: Text('Study Material'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.brown,
                side: BorderSide(color: Colors.brown),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Text('Signout', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyProfilePage(),
    theme: ThemeData(
      primaryColor: Colors.brown,
      hintColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    ),
  ));
}
