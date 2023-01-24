import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/Authentication/login.dart';
import 'package:security_app/constent.dart';

//
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
  static const routeName = '/forgetpasswordpage';
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          // color: const Color.fromARGB(227, 211, 207, 207),
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
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: const Text(
                          'Entre the registred email address of your account',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: emailController,
                          // cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null),
                      const SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: forgetPassword,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              'Send',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> forgetPassword() async {
    Map<String, String> headers = {
      "Accept": 'application/json',
    };
    final response = await http
        .post(Uri.parse("${basedUrl}forgotpassword"), headers: headers, body: {
      'email': emailController.text,
    });
    switch (response.statusCode) {
      case 200:
        print(response.body);
        final successMessage = jsonDecode(response.body)['message'];
        showSuccesMessage(successMessage);
        gotoLoginPage();
        break;
      case 422:
        final erorMessage = jsonDecode(response.body)['message'];
        errorMessageShow(erorMessage);
        break;
    }
  }

///////////////////////////////////////////////////////////////////////////////
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

  void showSuccesMessage(succes) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        '$succes',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void gotoLoginPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginUserPage.routeName, (route) => false);
  }
}
