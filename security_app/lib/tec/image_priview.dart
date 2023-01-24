// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:security_app/constent.dart';
import 'package:file_picker/file_picker.dart';
import 'package:security_app/image_upload/image.dart';
import 'dart:async';

class ImageInpute extends StatefulWidget {
  const ImageInpute({Key? key}) : super(key: key);

  @override
  State<ImageInpute> createState() => _ImageInputeState();
}

class _ImageInputeState extends State<ImageInpute> {
  File? storedImage;
  List<File>? storedFiles;
  FilePickerResult? result;
  PlatformFile? file;
  final picker = ImagePicker();

  //
  Future<void> takepicture() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      storedImage = File(pickedFile.path);
    } else {
      // ignore: avoid_print
      print('null');
    }
  }

  //
  void pickMultipleFile() async {
    result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null && result!.files.single.path != null) {
      PlatformFile file = result!.files.first;
      print(file.name);

      File _file = File(result!.files.single.path!);
      setState(() {
        storedImage = File(_file.path);
      });
    }
  }

  //
  void pickMultipleFiles() async {
    FilePickerResult? results = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);
    if (results != null) {
      List<File> files = results.paths.map((path) => File(path!)).toList();
      print(files);
      print("ne");
      storedFiles = files;
      setState(() {});
      print(storedFiles);
    }
  }

  //
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

    //

    // for (int i = 0; i < storedFiles!.length; i++) {
    //   var path = storedFiles![i].path;
    //   print("working" + path);
    //   //
    //   File imageFile = File(path);
    //   var stream = http.ByteStream(imageFile.openRead());
    //   var length = await imageFile.length();
    //   var multipartFile = http.MultipartFile("file[]", stream, length,
    //       filename: basename(imageFile.path));
    //   newFiles.add(multipartFile);
    // }
    // final req = await request.send();

    // //

    // request.files.addAll(newFiles);
    var response = await request.send();
    print(response.toString());

    response.stream.transform(utf8.decoder).listen((value) {
      print('value');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: fileUploads, child: const Text('up')),
        TextButton(onPressed: pickMultipleFiles, child: const Text('pick ')),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          alignment: Alignment.center,
          child: storedImage != null
              ? Image.file(
                  storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'no image taken',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: pickMultipleFiles,
            label: const Text('take image'),
            icon: const Icon(Icons.camera),
            textColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  //upload file on server
  Future<void> fileUpload() async {
    // ignore: avoid_print
    print("working??");
    const url = '${basedUrl}file';
    // ignore: avoid_print
    print(url);
    final stream = http.ByteStream(storedImage!.openRead());
    final length = await storedImage!.length();
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var multipartFileSign = http.MultipartFile('file', stream, length,
        filename: basename(storedImage!.path));
    request.files.add(multipartFileSign);
    final res = await request.send();
    res.stream.transform(utf8.decoder).listen((event) {
      // ignore: avoid_print
      print(event);
    });
  }
}
