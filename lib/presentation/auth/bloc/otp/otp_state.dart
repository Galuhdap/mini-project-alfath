part of 'otp_bloc.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loading() = _Loading;

  const factory OtpState.success(SendOtpResponse sendEmailOtp) =
      _Success;

  const factory OtpState.failed(String message) = _Failed;
}
