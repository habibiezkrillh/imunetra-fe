import 'package:dashboard_relawan/model/dashboard/user_model.dart';
<<<<<<< Updated upstream

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Activity> activities;

  DashboardLoaded({required this.activities});
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError({required this.message});
=======
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Activity> activities;

  HomeLoaded(this.activities);

  @override
  List<Object?> get props => [activities];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
>>>>>>> Stashed changes
}
