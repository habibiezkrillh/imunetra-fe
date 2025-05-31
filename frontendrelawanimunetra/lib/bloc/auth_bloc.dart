import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginRequested) {
      yield AuthLoading();
      // Simulasi login
      await Future.delayed(Duration(seconds: 2));
      yield AuthSuccess();
    } else if (event is RegisterRequested) {
      yield AuthLoading();
      await Future.delayed(Duration(seconds: 2));
      yield AuthSuccess();
    }
  }
}
