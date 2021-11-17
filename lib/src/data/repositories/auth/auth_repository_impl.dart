import 'package:defov_flutter/src/data/datasources/local/shared_preferences_manager.dart';
import 'package:defov_flutter/src/data/datasources/remote/auth/auth_api_service.dart';
import 'package:defov_flutter/src/domains/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;
  final SharedPreferencesManager _prefsManager;

  AuthRepositoryImpl(this._authApiService, this._prefsManager);

  @override
  Future<String> getUserToken() async {
    Response<String> response = await _authApiService.getUserToken();
    return response.data!;
  }
}