import 'package:flutter_bloc/flutter_bloc.dart';
import 'input_event.dart';
import 'input_state.dart';

class PasienBloc extends Bloc<PasienEvent, PasienState> {
  PasienBloc() : super(PasienInitial()) {
    on<TambahPasienEvent>((event, emit) async {
      emit(PasienLoading());

      try {
        // Simulasi penyimpanan data (bisa diganti API call)
        await Future.delayed(const Duration(seconds: 1));
        emit(PasienSuccess());
      } catch (e) {
        emit(PasienFailure("Gagal menyimpan data"));
      }
    });
  }
}
