import 'package:dashboard_relawan/bloc/list_kegiatan/list_event.dart';
import 'package:dashboard_relawan/bloc/list_kegiatan/list_state.dart';
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
