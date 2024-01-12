import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class StudyMaterialPage extends StatefulWidget {
  const StudyMaterialPage({Key? key}) : super(key: key);

  @override
  _StudyMaterialPageState createState() => _StudyMaterialPageState();
}

class _StudyMaterialPageState extends State<StudyMaterialPage> {
  String? selectedSection;
  int selectedPdfIndex = 0;
  List<String> sections = ['Section 1', 'Section 2', 'Section 3','Section 1', 'Section 2', 'Section 3']; // Add your sections here
  List<List<String>> pdfFiles = [
    ['Section1_PDF1.pdf', 'Section1_PDF2.pdf', 'Section1_PDF3.pdf'],
    ['Section2_PDF1.pdf', 'Section2_PDF2.pdf', 'Section2_PDF3.pdf'],
    ['Section3_PDF1.pdf', 'Section3_PDF2.pdf', 'Section3_PDF3.pdf'],
  ]; // Add your PDF files here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Study Material',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Row(
        children: [
          Container(
            width: 360, // Adjust the width as needed
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
                      selectedPdfIndex = 0; // Reset to the first PDF when the section changes
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 3, // Adjust the flex value as needed
            child: pdfWidget(),
          ),
        ],
      ),
    );
  }

  Widget pdfWidget() {
    if (selectedSection == null) {
      return Center(
        child: Text('Please select a section.'),
      );
    }

    return PDFView(
      filePath: 'assets/${pdfFiles[sections.indexOf(selectedSection!)][selectedPdfIndex]}',
      autoSpacing: true,
      pageFling: true,
      onRender: (_) {},
      onViewCreated: (PDFViewController viewController) {
        // Add any PDF controller settings if needed
      },
    );
  }
}
