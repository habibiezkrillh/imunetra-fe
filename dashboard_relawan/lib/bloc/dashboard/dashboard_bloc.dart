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
      }
    });
  }
}
