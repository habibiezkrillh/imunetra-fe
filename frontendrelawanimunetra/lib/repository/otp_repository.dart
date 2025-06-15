
import 'package:frontendtenagamedisimunetra/services/api_services.dart';

class OTPRepository {
  final OTPService _otpService;

  OTPRepository(this._otpService);

  Future<bool> sendOTP(String email) => _otpService.sendOTP(email);

  Future<bool> verifyOTP(String otp) => _otpService.verifyOTP(otp);
}
