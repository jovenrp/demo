import 'package:freezed_annotation/freezed_annotation.dart';


part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState({
    String? pinError,
    @Default(false) bool isLoading,
    String? token,
  }) = _SplashState;
}
