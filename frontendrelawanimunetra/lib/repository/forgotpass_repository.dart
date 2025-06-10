import 'package:frontendtenagamedisimunetra/services/api_services.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<void> forgotPassword(String email) {
    return _authService.forgotPassword(email);
  }
}
