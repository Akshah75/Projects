// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../tec/image_priview.dart';

class AddImageScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('add new image')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  SizedBox(
                    height: 40,
                  ),
                  ImageInpute(),
                ],
              ),
            ),
          )),
          RaisedButton.icon(
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('add image'),
          )
        ],
      ),
    );
  }
  //

}
