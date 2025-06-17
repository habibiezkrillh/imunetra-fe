
import 'package:frontendtenagamedisimunetra/services/api_services.dart';
import 'package:frontendtenagamedisimunetra/services/resetpass_services.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(this.authService, {required ApiService apiService, required ApiService, required ApiService, required ApiService, required ApiService    });

  Future<bool> login({required String username, required String password}) async {
    return await authService.login(username, password);
  }

  Future<void> forgotPassword(String email) async {}

  Future resetPassword(String password) async {}
}
