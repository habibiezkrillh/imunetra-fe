import 'package:dashboard_relawan/model/input_data_pasien/input_model.dart';

abstract class ListPasienState {}

class ListPasienInitial extends ListPasienState {}

class ListPasienLoaded extends ListPasienState {
  final List<InputModel> allPasien;
  final String filter;

  ListPasienLoaded({required this.allPasien, required this.filter});

  List<InputModel> get filteredPasien {
    if (filter == 'Semua') return allPasien;
    return allPasien.where((e) => e.status == filter).toList();
  }
}