part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _LoginLoading;

  const factory LoginState.success(GetLoginAuthResponse authResponse) =
      _LoginSuccess;

  const factory LoginState.failed(String message) = _LoginFailed;

  const factory LoginState.authenticated(GetLoginAuthResponse authResponse) =
      _LoginAuthenticated;

  const factory LoginState.unauthenticated() = _LoginUnauthenticated;
}
