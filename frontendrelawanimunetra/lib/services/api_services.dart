import 'dart:io';

class AuthService {
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

  Future registerRelawan({required String nama, required String email, required String katasandi, required String kota, required String telepon, required String alamat, required String tanggallahir, File? ktpImage}) async {}

  Future register({required String nama, required String email, required String password, required String kota, required String telepon, required String tanggalLahir, required String alamat, required String ktpPath}) async {}
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





