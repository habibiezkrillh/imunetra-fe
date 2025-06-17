<<<<<<< Updated upstream
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
=======
import 'package:dashboard_relawan/bloc/list_kegiatan/list_event.dart';
import 'package:dashboard_relawan/bloc/list_kegiatan/list_state.dart';
import 'package:dashboard_relawan/repository/repo_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository repository;

  EventBloc(this.repository) : super(EventInitial()) {
    on<LoadEvents>((event, emit) async {
      emit(EventLoading());
      try {
        final events = await repository.getEvents();
        emit(EventLoaded(events));
      } catch (e) {
        emit(EventError('Failed to load events'));
>>>>>>> Stashed changes
      }
    });
  }
}
