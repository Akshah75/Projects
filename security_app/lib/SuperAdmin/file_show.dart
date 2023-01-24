import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:security_app/SuperAdmin/show_file_widget.dart';

class FileShowScreen extends StatefulWidget {
  const FileShowScreen({Key? key}) : super(key: key);

  @override
  State<FileShowScreen> createState() => _FileShowScreenState();
}

class _FileShowScreenState extends State<FileShowScreen> {
  List<PlatformFile>? storedFiles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              storedFiles != null
                  ? Container(
                      child: ListView.builder(
                        itemCount: storedFiles!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final files = storedFiles![index];
                          return buildListTile(files);
                        },
                      ),
                    )
                  : Container(),
              Container(
                child: ElevatedButton.icon(
                  onPressed: pickMultipleFiles,
                  icon: const Icon(Icons.image),
                  label: const Text("Select file"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  void pickMultipleFiles() async {
    print("eork");
    FilePickerResult? results = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);
    if (results == null) return;
    // storedFiles = results.files;
    selectedFile(results.files);
    // List<File> files
    // storedFiles = results.paths.map((path) => File(path!)).toList();
    // print(files);
    // storedFiles = files;
    // setState(() {});
    print(storedFiles);
  }

  void selectedFile(List<PlatformFile> files) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => ShowFile(
              files: files,
            )),
      ),
    );
  }
}
  // void pickMultipleFiles() async {
  //   FilePickerResult? results = await FilePicker.platform
  //       .pickFiles(allowMultiple: true, type: FileType.any);
  //   if (results != null) {
  //     List<PlatformFile> files = results.paths
  //         .map((path) => File(path!))
  //         .cast<PlatformFile>()
  //         .toList();
  //     print(files);
  //     storedFiles = files.cast<File>();
  //     setState(() {});
  //   }
  // }
  
 // viewFilePage() {
  //   print("workPP");
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => imageList(storedFiles)),
  //       (route) => false);
  // }