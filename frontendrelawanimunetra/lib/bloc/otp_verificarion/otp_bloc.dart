import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_event.dart';
import 'otp_state.dart';
import '../../repository/otp_repository.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState> {
  final OTPRepository repository;
  Timer? _timer;

  OTPBloc({required this.repository}) : super(OTPState.initial()) {
    on<StartTimer>((event, emit) {
      _timer?.cancel();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        add(Tick());
      });
    });

    on<Tick>((event, emit) {
      if (state.remainingSeconds > 0) {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      } else {
        _timer?.cancel();
      }
    });

    on<ResendOTP>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await repository.sendOTP("email@example.com");
      emit(state.copyWith(remainingSeconds: 300, isLoading: false));
      add(StartTimer());
    });

    on<SubmitOTP>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final isSuccess = await repository.verifyOTP(event.otp);
      emit(state.copyWith(isVerified: isSuccess, isLoading: false));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
