import 'package:flutter/material.dart';

class Stacks extends StatelessWidget {
  const Stacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: double.infinity, height: 200, color: Colors.green));
  }
}
