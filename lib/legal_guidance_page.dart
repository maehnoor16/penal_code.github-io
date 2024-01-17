import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class LegalGuidancePage extends StatelessWidget {
  const LegalGuidancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Legal Guidance',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: FileList(),
    );
  }
}

class FileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('files').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        var files = snapshot.data!.docs;

        return ListView.builder(
          itemCount: files.length,
          itemBuilder: (context, index) {
            var file = files[index];
            return ListTile(
              title: Text(file['name']),
              onTap: () {
                _openPDF(context, file['url']);
              },
            );
          },
        );
      },
    );
  }

  Future<void> _openPDF(BuildContext context, String pdfUrl) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(pdfUrl),
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;

  const PdfViewerPage(this.pdfUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: Colors.brown,
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          print(error);
        },
      ).cachedFromUrl(pdfUrl),
    );
  }
}
