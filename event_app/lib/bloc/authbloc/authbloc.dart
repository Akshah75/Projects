import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authevent.dart';
import 'authstate.dart';

class AuthBloc extends Bloc<Authevent, AuthState> {
  AuthBloc() : super(AuthIntialState()) {
    on<AuthTextChangeEvent>(
      (event, emit) {
        if (EmailValidator.validate(event.email.toString()) == false) {
          emit(
            AuthErrorState(errorMessage: "Something wrong on email filed"),
          );
        } else if (event.password == '' || event.password!.length <= 5) {
          emit(
            AuthErrorState(errorMessage: "Something wrong on password filed"),
          );
        } else {
          emit(AuthValidState());
        }
      },
    );
    on<Authbuttonpressevent>(
      (event, emit) {
        emit(AuthLoadingState());
      },
    );
  }
}
