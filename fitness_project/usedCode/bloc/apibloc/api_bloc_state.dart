abstract class AuthState {}

class AuthIntialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLogInSate extends AuthState {
  String? userName;
  String? url;
  AuthLogInSate({this.userName, this.url});
}

class AuthLogOutSate extends AuthState {}

class AuthErrorSate extends AuthState {}
