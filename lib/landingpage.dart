import 'package:flutter/material.dart';
import 'my_profile_page.dart';
import 'legal_guidance_page.dart';
import 'rate_us_page.dart';
import 'share_page.dart';
import 'terms_of_use_page.dart';
import 'my_questions_page.dart';
import 'chat.dart';
import 'study_material_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown, // Replace with your desired color
        title: const Text('Penal Code',
        style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined, color: Colors.white),
            onPressed: () {
                // Replace with your custom search delegate
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown, // Replace with your desired color
              ),
              child: Text(
                'Raazi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Handle home drawer item tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('My Profile'),
              onTap: () {
                // Handle My Profile drawer item tap
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage()));
              },
            ),
            ListTile(
              title: Text('Legal Advice'),
              onTap: () {
                // Handle My Profile drawer item tap
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LegalGuidancePage()));
              },
            ),
            ListTile(
              title: Text('Rate Us'),
              onTap: () {
                // Handle My Profile drawer item tap
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RateUsPage()));
              },
            ),
            ListTile(
              title: Text('Share'),
              onTap: () {
                // Handle My Profile drawer item tap
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SharePage()));
              },
            ),
            ListTile(
              title: Text('Terms of Use'),
              onTap: () {
                // Handle My Profile drawer item tap
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsOfUsePage()));
              },
            ),
            // Add other drawer items here
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your content here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.brown), // Brown icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.brown), // Brown icon
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Colors.brown), // Brown icon
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined, color: Colors.brown), // Brown icon
            label: 'LegalAdvice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.brown), // Brown icon
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation item taps
          // You can use Navigator to navigate to different screens based on the index
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LandingPage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchBar()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyMaterialPage()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Chat()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage()));
              break;
          }
        },
        fixedColor: Colors.brown, // Replace with your desired color
      ),
    );
  }
}