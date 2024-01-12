import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SharePage extends StatelessWidget {
  const SharePage({Key? key}) : super(key: key);

  // You can leave these URLs as placeholders or remove them temporarily
  final String appStoreLink = 'https://apps.apple.com/your-app-id'; // Placeholder or remove
  final String playStoreLink = 'https://play.google.com/store/apps/details?id=your.package.name'; // Placeholder or remove

  // Define the share message without app links
  final String shareMessage = 'Check out [Your App Name] - Your go-to app for legal advice and more!';

  // Function to open URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Widget to create a share icon
  Widget _buildShareIcon(String iconUrl, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(iconUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Share',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Share Raazi with others!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareIcon('http://tinyurl.com/2n2dxfmk', 'whatsapp://send?text=$shareMessage'),
                _buildShareIcon('http://tinyurl.com/yyvhujde', 'https://www.facebook.com/sharer/sharer.php?u=$appStoreLink'),
                _buildShareIcon('http://tinyurl.com/2s23espr', 'https://twitter.com/intent/tweet?text=$shareMessage'),
                _buildShareIcon('http://tinyurl.com/yrbda2dh', 'https://www.linkedin.com/shareArticle?url=$appStoreLink&summary=$shareMessage'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Share Raazi with your friends and colleagues!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SharePage(),
    theme: ThemeData(
      primaryColor: Colors.brown,
      scaffoldBackgroundColor: Colors.white,
    ),
  ));
}
