import 'package:flutter/material.dart';
import 'my_profile_page.dart';
import 'legal_guidance_page.dart';
import 'rate_us_page.dart';
import 'share_page.dart';
import 'terms_of_use_page.dart';
import 'chat.dart';
import 'study_material_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'Penal Code',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
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
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage()));
              },
            ),
            ListTile(
              title: const Text('Legal Advice'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LegalGuidancePage()));
              },
            ),
            ListTile(
              title: const Text('Rate Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RateUsPage()));
              },
            ),
            ListTile(
              title: const Text('Share'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SharePage()));
              },
            ),
            ListTile(
              title: const Text('Terms of Use'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsOfUsePage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Posters (Cards)
            PosterCard(
              assetImagePath: 'assets/poster1.png',
              onTap: () {
                // Handle poster1 tap
              },
            ),
            PosterCard(
              assetImagePath: 'assets/poster2.png',
              onTap: () {
                // Handle poster2 tap
              },
            ),
            // Larger Icons for Navigation
            NavigationIcon(
              icon: Icons.book,
              label: 'Study Material',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyMaterialPage()));
              },
            ),
            NavigationIcon(
              icon: Icons.chat_outlined,
              label: 'Legal Advice',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LegalGuidancePage()));
              },
            ),
            NavigationIcon(
              icon: Icons.person,
              label: 'Profile',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage()));
                },
            ),
            NavigationIcon(
              icon: Icons.description,
              label: 'Terms of Use',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsOfUsePage()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.brown),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Colors.brown),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined, color: Colors.brown),
            label: 'LegalAdvice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.brown),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LandingPage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyMaterialPage()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Chat()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage()));
              break;
          }
        },
        fixedColor: Colors.brown,
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      title: Text(query),
      onTap: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class PosterCard extends StatelessWidget {
  final String assetImagePath;
  final VoidCallback onTap;

  const PosterCard({required this.assetImagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            assetImagePath,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const NavigationIcon({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon, size: 36.0, color: Colors.brown),
          const SizedBox(width: 16.0),
          Text(
            label,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const LandingPage(),
    theme: ThemeData(
      primaryColor: Colors.brown,
      hintColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    ),
  ));
}
