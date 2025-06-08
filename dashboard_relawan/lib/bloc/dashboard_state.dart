import 'package:dashboard_relawan/model/user_model.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final UserModel user;
  DashboardLoaded(this.user);
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
