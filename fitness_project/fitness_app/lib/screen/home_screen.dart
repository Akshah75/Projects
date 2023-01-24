import 'package:fitness_app/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen")),
      body: Container(
        padding: const EdgeInsets.only(right: 19, left: 19),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    signIn(context);
                  },
                  child: const Center(
                    child: Text("Google"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn(context) async {
    final user = await GoogleSignInApi.login();
    print(user);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => Profile(
              user: user,
            )),
      ),
    );
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.disconnect();
}
