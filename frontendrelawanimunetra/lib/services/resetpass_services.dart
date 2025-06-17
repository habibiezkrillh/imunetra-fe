class ApiService {
  Future<bool> resetPassword(String newPassword) async {
    await Future.delayed(Duration(seconds: 2));
    return newPassword.length >= 8 && RegExp(r'[0-9]').hasMatch(newPassword);
  }
}