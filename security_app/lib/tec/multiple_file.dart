import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MultipleFile extends StatefulWidget {
  final List<PlatformFile> files;
  const MultipleFile({required this.files, Key? key}) : super(key: key);

  @override
  State<MultipleFile> createState() => _MultipleFileState();
}

class _MultipleFileState extends State<MultipleFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
