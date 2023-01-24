import 'package:fitness_app/bloc/apibloc/api_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  final googleSignIn = GoogleSignIn();
  AuthCubit() : super(AuthIntialState());

  Future<GoogleSignInAccount?> login() {
    emit(AuthLogInSate());
    return googleSignIn.signIn();
  }

  Future logout() => googleSignIn.disconnect();
}
