import 'package:equatable/equatable.dart';

abstract class PasienState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PasienInitial extends PasienState {}

class PasienLoading extends PasienState {}

class PasienSuccess extends PasienState {}

class PasienFailure extends PasienState {
  final String message;

  PasienFailure(this.message);

  @override
  List<Object?> get props => [message];
}
