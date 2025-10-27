// import 'dart:convert';

// import 'package:barberhub_app/config/flavor_config.dart';
// import 'package:barberhub_app/data/model/get_barber_shop_response.dart';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;

// class BarberShopRemoteDatasource {
//   BarberShopRemoteDatasource({http.Client? client})
//     : _client = client ?? http.Client();

//   final http.Client _client;
//   final baseUrl = FlavorConfig.instance.baseUrl;
//   Future<Either<String, GetBarberShopResponse>> getBarberShop() async {
//     try {
//       final uri = Uri.parse('$baseUrl/barber/shop');

//       final response = await _client.get(uri);

//       print(response.body);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseBody = jsonDecode(response.body);
//         return Right(GetBarberShopResponse.fromJson(responseBody));
//       }

//       final Map<String, dynamic>? errorBody = response.body.isNotEmpty
//           ? jsonDecode(response.body) as Map<String, dynamic>?
//           : null;

//       final errorMessage = _mapErrorMessage(response.statusCode, errorBody);
//       return Left(errorMessage);
//     } catch (e) {
//       return Left(
//         'Network error: Failed to fetch consumer report - ${e.toString()}',
//       );
//     }
//   }

//   String _mapErrorMessage(int statusCode, Map<String, dynamic>? errorBody) {
//     switch (statusCode) {
//       case 400:
//         return errorBody?['message'] ?? 'Bad request.';
//       case 401:
//         return 'Unauthorized. Please login again.';
//       case 403:
//         return 'Access forbidden. Please check your permissions.';
//       case 404:
//         return 'Resource not found.';
//       case 422:
//         if (errorBody != null) {
//           if (errorBody['message'] is String) {
//             return errorBody['message'] as String;
//           }
//           if (errorBody['errors'] is Map) {
//             final errors = errorBody['errors'] as Map;
//             if (errors.isNotEmpty) {
//               final firstKey = errors.keys.first;
//               final firstError = errors[firstKey];
//               if (firstError is List && firstError.isNotEmpty) {
//                 return firstError.first.toString();
//               }
//             }
//           }
//         }
//         return 'Validation error.';
//       case 429:
//         return 'Too many requests. Please try again later.';
//       case 500:
//         return 'Server error. Please try again later.';
//       default:
//         return 'Request failed with status: $statusCode';
//     }
//   }
// }
