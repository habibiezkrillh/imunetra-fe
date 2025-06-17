import 'package:bloc/bloc.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_event.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_state.dart';
import 'package:dashboard_relawan/services/api_service.dart'; // ← pastikan ini

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardService service;

  DashboardBloc(this.service) : super(DashboardInitial()) {
    on<LoadActivities>(_onLoadActivities);
  }

  void _onLoadActivities(LoadActivities event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try {
      final activities = await service.fetchActivities(); // asumsi ada fungsi ini
      emit(DashboardLoaded(activities));
    } catch (e) {
      emit(DashboardError("Gagal memuat data kegiatan."));
    }
  }
}
