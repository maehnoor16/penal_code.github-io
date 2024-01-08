import 'package:bhenskidum/legal_guidance_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

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
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: _user != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateInformationPage(user: _user!),
                  ),
                );
              },
              child: Text('Update Information'),
              style: ElevatedButton.styleFrom(primary: Colors.brown),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LegalGuidancePage()));
                // Implement your own navigation logic
              },
              child: Text('Legal Advice'),
              style: ElevatedButton.styleFrom(primary: Colors.brown),
            ),
            // Add more options as needed
          ],
        ),
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class UpdateInformationPage extends StatelessWidget {
  final User user;

  const UpdateInformationPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Update Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL ?? ''),
            ),
            const SizedBox(height: 16),
            Text(
              'Update Information for ${user.displayName ?? 'User'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Implement fields for updating email, password, username, profile picture, date of birth, etc.
            // Use TextFormField, ImagePicker, DateTimePicker, etc.
            // Example:
            TextFormField(
              decoration: InputDecoration(labelText: 'Update Email'),
              keyboardType: TextInputType.emailAddress,
              // Add controller for email
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Update Password'),
              obscureText: true,
              // Add controller for password
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement update logic using FirebaseAuth
              },
              child: Text('Update'),
              style: ElevatedButton.styleFrom(primary: Colors.brown),
            ),
          ],
        ),
      ),
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
