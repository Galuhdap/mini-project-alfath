import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/get_sent_otp_verification_response.dart';
import 'package:mini_project_alfath/data/service/auth_service.dart';

part 'verification_otp_email_event.dart';
part 'verification_otp_email_state.dart';
part 'verification_otp_email_bloc.freezed.dart';

class VerificationOtpEmailBloc
    extends Bloc<VerificationOtpEmailEvent, VerificationOtpEmailState> {
  final AuthService _authService;

  VerificationOtpEmailBloc({AuthService? authService})
    : _authService = authService ?? AuthService(),
      super(const VerificationOtpEmailState.initial()) {
    on<_VerificationEmailOtp>(_onCheckEmailRequested);
  }

  Future<void> _onCheckEmailRequested(
    _VerificationEmailOtp event,
    Emitter<VerificationOtpEmailState> emit,
  ) async {
    emit(const VerificationOtpEmailState.loading());
    try {
      final result = await _authService.verificationOTPEmail(
        event.otp
      );

      result.fold(
        (error) => emit(VerificationOtpEmailState.failed(error)),
        (authResponse) => emit(VerificationOtpEmailState.success(authResponse)),
      );
    } catch (e) {
      emit(
        VerificationOtpEmailState.failed('Unexpected error: ${e.toString()}'),
      );
    }
  }
}
