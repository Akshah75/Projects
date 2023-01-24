import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final googleSignIn = GoogleSignIn();
  LoginBloc() : super(LoginIntialState()) {
    on<GoogleLogin>(
      (event, emit) {
        emit(LogInState());
      },
    );
    on<GoogleLogout>(
      (event, emit) {
        emit(LogOutState());
      },
    );

    //
  }
}
