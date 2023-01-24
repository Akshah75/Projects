import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:security_app/Authentication/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:security_app/constent.dart';
import 'package:http/http.dart' as http;
import '../splashScreen/loading.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
  static const routeName = '/registerPage';
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
// intial value
  String? name = '';
  String? email = '';
  int? mobile = 0;
  String? address = '';
  String? password = '';
  String? confirmpassword = '';
  bool isPasswordVisible = true;
  bool isloading = false;
  // text editing controllers
  final nameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    signUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(227, 211, 207, 207),
      appBar: AppBar(
        title: const Text('Forest Department'),
      ),
      body: Center(
        child: Card(
          // elevation: MediaQuery.of(context).devicePixelRatio,
          elevation: 100,
          color: const Color.fromRGBO(255, 255, 255, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        key: const ValueKey('Name'),
                        onSaved: (value) {
                          name = value;
                        },
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          // prefixIcon: ,
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty || val.length < 2) {
                            return 'Enter your Name';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        key: const ValueKey('Mobile No'),
                        onSaved: (val) {
                          mobile = int.parse(val.toString());
                        },
                        keyboardType: TextInputType.phone,
                        controller: mobileNoController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.mobile_friendly),
                          labelText: "Mobile No",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty || val.length < 10) {
                            return 'Enter your mobile number';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        key: const ValueKey('Email'),
                        onSaved: (val) {
                          email = val;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          // prefixIcon: const Icon(Icons.email),
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
                    TextFormField(
                      key: const ValueKey('Address'),

                      onSaved: (val) {
                        address = val;
                      },
                      controller: addressController,
                      textInputAction: TextInputAction.done,
                      // cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'address',
                      ),

                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 7
                          ? 'Enter your Address charaters'
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: const ValueKey('Password'),

                      onSaved: (val) {
                        password = val;
                      },
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      // cursorColor: Colors.white,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Password',
                      ),

                      obscureText: isPasswordVisible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min 6 charaters'
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        key: const ValueKey('ConfirmPassword'),
                        onSaved: (val) {
                          confirmpassword = val;
                        },
                        controller: confirmPasswordController,
                        textInputAction: TextInputAction.done,
                        // cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Confirm Password',
                        ),
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Password does not match!';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: _submit,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(color: Colors.black),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: const Text(
                          'Alredy a user? Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              LoginUserPage.routeName, (route) => false),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  // void registre() {
  //   print("work on");
  //   Provider.of<Auth>(context, listen: false).singup(
  //       nameController.text,
  //       mobileNoController.text,
  //       addressController.text,
  //       emailController.text,
  //       passwordController.text,
  //       confirmPasswordController.text);
  // }
  //
  //
  void apiError(error) {
    final showSnackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "$error",
        ));
    ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
  }

  void succes(succes) {
    final showSnackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "$succes",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ));
    ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
  }

  void redirectToLoginPage() async {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginUserPage.routeName, (route) => false);
    });
  }

  //
  Future<void> signUp() async {
    try {
      final response =
          await http.post(Uri.parse('${basedUrl}register'), headers: {
        'Accept': 'application/json'
      }, body: {
        'name': nameController.text,
        'address': addressController.text,
        'mobile': mobileNoController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'password_confirmation': confirmPasswordController.text,
      });

      switch (response.statusCode) {
        case 201:
          print("working");
          print(response.body);
          final registreSuccefully = " Registre Succefully";
          succes(registreSuccefully);
          redirectToLoginPage();

          break;
        case 422:
          final errors = jsonDecode(response.body)['message'];
          apiError(errors);
          Navigator.of(context).pushNamed(UserRegister.routeName);
          break;
      }
    } catch (e) {
      final error = "something went wrong";
      print(error);
    }
  }
  //

  // Future<void> LoginPage() async {
  //   Timer(const Duration(seconds: 2), () {
  //     setState(() {
  //       isloading = false;
  //     });
  //   });
  // }

  /////////////////////////////////////////////////////////////////////////////
  //registre user//
  // Future<void> registre() async {
  //   ApiResponse response = await getUserRegistreDetail(
  //       nameController.text,
  //       mobileNoController.text,
  //       emailController.text,
  //       addressController.text,
  //       passwordController.text);
  //   print(response.data);
  //   if (response.error == null) {
  //     final success = "RegistreSuccefully";
  //     apiError(success);
  //     redirectToLoginPage();
  //   } else {
  //     apiError(response.error);
  //   }
  // }
}
