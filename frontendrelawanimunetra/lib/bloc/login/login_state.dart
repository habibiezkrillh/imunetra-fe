
late final String? message; // Tambahkan ini

class LoginState {
  final String username;
  final String password;
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginState({
    required this.username,
    required this.password,
    required this.isUsernameValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure, required message,
  });

  factory LoginState.initial() => LoginState(
  username: '',
  password: '',
  isUsernameValid: true,
  isPasswordValid: true,
  isSubmitting: false,
  isSuccess: false,
  isFailure: false,
  message: null,
);

  get message => null;

LoginState copyWith({
  String? username,
  String? password,
  bool? isUsernameValid,
  bool? isPasswordValid,
  bool? isSubmitting,
  bool? isSuccess,
  bool? isFailure,
  String? message, // Tambahkan ini
}) {
  return LoginState(
    username: username ?? this.username,
    password: password ?? this.password,
    isUsernameValid: isUsernameValid ?? this.isUsernameValid,
    isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    isSubmitting: isSubmitting ?? this.isSubmitting,
    isSuccess: isSuccess ?? this.isSuccess,
    isFailure: isFailure ?? this.isFailure,
    message: message ?? this.message,
  );
}
}