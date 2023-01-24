import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:security_app/Authentication/login.dart';
import 'package:security_app/Authentication/login_data.dart';

//
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //
  void loadUserInfo() async {
    String token = await getToken();
    // if (token == '') {
    //   Navigator.of(context).pushAndRemoveUntil(

    //       (route) => false);
    // }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
