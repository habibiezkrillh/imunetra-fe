abstract class OTPEvent {}

class StartTimer extends OTPEvent {}

class Tick extends OTPEvent {}

class ResendOTP extends OTPEvent {}

class SubmitOTP extends OTPEvent {
  final String otp;
  SubmitOTP(this.otp);
}
