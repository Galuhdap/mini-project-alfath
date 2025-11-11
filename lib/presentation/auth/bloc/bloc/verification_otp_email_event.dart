part of 'verification_otp_email_bloc.dart';

@freezed
class VerificationOtpEmailEvent with _$VerificationOtpEmailEvent {
  const factory VerificationOtpEmailEvent.started() = _Started;
   const factory VerificationOtpEmailEvent.verificationEmailOtp(String otp) = _VerificationEmailOtp;
}