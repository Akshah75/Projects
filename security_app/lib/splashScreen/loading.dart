import 'package:flutter/material.dart';
import 'package:security_app/Authentication/api_response.dart';
import 'package:security_app/Authentication/login.dart';
import 'package:security_app/Authentication/login_data.dart';

//
class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  void _LoadingInfo() async {
    String token = await getToken();
    if (token == '') {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginUserPage.routeName, (route) => false);
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(

              // width: double.infinity,
              child: const CircularProgressIndicator()),
        ),
      ),
    );
  }
}
