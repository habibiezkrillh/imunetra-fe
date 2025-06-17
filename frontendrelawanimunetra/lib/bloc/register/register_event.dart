import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SubmitRegister extends RegisterEvent {
  final String nama;
  final String email;
  final String password;
  final String kota;
  final String telepon;
  final String tanggalLahir;
  final String alamat;
  final String ktpPath;

  const SubmitRegister({
    required this.nama,
    required this.email,
    required this.password,
    required this.kota,
    required this.telepon,
    required this.tanggalLahir,
    required this.alamat,
    required this.ktpPath,
  });

  @override
  List<Object> get props => [
    nama, email, password, kota, telepon, tanggalLahir, alamat, ktpPath
  ];
}