
import 'package:frontendtenagamedisimunetra/services/api_services.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(this.authService);

  Future<bool> login({required String username, required String password}) async {
    return await authService.login(username, password);
  }

  Future<void> forgotPassword(String email) async {}
}
