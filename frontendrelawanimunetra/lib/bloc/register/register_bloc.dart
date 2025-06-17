import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendtenagamedisimunetra/services/api_services.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService authService;

  RegisterBloc(this.authService) : super(RegisterInitial()) {
    on<SubmitRegister>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await authService.register(
          nama: event.nama,
          email: event.email,
          password: event.password,
          kota: event.kota,
          telepon: event.telepon,
          tanggalLahir: event.tanggalLahir,
          alamat: event.alamat,
          ktpPath: event.ktpPath,
        );

        if (result['success']) {
          emit(RegisterSuccess("Registrasi berhasil"));
        } else {
          emit(RegisterFailure(result['message'] ?? 'Gagal mendaftar'));
        }
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });
  }
}

