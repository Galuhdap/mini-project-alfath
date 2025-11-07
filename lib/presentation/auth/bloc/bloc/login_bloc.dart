import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/get_login_auth_response.dart';
import 'package:mini_project_alfath/data/model/request/login_request.dart';
import 'package:mini_project_alfath/data/service/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;

  LoginBloc({AuthService? authService})
    : _authService = authService ?? AuthService(),
      super(const LoginState.initial()) {
    on<_LoginRequested>(_onLoginRequested);
    on<_AutoLoginRequested>(_onAutoLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
    _LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());
    try {
      final loginRequest = PostLoginAuthRequest(
        email: event.email,
        password: event.password,
      );

      final result = await _authService.login(loginRequest);

      result.fold(
        (error) => emit(LoginState.failed(error)),
        (authResponse) => emit(LoginState.success(authResponse)),
      );
    } catch (e) {
      emit(LoginState.failed('Unexpected error: ${e.toString()}'));
    }
  }

  Future<void> _onAutoLoginRequested(
    _AutoLoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());
    try {
      final result = await _authService.autoLogin();

      result.fold(
        (error) {
          emit(LoginState.failed(error));
        },
        (authResponse) {
          emit(LoginState.success(authResponse));
        },
      );
    } catch (e) {
      emit(LoginState.failed('Unexpected error: ${e.toString()}'));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());

    try {
      final result = await _authService.logout();

      result.fold(
        (error) => emit(LoginState.failed(error)),
        (success) => emit(const LoginState.unauthenticated()),
      );
    } catch (e) {
      emit(LoginState.failed('Logout failed: ${e.toString()}'));
    }
  }
}
