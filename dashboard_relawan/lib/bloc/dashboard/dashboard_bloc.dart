<<<<<<< Updated upstream
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';
import '../../repository/dashboard_repo.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepo repository;

  DashboardBloc(this.repository) : super(DashboardInitial()) {
    on<LoadActivities>((event, emit) async {
      emit(DashboardLoading());
      try {
        final activities = await repository.getAllActivities();
        emit(DashboardLoaded(activities: activities));
      } catch (e) {
        emit(DashboardError(message: e.toString()));
=======
import 'package:dashboard_relawan/bloc/dashboard/dashboard_event.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_state.dart';
import 'package:dashboard_relawan/repository/repo_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ActivityRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadActivities>((event, emit) async {
      emit(HomeLoading());
      try {
        final activities = await repository.getActivities();
        emit(HomeLoaded(activities));
      } catch (_) {
        emit(HomeError("Gagal memuat data"));
>>>>>>> Stashed changes
      }
    });
  }
}
<<<<<<< Updated upstream
=======

class HomeEvent {
}
>>>>>>> Stashed changes
