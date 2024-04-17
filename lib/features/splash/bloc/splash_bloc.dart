import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState());

  void loadSplashScreen() async {
    emit(state.copyWith(isLoading: true));

    Timer(const Duration(milliseconds: 1500), () {
      emit(state.copyWith(isLoading: false));
    });
  }
}
