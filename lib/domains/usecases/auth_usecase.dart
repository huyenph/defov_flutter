import 'package:defov_flutter/domains/repositories/auth_repository.dart';
import 'package:defov_flutter/test/album.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  const AuthUseCase(this._authRepository);

  Future<String> getUserToken() => _authRepository.getUserToken();

  Future<Album> fetchAlbum() => _authRepository.fetchAlbum();
}
