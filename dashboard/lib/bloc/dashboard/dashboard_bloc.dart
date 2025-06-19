import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard/bloc/dashboard/dashboard_event.dart';
import 'package:dashboard/bloc/dashboard/dashboard_state.dart';
import 'package:dashboard/services/dashboard/api_service.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardService dashboardService;

  DashboardBloc(this.dashboardService) : super(DashboardInitial()) {
    on<LoadActivities>((event, emit) async {
      emit(DashboardLoading());
      try {
        final activities = await dashboardService.fetchActivities();
        emit(DashboardLoaded(
          activities: activities,
          filteredActivities: activities,
        ));
      } catch (e) {
        emit(DashboardError('Gagal memuat kegiatan.'));
      }
    });

    on<SearchActivities>((event, emit) {
      if (state is DashboardLoaded) {
        final current = state as DashboardLoaded;
        final query = event.query.toLowerCase();
        final filtered = current.activities
            .where((activity) => activity.title.toLowerCase().contains(query))
            .toList();
        emit(DashboardLoaded(
          activities: current.activities,
          filteredActivities: filtered,
        ));
      }
    });
  }
}
