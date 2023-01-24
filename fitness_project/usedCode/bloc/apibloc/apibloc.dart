import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_bloc_state.dart';
import 'api_event.dart';

class AuthorizationBloc extends Bloc<AuthEvent, AuthState> {
  StreamSubscription? conectivitySubscription;
  AuthorizationBloc() : super(AuthIntialState()) {
    //

    on<AuthEvent>((event, emit) async {
      if (event is Goolelogevent) {
        emit(AuthLogInSate());
      } else {
        emit(AuthErrorSate());
      }
    });
  }
}
