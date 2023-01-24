import 'package:flutter/material.dart';

//
class OldPage extends StatefulWidget {
  const OldPage({Key? key}) : super(key: key);

  @override
  State<OldPage> createState() => _OldPageState();
}

class _OldPageState extends State<OldPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        Padding(padding: EdgeInsets.all(8.0)),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("new"),
          ],
        ),
      ],
    ));
  }
}
