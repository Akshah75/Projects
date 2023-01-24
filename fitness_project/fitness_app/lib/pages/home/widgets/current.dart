import 'package:flutter/material.dart';

//
class CurrentProgram extends StatelessWidget {
  const CurrentProgram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          // color: Colors.yellow,
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/detail');
            },
            child: const Text("Google fit data"),
          ),
        ),
      ],
    );
  }
}
