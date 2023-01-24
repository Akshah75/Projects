import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthEvent {}

class Goolelogevent extends AuthEvent {
  final googleSignIn = GoogleSignIn();
  Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
}

// class GoogleLoginevent extends AuthEvent {

// }

class Goolelogoutevent extends AuthEvent {}
