import 'package:dashboard_relawan/bloc/list_kegiatan/list_event.dart' hide LoadActivities;
import 'package:dashboard_relawan/bloc/list_kegiatan/list_state.dart';
import 'package:dashboard_relawan/repository/list_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository repository;

  ActivityBloc({required this.repository}) : super(ActivityInitial()) {
    on
    ((event, emit) async {
      emit(ActivityLoading());
      try {
        final activities = await repository.getActivities();
        emit(ActivityLoaded(activities));
      } catch (e) {
        emit(ActivityError("Gagal memuat aktivitas"));
      };
    });
  }
}
