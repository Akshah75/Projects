// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:security_app/constent.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({Key? key}) : super(key: key);

  @override
  State<FileUploadScreen> createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  FilePickerResult? result;
  List<File>? storedFiles;
  List<PlatformFile>? showFile;

  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 250,
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.black),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: storedFiles != null ? storedFiles!.length : null,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('$index'),
                    );
                  })),
          RaisedButton.icon(
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: pickMultipleFiles,
              icon: const Icon(Icons.file_copy),
              label: const Text("Add File")),
        ],
      ),
    );
  }

  Widget buildListFile(PlatformFile file) {
    return ListTile(
      title: Text(file.name),
    );
  }
  //

  //pick multiple file
  void pickMultipleFiles() async {
    FilePickerResult? results = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);

    if (results != null) {
      List<File> files = results.names.map((path) => File(path!)).toList();

      print(files);
      print("ne");
      storedFiles = files;
      // lodedSelected(storedFiles!);
      setState(() {});
    }
  }

  //

  //upload multiple file
  Future<void> fileUploads() async {
    // ignore: avoid_print
    print("working??");
    const url = '${basedUrl}multiple';
    // ignore: avoid_print
    print(url);
    //crete arry
    //
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    //
    print(request);
    //
    List<http.MultipartFile> newFiles = [];
    //for loop
    for (var img in storedFiles!) {
      if (img != null) {
        var multiFile = await http.MultipartFile.fromPath(
          "file[]",
          File(img.path).path,
        );
        newFiles.add(multiFile);
      }
    }
    request.files.addAll(newFiles);
    var response = await request.send();
    print(response.toString());
    response.stream.transform(utf8.decoder).listen((value) {
      print('value');
      print(value);
    });
  }
}
