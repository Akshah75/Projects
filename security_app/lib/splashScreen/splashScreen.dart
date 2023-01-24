import 'package:flutter/material.dart';
import 'package:security_app/Authentication/login.dart';

//
class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  //
  void initState() {
    super.initState();
    _navigatedHome();
  }

  //
  _navigatedHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginUserPage()));
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: Center(
        child: Container(
          child: const Text(
            'MANGROVES',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 4.0),
          ),
        ),
      ),
    );
  }
}
