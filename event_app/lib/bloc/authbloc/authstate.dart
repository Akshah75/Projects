abstract class AuthState {}

class AuthIntialState extends AuthState {}

class AuthValidState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String? errorMessage;
  AuthErrorState({this.errorMessage});
}
