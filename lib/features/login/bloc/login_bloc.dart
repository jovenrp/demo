import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:nrd/features/login/data/models/user_model.dart';

import '../domain/repositories/login_repository.dart';
import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc({required this.loginRepository,}) : super(LoginState());

  final LoginRepository loginRepository;

  Future<void> login({required String username, required String password}) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    final Response result = await loginRepository.login(username: username, password: password);

    if (result.statusCode == 200) {
      //valid credentials
      UserModel user = UserModel.fromJson(jsonDecode(result.body) as Map<String, dynamic>);
      print('asds ${user.email} ${user.firstname} ${user.lastname}');
      emit(state.copyWith(isLoading: false, hasError: false, userModel: user, isLoggedIn: true));
    } else {
      //invalid credentials
      emit(state.copyWith(isLoading: false, hasError: true));
    }

  }
}