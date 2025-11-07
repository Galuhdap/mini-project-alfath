import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:mini_project_alfath/data/model/get_login_auth_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalHiveDatasource {
  static const String _boxName = 'auth_box';
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'auth_user';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _onboardingShownKey = 'onboarding_shown';

  Future<Box> _openBox() async {
    final box = await Hive.openBox(_boxName);
    return box;
  }

  Future<Either<String, bool>> saveAuthData(
    GetLoginAuthResponse authResponse,
  ) async {
    try {
      final box = await _openBox();

      final token = authResponse.data.token;
      final user = authResponse.data.user.toJson();

      if (token.isEmpty) {
        return Left('Token kosong');
      }

      await box.put(_tokenKey, token);
      await box.put(_userKey, user);
      await box.put(_isLoggedInKey, true);

      await box.flush(); // pastikan tersimpan ke disk

      return const Right(true);
    } catch (e) {
      return Left('Error saving auth data: $e');
    }
  }

  Future<Either<String, bool>> saveToken(String token) async {
    try {
      final box = await _openBox();
      await box.put(_tokenKey, token);
      return const Right(true);
    } catch (e) {
      return Left('Error saving token: $e');
    }
  }

  Future<Either<String, String>> getToken() async {
    try {
      final box = await _openBox();
      final token = box.get(_tokenKey);
      if (token != null && token.isNotEmpty) {
        return Right(token);
      } else {
        return const Left('Token not found');
      }
    } catch (e) {
      return Left('Error getting token: $e');
    }
  }

  Future<Either<String, bool>> saveUser(User user) async {
    try {
      final box = await _openBox();
      await box.put(_userKey, jsonEncode(user.toJson()));
      return const Right(true);
    } catch (e) {
      return Left('Error saving user: $e');
    }
  }

  Map<String, dynamic> deepMap(Map<dynamic, dynamic> source) {
    final map = <String, dynamic>{};
    source.forEach((key, value) {
      final k = key.toString(); // pastikan key String
      if (value is Map) {
        map[k] = deepMap(Map<dynamic, dynamic>.from(value));
      } else if (value is List) {
        map[k] = value.map((e) {
          if (e is Map) return deepMap(Map<dynamic, dynamic>.from(e));
          return e;
        }).toList();
      } else {
        map[k] = value;
      }
    });
    return map;
  }

  Future<Either<String, User>> getUser() async {
    try {
      final box = await Hive.openBox('auth_box');
      final data = box.get('auth_user');
      // print(data);

      final userMap = deepMap(Map<dynamic, dynamic>.from(data));
      final user = User.fromJson(userMap);
      return Right(user);
    } catch (e) {
      return Left('Error getting user data: $e');
    }
  }

  Future<Either<String, bool>> setLoggedIn(bool isLoggedIn) async {
    try {
      final box = await _openBox();
      await box.put(_isLoggedInKey, isLoggedIn);
      return const Right(true);
    } catch (e) {
      return Left('Error saving login status: $e');
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final box = await _openBox();
      final isLoggedIn = box.get(_isLoggedInKey, defaultValue: false);
      // print('Local: $isLoggedIn');
      if (isLoggedIn == true) {
        final tokenResult = await getToken();

        return tokenResult.isRight();
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Either<String, GetLoginAuthResponse>> getAuthData() async {
    try {
      final tokenResult = await getToken();
      final userResult = await getUser();

      if (tokenResult.isLeft()) {
        return Left(tokenResult.fold((l) => l, (r) => ''));
      }

      if (userResult.isLeft()) {
        return Left(userResult.fold((l) => l, (r) => ''));
      }

      final token = tokenResult.getOrElse(() => '');
      final user = userResult.getOrElse(
        () => throw Exception('User not found'),
      );

      final data = Data(
        token: token,
        user: user,
        lokerNasional: 0,
        lokerInternasional: 0,
        expiresIn: 0,
        kelengkapanJobseeker: KelengkapanJobseeker(
          kelengkapan: Kelengkapan(terpenuhi: 0, total: 0),
          canApply: false,
          groupScores: GroupScores(
            informasiPribadi: false,
            dataRiwayat: false,
            skill: false,
            cv: false,
          ),
          details: Details(
            fotoProfile: false,
            alamat: false,
            tanggalLahir: false,
            phoneVerifiedAt: false,
            pengalamans: false,
            pendidikans: false,
            organisasis: false,
            userSkills: false,
            cv: false,
          ),
        ),
      );

      final meta = Meta(statusCode: 200, message: 'OK');
      final authResponse = GetLoginAuthResponse(meta: meta, data: data);
      return Right(authResponse);
    } catch (e) {
      return Left('Error getting auth data: $e');
    }
  }

  Future<Either<String, bool>> clearAuthData() async {
    try {
      final box = await _openBox();
      await box.delete(_tokenKey);
      await box.delete(_userKey);
      await box.put(_isLoggedInKey, false);
      return const Right(true);
    } catch (e) {
      return Left('Error clearing auth data: $e');
    }
  }

  Future<bool> hasToken() async {
    try {
      final box = await _openBox();
      final token = box.get(_tokenKey);
      return token != null && token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getTokenDirect() async {
    try {
      final box = await _openBox();
      return box.get(_tokenKey);
    } catch (e) {
      return null;
    }
  }

  Future<Either<String, bool>> setOnboardingShown() async {
    try {
      final box = await _openBox();
      await box.put(_onboardingShownKey, true);
      return const Right(true);
    } catch (e) {
      return Left('Error saving onboarding status: $e');
    }
  }

  Future<bool> isOnboardingShown() async {
    try {
      final box = await _openBox();
      return box.get(_onboardingShownKey, defaultValue: false);
    } catch (e) {
      return false;
    }
  }

  Future<void> resetOnboardingShown() async {
    final box = await _openBox();
    await box.put(_onboardingShownKey, false);
  }
}
