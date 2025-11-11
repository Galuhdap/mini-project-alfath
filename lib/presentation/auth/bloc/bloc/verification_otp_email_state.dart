part of 'verification_otp_email_bloc.dart';

@freezed
class VerificationOtpEmailState with _$VerificationOtpEmailState {
  const factory VerificationOtpEmailState.initial() = _Initial;
  const factory VerificationOtpEmailState.loading() = _Loading;

  const factory VerificationOtpEmailState.success(
    SendOtpVerificationResponse sendEmailOtp,
  ) = _Success;

  const factory VerificationOtpEmailState.failed(String message) = _Failed;
}
