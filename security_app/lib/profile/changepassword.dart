import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:security_app/constent.dart';
import "package:http/http.dart" as http;
import '../Authentication/login_data.dart';

//
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final savePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 100,
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Form(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: passwordController,
                    // cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  // validator: (email) =>
                  //     email != null && !EmailValidator.validate(email)
                  //         ? 'Enter a valid email'
                  //         : null),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: newPasswordController,
                    // cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Create password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: savePasswordController,
                    // cursorColor: Colors.white,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: changePassword,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          'Change password',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> changePassword() async {
    String token = await getToken();
    print(token);
    final response =
        await http.post(Uri.parse('${basedUrl}password'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      "current_password": passwordController.text,
      "password": newPasswordController.text,
      "password_confirmation": savePasswordController.text
    });
    switch (response.statusCode) {
      case 200:
        print(response.body);
        final passwordchange = jsonDecode(response.body)['message'];
        showSuccesMessage(passwordchange);
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        break;
      case 422:
        final passwordError = jsonDecode(response.body)['message'];
        print(passwordError);
        errorMessageShow(passwordError);
        break;
      default:
    }
  }

  ////////////////
  void errorMessageShow(error) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        '$error',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSuccesMessage(error) {
    final snackBar = SnackBar(
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.green,
        content: Container(
          child: Text(
            '$error',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
