import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/data/model/get_login_auth_response.dart';
import 'package:mini_project_alfath/data/model/request/login_request.dart';

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

      //final box = await Hive.openBox('auth_box');
      // print('Auth box contents: ${box.toMap()}');

      // print('🔗 Request URL Remote: $url');
      // print('response status code: ${response.statusCode}');
      // print('📦 Response Remote: ${response.body}');
      // print('error body code: ${response.body.isNotEmpty}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final authResponse = GetLoginAuthResponse.fromJson(responseBody);
        return Right(authResponse);
      } else {
        // Handle different error status codes
        final Map<String, dynamic>? errorBody = response.body.isNotEmpty
            ? jsonDecode(response.body)
            : null;

        String errorMessage = 'Login failed';

        switch (response.statusCode) {
          case 400:
            errorMessage = 'Bad request. Please check your input.';
            break;
          case 401:
            errorMessage = 'Invalid email or password.';
            break;
          case 422:
            errorMessage = errorBody?['message'] ?? 'Validation error.';
            break;
          case 500:
            errorMessage = 'Server error. Please try again later.';
            break;
          default:
            errorMessage = 'Login failed with status: ${response.statusCode}';
        }

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
      print('ini Response: $response');

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right(true);
      } else {
        // Meskipun API logout gagal, tetap return success karena yang penting clear local auth
        return const Right(true);
      }
    } catch (e) {
      // Meskipun ada network error, tetap return success karena yang penting clear local auth
      return const Right(true);
    }
  }
}
