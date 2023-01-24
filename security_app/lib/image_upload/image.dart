import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constent.dart';

//
class imagePick extends StatelessWidget {
  const imagePick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            pickImage();
          },
          child: Text('pickImage')),
    );
  }
}

//
File? imageFile;
String? imageData;
final picker = ImagePicker();
//

Future addImage() async {
  print('ok');
  final data = {
    'file': imageData,
  };
  final res = await http.post(Uri.parse(basedUrl + 'testing'), body: data);
  if (res.statusCode == 200) {
    print(res.body);
  }
}

//
pickImage() async {
  final pickedImage = await picker.getImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    setState(() {
      imageFile = File(pickedImage.path);
    });
    imageData = base64Encode(imageFile!.readAsBytesSync());
    return imageData;
  } else {
    return null;
  }
}

void setState(Null Function() param0) {}
