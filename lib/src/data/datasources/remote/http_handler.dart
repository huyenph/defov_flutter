import 'package:defov_flutter/src/data/datasources/remote/rest_api_factory.dart';
import 'package:defov_flutter/src/data/datasources/remote/token_expired_handler.dart';
import 'package:dio/dio.dart';

class HttpHandler implements RestApiFactoryListener {
  final TokenExpiredHandler _tokenExpiredHandler;

  const HttpHandler(this._tokenExpiredHandler);

  @override
  void onResponse(Response response) {}

  @override
  void onError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.response:
        final statusCode = error.response!.statusCode;
        if (statusCode == 401 || statusCode == 416) {
          _tokenExpiredHandler.call(statusCode == 401
              ? TokenType.tokenExpired
              : TokenType.anotherDevice);
        } else if (statusCode == 403) {}
        break;
      default:
        break;
    }
  }

// Future<T> call<T>(Future<Response<T>> requestFuture) async {
//   Response<T> response = await requestFuture.timeout(
//     const Duration(seconds: 30),
//     onTimeout: () {
//
//     },
//   );
// }
//
// T _handlerResponse<T>(Response<T> response) {
//   if (response.statusCode == 401 || response.statusCode == 416) {
//     _tokenExpiredHandler.call(response.statusCode == 401
//         ? TokenType.tokenExpired
//         : TokenType.anotherDevice);
//   }
//   if (response.statusCode == 403) {}
// }
}
