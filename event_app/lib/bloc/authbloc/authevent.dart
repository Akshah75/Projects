abstract class Authevent {}

class Authbuttonpressevent extends Authevent {
  final String? emailValue;
  final String? passwordValue;
  Authbuttonpressevent({this.emailValue, this.passwordValue});
}

class AuthTextChangeEvent extends Authevent {
  final String? email;
  final String? password;
  AuthTextChangeEvent(this.email, this.password);
}
