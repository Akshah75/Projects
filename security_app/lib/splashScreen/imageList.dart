import 'dart:io';

import 'package:flutter/material.dart';

//
class imageList extends StatefulWidget {
  List<File>? storedFiles;

  imageList(this.storedFiles, {Key? key}) : super(key: key);

  @override
  State<imageList> createState() => _imageListState();
}

class _imageListState extends State<imageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check your File")),
      body: ListView.builder(
          itemCount: widget.storedFiles!.length,
          itemBuilder: (context, index) {
            final file = widget.storedFiles;
            return ListTile(
              title: Text("${file}"),
            );
          }),
    );
  }
}
