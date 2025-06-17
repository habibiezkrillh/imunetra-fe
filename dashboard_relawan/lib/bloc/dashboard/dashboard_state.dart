import 'package:dashboard_relawan/model/dashboard/user_model.dart';

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
}
