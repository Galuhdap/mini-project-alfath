part of 'check_email_bloc.dart';

@freezed
class CheckEmailEvent with _$CheckEmailEvent {
  const factory CheckEmailEvent.started() = _Started;
  const factory CheckEmailEvent.checkEmailRequested({required String email}) =
      _CheckEmailRequested;
}
