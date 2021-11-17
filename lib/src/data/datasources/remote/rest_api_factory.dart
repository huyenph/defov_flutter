import 'package:defov_flutter/src/config/app_config.dart';
import 'package:defov_flutter/src/data/datasources/local/shared_preferences_manager.dart';
import 'package:defov_flutter/src/data/datasources/remote/auth/auth_api_service.dart';
import 'package:dio/dio.dart';

abstract class RestApiFactoryListener {
  void onResponse(Response response);

  void onError(DioError error);
}

class RestApiFactory {
  static const int timeOut = 5000;
  static Dio? _dio;

  final SharedPreferencesManager _prefsManager;
  final RestApiFactoryListener _listener;

  const RestApiFactory(this._listener, this._prefsManager);

  Dio _createDioClient() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) async {
            return await requestInterceptor(options);
          },
          onResponse: (
            Response response,
            ResponseInterceptorHandler handler,
          ) async {
            return _listener.onResponse(response);
          },
          onError: (
            DioError error,
            ErrorInterceptorHandler handler,
          ) async {
            return _listener.onError(error);
          },
        ),
      );
      _dio!.interceptors.add(
        LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }
    return _dio!;
  }

  dynamic requestInterceptor(RequestOptions options) async {
    final token = await _prefsManager.token;
    Map<String, String> headers;
    if (token.isNotEmpty) {
      headers = {
        'Content-type': 'Application/json',
        'Authorization': 'Bearer $token',
        'Accept': '*/*',
      };
    } else {
      headers = {
        'Content-type': 'Application/json',
        'Accept': '*/*',
      };
    }
    options.baseUrl = AppConfig.instance!.rootUrl();
    options.headers.addAll(headers);
    options.connectTimeout = timeOut;
    options.receiveTimeout = timeOut;
    return options;
  }

  AuthApiService provideAuthApi() => AuthApiService(dio: _createDioClient());
}
