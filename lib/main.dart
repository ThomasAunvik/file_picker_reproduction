import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioPickerScreen(),
    );
  }
}

class AudioPickerScreen extends StatelessWidget {
  Future<void> _pickAudioFile() async {
    // Configure the file picker to only show audio files
    final params = OpenFileDialogParams(
      // fileTypeFilter: ['audio/*'], // Filter for audio files
    );

    // Open the file picker
    final filePath = await FlutterFileDialog.pickFile(params: params);

    if (filePath != null) {
      print("Selected audio file: $filePath");
      // Handle the file path (e.g., play the audio)
    } else {
      print("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Picker"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickAudioFile,
          child: Text("Pick Audio File"),
        ),
      ),
    );
  }
}