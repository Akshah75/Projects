import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowFile extends StatefulWidget {
  final List<PlatformFile> files;

  const ShowFile({required this.files, Key? key}) : super(key: key);

  @override
  State<ShowFile> createState() => _ShowFileState();
}

class _ShowFileState extends State<ShowFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("show file"),
        // actions: [
        //   ElevatedButton.icon(
        //       onPressed: () {
        //         fileUploads(widget.files);
        //       },
        //       icon: const Icon(Icons.add),
        //       label: const Text("add"))
        // ],
      ),
      body: widget.files != null
          ? Container(
              padding: const EdgeInsets.only(top: 100),
              child: ListView.builder(
                itemCount: widget.files.length,
                itemBuilder: (context, index) {
                  final files = widget.files[index];
                  return buildListTile(files);
                },
              ),
            )
          : Container(),
    );
  }
}

//   Future<void> fileUploads(List<PlatformFile> files) async {
//     print(files);
//     const basedUrl = 'http://192.168.1.3:8000/api/';
//     // ignore: avoid_print
//     print("working??");
//     const url = '${basedUrl}files';
//     // ignore: avoid_print
//     print(url);
//     //crete arry
//     http.MultipartRequest request = http.MultipartRequest(
//       'POST',
//       Uri.parse(url),
//     );
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//     };
//     //
//     print(request);
//     //
//     List<http.MultipartFile> newFiles = [];
//     //for loop
//     for (var img in files) {
//       if (img != null) {
//         var multiFile = await http.MultipartFile.fromPath(
//           "files[]",
//           File(img.path as String).path,
//         );
//         newFiles.add(multiFile);
//       }
//     }
//     request.files.addAll(newFiles);
//     var response = await request.send();
//     print(response.toString());
//     response.stream.transform(utf8.decoder).listen((value) {
//       print('value');
//       print(value);
//     });
//   }
// }

Widget buildListTile(PlatformFile file) {
  return ListTile(
    title: Text(
      file.path!.split('/').last,
    ),
  );
}
