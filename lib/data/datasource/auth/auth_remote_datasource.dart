import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/core/utils/api_logger.dart';
import 'package:mini_project_alfath/data/datasource/auth/auth_local_datasource.dart';
import 'package:mini_project_alfath/data/model/get_cek_email_response.dart';
import 'package:mini_project_alfath/data/model/get_login_auth_response.dart';
import 'package:mini_project_alfath/data/model/get_register_response.dart';
import 'package:mini_project_alfath/data/model/get_sent_otp_verification_response.dart';
import 'package:mini_project_alfath/data/model/post_send_otp_response.dart';
import 'package:mini_project_alfath/data/model/request/login_request.dart';
import 'package:mini_project_alfath/data/model/request/register_request.dart';
import 'package:mini_project_alfath/data/service/lib/api_error_handler.dart';
import 'package:crypto/crypto.dart';

class AuthRemoteDatasource {
  final http.Client _client;
  final AuthLocalHiveDatasource _localDatasource;
  final baseUrl = FlavorConfig.instance.baseUrl;

  AuthRemoteDatasource({
    http.Client? client,
    required AuthLocalHiveDatasource localDatasource,
  }) : _client = client ?? http.Client(),
       _localDatasource = localDatasource;

  Future<Either<String, GetLoginAuthResponse>> login(
    PostLoginAuthRequest request,
  ) async {
    try {
      final url = Uri.parse('$baseUrl/login');

      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      ApiLogger.logResponse(
        url: url.toString(),
        statusCode: response.statusCode,
        responseBody: response.body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final authResponse = GetLoginAuthResponse.fromJson(responseBody);
        return Right(authResponse);
      } else {
        final errorMessage = ApiErrorHandler.mapError(response);
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(
        'Network error: Failed to connect to server - ${e.toString()}',
      );
    }
  }

  Future<Either<String, bool>> logout(String token) async {
    try {
      final url = Uri.parse('$baseUrl/auth/logout');

      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      ApiLogger.logResponse(
        url: url.toString(),
        statusCode: response.statusCode,
        responseBody: response.body,
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right(true);
      } else {
        return const Right(true);
      }
    } catch (e) {
      return const Right(true);
    }
  }

  Future<Either<String, CheckEmailResponse>> checkEmail(String email) async {
    try {
      final url = Uri.parse('$baseUrl/checkEmail');

      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email}),
      );

      // ApiLogger.logResponse(
      //   url: url.toString(),
      //   statusCode: response.statusCode,
      //   responseBody: response.body,
      // );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final authResponse = CheckEmailResponse.fromJson(responseBody);
        return Right(authResponse);
      } else {
        final errorMessage = ApiErrorHandler.mapError(response);
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(
        'Network error: Failed to connect to server - ${e.toString()}',
      );
    }
  }

  Future<Either<String, GetRegisterAuthResponse>> register(
    RegisterAuthRequest request,
    String role,
  ) async {
    try {
      var bytes = utf8.encode(role);
      var digest = sha256.convert(bytes);

      final url = Uri.parse('$baseUrl/register');

      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          "X-Role-Hash": digest.toString(),
        },
        body: jsonEncode(request.toJson()),
      );

      ApiLogger.logResponse(
        url: url.toString(),
        statusCode: response.statusCode,
        responseBody: response.body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final authResponse = GetRegisterAuthResponse.fromJson(responseBody);
        return Right(authResponse);
      } else {
        final errorMessage = ApiErrorHandler.mapError(response);
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(
        'Network error: Failed to connect to server - ${e.toString()}',
      );
    }
  }

  Future<Either<String, SendOtpResponse>> sendOTPEmail() async {
    try {
      final token = await _localDatasource.getTokenDirect();

      if (token == null || token.isEmpty) {
        return const Left('Token tidak ditemukan. Silakan login ulang.');
      }

      final url = Uri.parse('$baseUrl/sendOTPEmail');

      final response = await _client.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      ApiLogger.logResponse(
        url: url.toString(),
        statusCode: response.statusCode,
        responseBody: response.body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final authResponse = SendOtpResponse.fromJson(responseBody);
        return Right(authResponse);
      } else {
        final errorMessage = ApiErrorHandler.mapError(response);
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(
        'Network error: Failed to connect to server - ${e.toString()}',
      );
    }
  }

  Future<Either<String, SendOtpVerificationResponse>> verificationOTPEmail(
    String otp,
  ) async {
    try {
      final token = await _localDatasource.getTokenDirect();

      if (token == null || token.isEmpty) {
        return const Left('Token tidak ditemukan. Silakan login ulang.');
      }

      final url = Uri.parse('$baseUrl/verificationEmail');

      final response = await _client.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"verificationToken": otp}),
      );

      ApiLogger.logResponse(
        url: url.toString(),
        statusCode: response.statusCode,
        responseBody: response.body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final authResponse = SendOtpVerificationResponse.fromJson(responseBody);
        return Right(authResponse);
      } else {
        final errorMessage = ApiErrorHandler.mapError(response);
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(
        'Network error: Failed to connect to server - ${e.toString()}',
      );
    }
  }
}
