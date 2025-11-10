part of 'check_email_bloc.dart';

@freezed
class CheckEmailState with _$CheckEmailState {
  const factory CheckEmailState.initial() = _Initial;

  const factory CheckEmailState.loading() = _Loading;

  const factory CheckEmailState.success(CheckEmailResponse checkEmailResponse) =
      _Success;

  const factory CheckEmailState.failed(String message) = _Failed;
}
