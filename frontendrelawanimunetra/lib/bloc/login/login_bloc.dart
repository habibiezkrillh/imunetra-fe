import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendtenagamedisimunetra/repository/login_repo.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState.initial()) {
    on<LoginUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      bool isUsernameValid = state.username.isNotEmpty;
      bool isPasswordValid = state.password.isNotEmpty;

      emit(state.copyWith(
        isUsernameValid: isUsernameValid,
        isPasswordValid: isPasswordValid,
      ));

      if (isUsernameValid && isPasswordValid) {
        emit(state.copyWith(isSubmitting: true));

        final success = await authRepository.login(
          username: state.username,
          password: state.password,
        );

        if (success) {
          emit(state.copyWith(isSuccess: true, isSubmitting: false));
        } else {
          emit(state.copyWith(isFailure: true, isSubmitting: false));
        }
      }
    });
  }
}
