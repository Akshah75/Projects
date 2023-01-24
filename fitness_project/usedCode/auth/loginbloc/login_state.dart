import 'package:google_sign_in/google_sign_in.dart';

class LoginState {
  final googleSignIn = GoogleSignIn();
}

class LoginIntialState extends LoginState {}

class LogInState extends LoginState {
  Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
}

class LoggedState extends LoginState {}

class LogOutState extends LoginState {
  logout() => googleSignIn.disconnect();
}

class LoginErrorState extends LoginState {
  String? error;
  LoginErrorState({this.error});
}
