import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/get_register_response.dart';
import 'package:mini_project_alfath/data/model/request/register_request.dart';
import 'package:mini_project_alfath/data/service/auth_service.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService _authService;

  RegisterBloc({AuthService? authService})
    : _authService = authService ?? AuthService(),
      super(const RegisterState.initial()) {
    on<_RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onRegisterRequested(
    _RegisterRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState.loading());
    try {
      final loginRequest = RegisterAuthRequest(
        email: event.request.email,
        name: event.request.name,
        password: event.request.password,
        phoneNumber: event.request.phoneNumber,
      );

      final result = await _authService.register(loginRequest);

      result.fold(
        (error) => emit(RegisterState.failed(error)),
        (authResponse) => emit(RegisterState.success(authResponse)),
      );
    } catch (e) {
      emit(RegisterState.failed('Unexpected error: ${e.toString()}'));
    }
  }
}
