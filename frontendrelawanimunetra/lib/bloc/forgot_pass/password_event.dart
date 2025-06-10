abstract class ForgotPasswordEvent {}

class SubmitForgotPassword extends ForgotPasswordEvent {
  final String email;

  SubmitForgotPassword(this.email);
}
