import 'package:defov_flutter/test/album.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final Dio dio;

  const AuthApiService({required this.dio});

  Future<Response<String>> getUserToken() async {
    return await dio.get('path');
  }

  Future<Response<Album>> fetchAlbum() async {
    return await dio.get('https://jsonplaceholder.typicode.com/albums/1');
  }
}