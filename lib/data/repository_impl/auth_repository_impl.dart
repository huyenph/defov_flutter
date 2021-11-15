import 'package:defov_flutter/data/local/shared_preferences_manager.dart';
import 'package:defov_flutter/data/remote/auth/auth_api_service.dart';
import 'package:defov_flutter/domains/repositories/auth_repository.dart';
import 'package:defov_flutter/test/album.dart';
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

  @override
  Future<Album> fetchAlbum() async {
    Response<Album> response = await _authApiService.fetchAlbum();
    return response.data!;
  }
}