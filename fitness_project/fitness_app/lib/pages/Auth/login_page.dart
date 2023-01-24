import 'package:flutter/material.dart';

import 'loginscreen/bootom.dart';
import 'loginscreen/header.dart';
import 'loginscreen/mid.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        LoginHeader(),
        LoginMiddle(),
        LoginBottom(),
      ],
    ));
  }
}
