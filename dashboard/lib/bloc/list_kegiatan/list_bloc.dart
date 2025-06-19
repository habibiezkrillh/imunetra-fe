import 'package:dashboard/bloc/list_kegiatan/list_event.dart';
import 'package:dashboard/bloc/list_kegiatan/list_state.dart';
import 'package:dashboard/model/dashboard/user_model.dart';
import 'package:dashboard/repository/listkegiatan/list_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository repository;

  ActivityBloc({required this.repository}) : super(ActivityInitial()) {
    on
    ((event, emit) async {
      emit(ActivityLoading());
      try {
        final activities = await repository.getActivities();
        emit(ActivityLoaded(activities.cast<Activity>()));
      } catch (e) {
        emit(ActivityError("Gagal memuat aktivitas"));
      };
    });
  }
}
