import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/post_send_otp_response.dart';
import 'package:mini_project_alfath/data/service/auth_service.dart';

part 'otp_event.dart';
part 'otp_state.dart';
part 'otp_bloc.freezed.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthService _authService;

  OtpBloc({AuthService? authService})
    : _authService = authService ?? AuthService(),
      super(const OtpState.initial()) {
    on<_SendEmailOtp>(_onCheckEmailRequested);
  }

  Future<void> _onCheckEmailRequested(
    _SendEmailOtp event,
    Emitter<OtpState> emit,
  ) async {
    emit(const OtpState.loading());
    try {
      final result = await _authService.sendOTPEmail();

      result.fold(
        (error) => emit(OtpState.failed(error)),
        (authResponse) => emit(OtpState.success(authResponse)),
      );
    } catch (e) {
      emit(OtpState.failed('Unexpected error: ${e.toString()}'));
    }
  }
}
