import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const StudyMaterialPage(),
    );
  }
}

class StudyMaterialPage extends StatefulWidget {
  const StudyMaterialPage({super.key});

  @override
  _StudyMaterialPageState createState() => _StudyMaterialPageState();
}

class _StudyMaterialPageState extends State<StudyMaterialPage> {
  String? selectedSection;
  int selectedPdfIndex = 0;
  List<String> sections = ['Finance Act1']; // Add your sections here

  List<List<String>> pdfFiles = [
    ['FinanceAct2011.pdf'],
    // Add more sections and corresponding PDF files as needed
  ]; // Add your PDF files here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study Material',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Row(
        children: [
          Container(
            width: 360,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown),
            ),
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(sections[index]),
                  onTap: () {
                    setState(() {
                      selectedSection = sections[index];
                      selectedPdfIndex = 0; // Corrected the index here
                    });
                  },
                  tileColor: selectedSection == sections[index] ? Colors.grey[300] : null,
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: pdfWidget(),
          ),
        ],
      ),
    );
  }

  Widget pdfWidget() {
    if (selectedSection == null) {
      return const Center(
        child: Text('Please select a section.'),
      );
    }

    String filePath =
        'material/${pdfFiles[sections.indexOf(selectedSection!)][selectedPdfIndex]}';
    print('Selected Section: $selectedSection');
    print('File Path: $filePath');

    return PDFView(
      filePath: filePath,
      autoSpacing: true,
      pageFling: true,
      onRender: (_) {},
      onViewCreated: (PDFViewController viewController) {
        // Add any PDF controller settings if needed
      },
    );
  }
}
