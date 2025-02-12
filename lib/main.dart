import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AudioPickerScreen());
  }
}

class AudioPickerScreen extends StatelessWidget {
  Future<void> _pickAudioFile() async {
    // Check and request storage permission
    if (await (Permission.audio.request()).isGranted) {
      // Open file picker for audio files
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );

      if (result != null) {
        // Get the selected file path
        String filePath = result.files.single.path!;
        print("Selected audio file: $filePath");
        // Handle the file path (e.g., play the audio)
      } else {
        print("No file selected.");
      }
    } else {
      print("Storage permission denied.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio Picker")),
      body: Center(
        child: ElevatedButton(
          onPressed: _pickAudioFile,
          child: Text("Pick Audio File"),
        ),
      ),
    );
  }
}
