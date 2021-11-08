import 'package:defov_flutter/domains/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  const AuthUseCase(this._authRepository);

  Future<String> getUserToken() => _authRepository.getUserToken();
}
