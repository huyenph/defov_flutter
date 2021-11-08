import 'package:dio/dio.dart';

class AuthApiService {
  final Dio dio;

  const AuthApiService({required this.dio});

  Future<Response<String>> getUserToken() async {
    return await dio.get('path');
  }
}