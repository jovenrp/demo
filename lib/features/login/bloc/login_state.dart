import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrd/features/login/data/models/user_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState(
      {@Default(false) bool isLoading,
        @Default(false) bool hasError,
        @Default(false) bool isLoggedIn,
        UserModel? userModel,
        String? errorMessage,}) = _LoginState;
}
