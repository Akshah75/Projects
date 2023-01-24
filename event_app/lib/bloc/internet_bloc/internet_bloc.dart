import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';
import 'intrenet_event.dart';

class IntrenetBloc extends Bloc<IntrenetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  IntrenetBloc() : super(IntrenetIntialState()) {
    on<InterNetGainedEvent>(
      (event, emit) {
        emit(IntrenetGainedState());
      },
    );
    on<IntrenetLossEvent>(
      (event, emit) {
        emit(IntrenetLossState());
      },
    );
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (result) {
        print(result);
        // if (result == ConnectivityResult.mobile ||
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          add(InterNetGainedEvent());
        } else {
          add(IntrenetLossEvent());
        }
      },
    );
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
