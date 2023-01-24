import 'package:event_app/bloc/authbloc/authbloc.dart';
import 'package:event_app/bloc/authbloc/authevent.dart';
import 'package:event_app/bloc/authbloc/authstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  final TextEditingController emailControlar = TextEditingController();
  final TextEditingController passwordControlar = TextEditingController();
  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthErrorState) {
                      return Text(state.errorMessage.toString());
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailControlar,
                  onChanged: (val) {
                    BlocProvider.of<AuthBloc>(context).add(AuthTextChangeEvent(
                        emailControlar.text, passwordControlar.text));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordControlar,
                  onChanged: (val) {
                    BlocProvider.of<AuthBloc>(context).add(AuthTextChangeEvent(
                        emailControlar.text, passwordControlar.text));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CupertinoButton(
                      color:
                          state is AuthValidState ? Colors.blue : Colors.grey,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                            Authbuttonpressevent(
                                emailValue: emailControlar.text,
                                passwordValue: passwordControlar.text));
                      },
                      child: const Text("Log in"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
