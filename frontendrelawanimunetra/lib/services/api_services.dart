class AuthService {
  Future<bool> login(String username, String password) async {
    // Simulasi login (ganti dengan request API nyata)
    await Future.delayed(const Duration(seconds: 1));
    return username == 'admin' && password == 'admin';
  }
}
