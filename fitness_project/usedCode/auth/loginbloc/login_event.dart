import 'package:google_sign_in/google_sign_in.dart';

class LoginEvent {
  final googleSignIn = GoogleSignIn();
}

class GoogleLogin extends LoginEvent {}

class GoogleLogout extends LoginEvent {
  Future logout() => googleSignIn.disconnect();
}
