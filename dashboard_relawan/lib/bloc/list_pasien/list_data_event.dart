import 'package:equatable/equatable.dart';
import 'package:dashboard_relawan/model/input_data_pasien/input_model.dart';

abstract class ListPasienEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPasienEvent extends ListPasienEvent {}

class AddPasienEvent extends ListPasienEvent {
  final InputModel pasien;
  AddPasienEvent(this.pasien);

  @override
  List<Object?> get props => [pasien];
}

class FilterPasienEvent extends ListPasienEvent {
  final String status;
  FilterPasienEvent(this.status);

  @override
  List<Object?> get props => [status];
}