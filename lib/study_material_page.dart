import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class StudyMaterialPage extends StatefulWidget {
  const StudyMaterialPage({Key? key}) : super(key: key);

  @override
  _StudyMaterialPageState createState() => _StudyMaterialPageState();
}

class _StudyMaterialPageState extends State<StudyMaterialPage> {
  int selectedPdfIndex = 0;
  List<String> pdfFiles = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadFiles();
  }

  Future<void> loadFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedPdfFiles = prefs.getStringList('pdfFiles');

    if (savedPdfFiles != null) {
      setState(() {
        pdfFiles = savedPdfFiles;
      });
    }
  }

  Future<void> saveFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('pdfFiles', pdfFiles);
  }

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
              itemCount: pdfFiles.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(pdfFiles[index]),
                  onTap: () {
                    setState(() {
                      selectedPdfIndex = index;
                    });
                    _viewPdfFile(context, index);
                  },
                  onLongPress: () {
                    _showDeleteDialog(context, index);
                  },
                  tileColor: selectedPdfIndex == index
                      ? Colors.grey[300]
                      : null,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? filePath = await pickPDFFile();
          if (filePath != null) {
            String fileName = File(filePath).uri.pathSegments.last;

            // Save the file to the app's local storage
            await saveFileLocally(fileName, filePath);

            // Update the UI
            setState(() {
              pdfFiles.add(fileName);
              selectedPdfIndex =
                  pdfFiles.length - 1; // Select the newly added file
              saveFiles();
            });
          }
        },
        tooltip: 'Upload PDF',
        child: const Icon(Icons.upload_file),
      ),
    );
  }

  Future<void> _viewPdfFile(BuildContext context, int index) async {
    String filePath = await getPdfFilePath(index);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(filePath: filePath),
      ),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, int index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this file?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _deleteFile(index);
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void _deleteFile(int index) {
    String fileName = pdfFiles[index];
    setState(() {
      pdfFiles.removeAt(index);
      selectedPdfIndex = 0;
    });
    saveFiles(); // Save updated file list
    _deleteFileLocally(fileName);
  }

  Future<void> _deleteFileLocally(String fileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File file = File('${appDocDir.path}/$fileName');
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<void> saveFileLocally(String fileName, String filePath) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File sourceFile = File(filePath);
    File destinationFile = File('${appDocDir.path}/$fileName');
    await sourceFile.copy(destinationFile.path);
  }

  Future<String?> pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      return result.files.first.path;
    } else {
      return null;
    }
  }

  Widget pdfWidget() {
    return FutureBuilder<String>(
      future: getPdfFilePath(selectedPdfIndex),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String filePath = snapshot.data!;
          return SfPdfViewer.file(
            File(filePath),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<String> getPdfFilePath(int index) async {
    if (pdfFiles.isEmpty) {
      return ''; // You may want to handle this case based on your requirements
    }

    String fileName = pdfFiles[index];
    return '${(await getApplicationDocumentsDirectory()).path}/$fileName';
  }
}

class PdfViewerPage extends StatelessWidget {
  final String filePath;

  const PdfViewerPage({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: SfPdfViewer.file(File(filePath)),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: StudyMaterialPage(),
  ));
}
