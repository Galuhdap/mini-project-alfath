import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/core/utils/api_logger.dart';
import 'package:mini_project_alfath/data/model/get_cek_email_response.dart';
import 'package:mini_project_alfath/data/model/get_login_auth_response.dart';
import 'package:mini_project_alfath/data/model/request/login_request.dart';
import 'package:mini_project_alfath/data/service/lib/api_error_handler.dart';

class AuthRemoteDatasource {
  final http.Client _client;
  final baseUrl = FlavorConfig.instance.baseUrl;

  AuthRemoteDatasource({http.Client? client})
    : _client = client ?? http.Client();

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
        print('Auth Response : $authResponse');
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
}
