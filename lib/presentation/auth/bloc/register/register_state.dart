part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _RegisterLoading;

  const factory RegisterState.success(
    GetRegisterAuthResponse authResponse,
  ) = _RegisterSuccess;

  const factory RegisterState.failed(String message) = _RegisterFailed;
}
