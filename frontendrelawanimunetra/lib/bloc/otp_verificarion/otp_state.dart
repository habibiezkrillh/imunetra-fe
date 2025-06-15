class OTPState {
  final int remainingSeconds;
  final bool isVerified;
  final bool isLoading;

  OTPState({
    required this.remainingSeconds,
    required this.isVerified,
    required this.isLoading,
  });

  OTPState copyWith({
    int? remainingSeconds,
    bool? isVerified,
    bool? isLoading,
  }) {
    return OTPState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory OTPState.initial() => OTPState(
    remainingSeconds: 300,
    isVerified: false,
    isLoading: false,
  );
}
