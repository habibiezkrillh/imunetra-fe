import 'package:frontendtenagamedisimunetra/services/resetpass_services.dart';


class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<bool> resetPassword(String newPassword) {
    return apiService.resetPassword(newPassword);
  }
}