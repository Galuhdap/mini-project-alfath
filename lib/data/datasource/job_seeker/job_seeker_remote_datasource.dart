import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/data/model/get_detail_job_seeker_response.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';

class JobSeekerRemoteDatasource {
  JobSeekerRemoteDatasource({http.Client? client})
    : _client = client ?? http.Client();

  final http.Client _client;
  final baseUrl = FlavorConfig.instance.baseUrl;

  final String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wva2tsb2tlci5wYXJ0bmVyY29kaW5nLmNvbVwvYXBpXC9qb2JzZWVrZXJcL3Bla2VyamFhblwvZ2V0QWN0aXZlUGVrZWphYW4iLCJpYXQiOjE3NjE1MzQ4MTMsImV4cCI6MTc2MjI2NjMxMiwibmJmIjoxNzYyMTc5OTEyLCJqdGkiOiJiME1VUXp6YjBWdWRqdndOIiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.vGniwCv126gYhzG3Sd26XI7NN9jlDzyMpiOySppXCP8';
  Future<Either<String, GetJobSeeker>> getActiveJobs({
    int page = 1,
    int? minimalGaji,
    int? maksimalGaji,
    String? search,
    String? jenis,
    List<int>? tipe,
  }) async {
    try {
      // final String token =
      //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wva2tsb2tlci5wYXJ0bmVyY29kaW5nLmNvbVwvYXBpXC9sb2dpbiIsImlhdCI6MTc2MTk4MTI0MCwiZXhwIjoxNzYyMDY3NjQwLCJuYmYiOjE3NjE5ODEyNDAsImp0aSI6ImdtMDYxT3dJZWVnOFpuMjgiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.E5A1pBjTn6rJ-L6hCyZtRKnsinT0cXHqUgOYi49VWu4';
      final queryParameters = {
        'page': page.toString(),
        if (minimalGaji != null) 'minimalGaji': minimalGaji.toString(),
        if (maksimalGaji != null) 'maksimalGaji': maksimalGaji.toString(),
        if (search != null) 'search': search,
        if (jenis != null) 'jenis': jenis,
      };

      // 🔹 tambahkan tipe[i]
      if (tipe != null && tipe.isNotEmpty) {
        for (int i = 0; i < tipe.length; i++) {
          queryParameters['tipe[$i]'] = tipe[i].toString();
        }
      }

      final uri = Uri.parse(
        '$baseUrl/jobseeker/pekerjaan/getActivePekejaan',
      ).replace(queryParameters: queryParameters);

      final response = await _client.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token', // token kamu
          'Content-Type': 'application/json',
        },
      );

      // print('🔗 Request URL Remote: $uri');
      // print('response status code: ${response.statusCode}');
      // print('📦 Response Remote: ${response.body}');
      // print('⚙️ minimal gaji Remote: ${minimalGaji}');
      // print('error body code: ${response.body.isNotEmpty}');
      // print('tipe parameter: ${tipe}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final parsed = GetJobSeeker.fromJson(responseBody);

        // if (parsed.data.isEmpty) {
        //   //  print('ℹ️ Tidak ada data, tapi respons sukses');
        // }

        return Right(parsed);
      } else {
        final Map<String, dynamic>? errorBody = response.body.isNotEmpty
            ? jsonDecode(response.body) as Map<String, dynamic>?
            : null;
        final errorMessage = _mapErrorMessage(response.statusCode, errorBody);
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(
        'Network error: Failed to fetch active jobs - ${e.toString()}',
      );
    }
  }

  Future<Either<String, GetDetailJobSeeker>> getJobDetail(String id) async {
    try {
      final url = '$baseUrl/jobseeker/pekerjaan/getActivePekejaan/$id';
      final response = await _client.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print('🔗 Request URL Remote: $url');
      print('response status code: ${response.statusCode}');
      print('📦 Response Remote: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final detail = GetDetailJobSeeker.fromJson(body);
        return Right(detail);
      } else {
        return Left('Failed to load job detail: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Network error: ${e.toString()}');
    }
  }

  String _mapErrorMessage(int statusCode, Map<String, dynamic>? errorBody) {
    switch (statusCode) {
      case 400:
        return errorBody?['message'] ?? 'Bad request.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Access forbidden. Please check your permissions.';
      case 404:
        return 'Resource not found.';
      case 422:
        if (errorBody != null) {
          if (errorBody['message'] is String) {
            return errorBody['message'] as String;
          }
          if (errorBody['errors'] is Map) {
            final errors = errorBody['errors'] as Map;
            if (errors.isNotEmpty) {
              final firstKey = errors.keys.first;
              final firstError = errors[firstKey];
              if (firstError is List && firstError.isNotEmpty) {
                return firstError.first.toString();
              }
            }
          }
        }
        return 'Validation error.';
      case 429:
        return 'Too many requests. Please try again later.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'Request failed with status: $statusCode';
    }
  }
}
