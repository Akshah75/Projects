// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:security_app/Authentication/forget_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Authentication/user_data.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:security_app/Authentication/api_response.dart';
import 'package:security_app/Authentication/login_data.dart';
import 'package:security_app/Authentication/register.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:security_app/constent.dart';
import 'package:security_app/device/device_info.dart';
import '../public_user/home.dart';
import '../device/info_ip.dart';
import './api_response.dart';

//
class LoginUserPage extends StatefulWidget {
  const LoginUserPage({Key? key}) : super(key: key);
  @override
  State<LoginUserPage> createState() => _LoginUserPageState();
  static const routeName = '/loginPage';
}

//
class _LoginUserPageState extends State<LoginUserPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final tokenStorage = const FlutterSecureStorage();
  bool isloading = false;
  bool isPasswordVisible = true;
  // String? token;
  Map<String, dynamic> map = {};

//
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Future<void> init() async {
    final ipAdress = await IpInfoApi.getIpAdress();
    final phone = await DeviceInfoApi.getPhoneInfo();
    final phoneVersion = await DeviceInfoApi.getPhoneVersion();
    // final operatingSystem = await DeviceInfoApi.getOperatingSystem();
    // print(operatingSystem);
    if (!mounted) return;
    setState(() => map = {
          'Ip Address': ipAdress,
          'Phone': phone,
          'Phone Version': phoneVersion,
        });
    print(map);
  }

//
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    login();
    // login();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(227, 211, 207, 207),
        appBar: AppBar(title: const Text('Forest Deparment ')),
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
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
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
                      TextFormField(
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
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                      RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: _submit,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
///////////////////////////////////////////////////////////////////////////////
                      Column(children: [
                        Container(
                          // margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                onTap: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        UserRegister.routeName,
                                        (route) => false),
                              ),
                              GestureDetector(
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(ForgetPassword.routeName);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Disclaimer :"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "I understand that my personal information will not be shared with any person or agency.")
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  Future<void> login() async {
    print('work?');
    String token = await getToken();
    String name = await getname();
    ApiResponse response =
        await getUserDetail(emailController.text, passwordController.text);
    print(response.data);

    if (response.error == null) {
      _saveData(response.data as User);
    } else {
      final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            '${response.error}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _saveData(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setString('token', user.token ?? '');
    await pref.setString('name', user.name ?? '');
    await pref.setString('email', user.email ?? '');
    await pref.setInt('user_type', user.usertype ?? 0);
    await pref.setInt('id', user.id ?? 0);
    final usertype = await getUserType();
    if (usertype == publicUser) {
      Navigator.of(context).pushNamed(HomeUserScreen.routeName);
    }
  }
}
