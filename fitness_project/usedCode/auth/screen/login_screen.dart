import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../loginbloc/login_bloc.dart';
import '../loginbloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("login"),
        ),
        body: Column(
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  child: const Text("google"),
                  onPressed: () {
                    if (state is LogInState) {
                      // Future<GoogleSignInAccount?> login() =>
                      //     googleSignIn.signIn();
                    }
                    print("log in");
                  },
                );
              },
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  child: const Text("log out"),
                  onPressed: () {
                    if (state is LogOutState) {
                      state.logout();
                    }
                    print("log out");
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
