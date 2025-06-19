import 'package:equatable/equatable.dart';
import 'package:dashboard/model/dashboard/user_model.dart';

abstract class ActivityDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActivityDetailInitial extends ActivityDetailState {}

class ActivityDetailLoading extends ActivityDetailState {}

class ActivityDetailLoaded extends ActivityDetailState {
  final Activity activity;

  ActivityDetailLoaded(this.activity);

  @override
  List<Object?> get props => [activity];
}

class ActivityDetailError extends ActivityDetailState {
  final String message;

  ActivityDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
