import 'package:dartz/dartz.dart';
import 'package:mini_project_alfath/data/datasource/auth/auth_local_datasource.dart';
import 'package:mini_project_alfath/data/datasource/auth/auth_remote_datasource.dart';
import 'package:mini_project_alfath/data/model/get_cek_email_response.dart';
import 'package:mini_project_alfath/data/model/get_login_auth_response.dart';
import 'package:mini_project_alfath/data/model/request/login_request.dart';

class AuthService {
  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalHiveDatasource _localDatasource;

  AuthService({
    AuthRemoteDatasource? remoteDatasource,
    AuthLocalHiveDatasource? localDatasource,
  }) : _remoteDatasource = remoteDatasource ?? AuthRemoteDatasource(),
       _localDatasource = localDatasource ?? AuthLocalHiveDatasource();

  Future<Either<String, GetLoginAuthResponse>> login(
    PostLoginAuthRequest request,
  ) async {
    final loginResult = await _remoteDatasource.login(request);

    return loginResult.fold(
      (error) {
        return Left(error);
      },
      (authResponse) async {
        final saveResult = await _localDatasource.saveAuthData(authResponse);
        return saveResult.fold(
          (error) {
            return Left(error);
          },
          (success) {
            return Right(authResponse);
          },
        );
      },
    );
  }

  Future<Either<String, bool>> logout() async {
    try {
      final token = await getAuthToken();

      if (token != null && token.isNotEmpty) {
        _remoteDatasource
            .logout(token)
            .then((_) {
              // Tidak perlu handle response karena sudah langsung clear local
            })
            .catchError((_) {
              // Ignore error karena yang penting clear local auth berhasil
            });
      }

      // await _localDatasource.resetOnboardingShown();
      final authResult = await _localDatasource.clearAuthData();

      if (authResult.isLeft()) {
        return authResult;
      }

      return const Right(true);
    } catch (e) {
      return Left('Error during logout: $e');
    }
  }

  Future<Either<String, CheckEmailResponse>> checkEmail(String email) async {
    try {
      final checkEmailResult = await _remoteDatasource.checkEmail(email);

      return checkEmailResult;
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }

  /// Check apakah user sudah login
  Future<bool> isLoggedIn() async {
    return await _localDatasource.isLoggedIn();
  }

  /// Get current user data
  Future<Either<String, User>> getCurrentUser() async {
    return await _localDatasource.getUser();
  }

  /// Get current token
  Future<Either<String, String>> getCurrentToken() async {
    return await _localDatasource.getToken();
  }

  /// Get complete auth data
  Future<Either<String, GetLoginAuthResponse>> getCurrentAuthData() async {
    return await _localDatasource.getAuthData();
  }

  /// Get token untuk authorization header (tanpa Either wrapper)
  Future<String?> getAuthToken() async {
    return await _localDatasource.getTokenDirect();
  }

  /// Quick check apakah ada token tersimpan
  Future<bool> hasToken() async {
    return await _localDatasource.hasToken();
  }

  /// Auto-login check untuk app initialization
  Future<Either<String, GetLoginAuthResponse>> autoLogin() async {
    final isLoggedIn = await _localDatasource.isLoggedIn();

    if (!isLoggedIn) {
      return const Left('User not logged in');
    }

    // Get saved auth data
    return await _localDatasource.getAuthData();
  }

  // /// Check if onboarding has been shown
  Future<bool> isOnboardingShown() async {
    return await _localDatasource.isOnboardingShown();
  }

  /// Mark onboarding as shown
  Future<Either<String, bool>> setOnboardingShown() async {
    return await _localDatasource.setOnboardingShown();
  }

  /// Dispose resources
  void dispose() {
    // _remoteDatasource.dispose();
  }
}
