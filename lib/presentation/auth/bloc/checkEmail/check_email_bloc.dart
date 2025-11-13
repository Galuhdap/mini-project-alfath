import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/get_cek_email_response.dart';
import 'package:mini_project_alfath/data/service/auth_service.dart';

part 'check_email_event.dart';
part 'check_email_state.dart';
part 'check_email_bloc.freezed.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  final AuthService _authService;
  CheckEmailBloc({AuthService? authService})
    : _authService = authService ?? AuthService(),
      super(const CheckEmailState.initial()) {
    on<_CheckEmailRequested>(_onCheckEmailRequested);
  }

  Future<void> _onCheckEmailRequested(
    _CheckEmailRequested event,
    Emitter<CheckEmailState> emit,
  ) async {
    emit(const CheckEmailState.loading());
    try {
      final result = await _authService.checkEmail(event.email);

      result.fold(
        (error) => emit(CheckEmailState.failed(error)),
        (authResponse) => emit(CheckEmailState.success(authResponse)),
      );
    } catch (e) {
      emit(CheckEmailState.failed('Unexpected error: ${e.toString()}'));
    }
  }
}
