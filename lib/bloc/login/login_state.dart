part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loggedIn(User user) = _LoggedIn;
  const factory LoginState.error(String message) = _Error;
}
