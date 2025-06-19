import 'package:equatable/equatable.dart';
import 'package:dashboard_relawan/model/input_data_pasien/input_model.dart';

abstract class PasienEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TambahPasienEvent extends PasienEvent {
  final InputModel pasien;

  TambahPasienEvent(this.pasien);

  @override
  List<Object?> get props => [pasien];
}
