import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class MultipleFilePick extends StatefulWidget {
  const MultipleFilePick({Key? key}) : super(key: key);

  @override
  State<MultipleFilePick> createState() => _MultipleFilePickState();
}

class _MultipleFilePickState extends State<MultipleFilePick> {
  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;
    PlatformFile? files;
    File? file;

    return Scaffold(
      appBar: AppBar(title: const Text('file')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('pick file')),
          ],
        ),
      ),
    );
  }

  //
  // void pickFiles() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     allowMultiple: true,
  //   );
  //   if (result == null) return;
  //   file = result.files.first;
  // }
}
