import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendtenagamedisimunetra/bloc/reset_pass/reset_event.dart';
import 'package:frontendtenagamedisimunetra/bloc/reset_pass/reset_state.dart';
import 'package:frontendtenagamedisimunetra/repository/login_repo.dart';


class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository repository;

  ResetPasswordBloc({required this.repository}) : super(ResetPasswordInitial()) {
    on<SubmitPassword>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        final isSuccess = await repository.resetPassword(event.password);
        if (isSuccess) {
          emit(ResetPasswordSuccess());
        } else {
          emit(ResetPasswordFailure("Password tidak memenuhi kriteria."));
        }
      } catch (_) {
        emit(ResetPasswordFailure("Terjadi kesalahan."));
      }
    });
  }
}
