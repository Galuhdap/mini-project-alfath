import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project_alfath/config/flavor_config.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';

class JobSeekerRemoteDatasource {
  JobSeekerRemoteDatasource({http.Client? client})
    : _client = client ?? http.Client();

  final http.Client _client;
  final baseUrl = FlavorConfig.instance.baseUrl;

  /// Ambil data pekerjaan aktif dari API jobseeker
  Future<Either<String, GetJobSeeker>> getActiveJobs({
    int page = 1,
    int? minimalGaji,
    int? maksimalGaji,
    String? search,
    String? jenis,
  }) async {
    try {
     // final uri = Uri.parse('$baseUrl/jobseeker/pekerjaan/getActivePekejaan?page=${page}&minimalGaji=${minimalGaji}&maksimalGaji=${maksimalGaji}&search=${search}&jenis=${jenis}');
      final uri = Uri.parse('$baseUrl/jobseeker/pekerjaan/getActivePekejaan')
          .replace(
            queryParameters: {
              'page': page.toString(),
              if (minimalGaji != null) 'minimalGaji': minimalGaji.toString(),
              if (maksimalGaji != null) 'maksimalGaji': maksimalGaji.toString(),
              if (search != null) 'search': search,
              if (jenis != null) 'jenis': jenis,
            },
          );

      final response = await _client.get(
        uri,
        headers: {
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wva2tsb2tlci5wYXJ0bmVyY29kaW5nLmNvbVwvYXBpXC9qb2JzZWVrZXJcL3Bla2VyamFhblwvZ2V0QWN0aXZlUGVrZWphYW4iLCJpYXQiOjE3NjE1MzQ4MTMsImV4cCI6MTc2MTgxNDAzOSwibmJmIjoxNzYxNzI3NjM5LCJqdGkiOiJYclV4WGFrNm5Ia044WlJ4Iiwic3ViIjoyLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.nB83Utvqk6JeFZhp2CXFuG-oaGjPyolGUpVdVKY5_OA', // <-- ini bagian penting
          'Content-Type': 'application/json',
        },
      );

      print('🔗 Request URL Remote: $uri');
      print('📦 Response Remote: ${response.body}');
      print('⚙️ minimal gaji Remote: ${minimalGaji}');
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        return Right(GetJobSeeker.fromJson(responseBody));
      }

      final Map<String, dynamic>? errorBody = response.body.isNotEmpty
          ? jsonDecode(response.body) as Map<String, dynamic>?
          : null;

      final errorMessage = _mapErrorMessage(response.statusCode, errorBody);
      return Left(errorMessage);
    } catch (e) {
      return Left(
        'Network error: Failed to fetch active jobs - ${e.toString()}',
      );
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
