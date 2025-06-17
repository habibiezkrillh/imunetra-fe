abstract class ResetPasswordEvent {}

class SubmitPassword extends ResetPasswordEvent {
  final String password;

  SubmitPassword(this.password);
}