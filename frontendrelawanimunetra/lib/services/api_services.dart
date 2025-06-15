class AuthService {
  // Simulasi login (ganti dengan request API nyata)
  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return username == 'admin' && password == 'admin';
  }

  // Simulasi forgot password
  Future<void> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email != "test@example.com") {
      throw Exception("Email tidak ditemukan");
    }
  }
}

class OTPService {
  Future<bool> sendOTP(String email) async {
    await Future.delayed(Duration(seconds: 1));
    return true; // simulasi sukses
  }

  Future<bool> verifyOTP(String otp) async {
    await Future.delayed(Duration(seconds: 1));
    return otp == "1234"; // contoh verifikasi
  }
}

