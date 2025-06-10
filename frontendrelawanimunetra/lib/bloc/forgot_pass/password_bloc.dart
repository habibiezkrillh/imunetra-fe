import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendtenagamedisimunetra/bloc/forgot_pass/password_event.dart';
import 'package:frontendtenagamedisimunetra/bloc/forgot_pass/password_state.dart';
import 'package:frontendtenagamedisimunetra/repository/login_repo.dart';


class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordBloc(this.authRepository) : super(ForgotPasswordInitial()) {
    on<SubmitForgotPassword>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        await authRepository.forgotPassword(event.email);
        emit(ForgotPasswordSuccess());
      } catch (e) {
        emit(ForgotPasswordFailure(e.toString()));
      }
    });
  }
}
