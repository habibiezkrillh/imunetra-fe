import 'package:dashboard_relawan/bloc/list_pasien/list_data_event.dart';
import 'package:dashboard_relawan/bloc/list_pasien/list_data_state.dart';
import 'package:dashboard_relawan/model/input_data_pasien/input_model.dart';
import 'package:dashboard_relawan/repository/list_pasien/list_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPasienBloc extends Bloc<ListPasienEvent, ListPasienState> {
  ListPasienBloc(PasienRepo pasienRepo) : super(ListPasienInitial()) {
    on<LoadPasienEvent>((event, emit) {
      emit(ListPasienLoaded(allPasien: [], filter: 'Semua'));
    });

    on<AddPasienEvent>((event, emit) {
      if (state is ListPasienLoaded) {
        final current = state as ListPasienLoaded;
        final updatedList = List<InputModel>.from(current.allPasien)..add(event.pasien);
        emit(ListPasienLoaded(allPasien: updatedList, filter: current.filter));
      }
    });

    on<FilterPasienEvent>((event, emit) {
      if (state is ListPasienLoaded) {
        final current = state as ListPasienLoaded;
        emit(ListPasienLoaded(allPasien: current.allPasien, filter: event.status));
      }
    });
  }
}