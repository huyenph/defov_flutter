import 'package:defov_flutter/test/album.dart';

abstract class AuthRepository {
  Future<String> getUserToken();
  Future<Album> fetchAlbum();
}