import 'package:flutter_bloc/flutter_bloc.dart';
import 'reminder_event.dart';
import 'reminder_state.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final List<Activity> _reminders = [];

  ReminderBloc() : super(ReminderInitial()) {
    on<AddReminder>((event, emit) {
      if (!_reminders.any((a) => a.id == event.activity.id)) {
        _reminders.add(event.activity);
      }
      emit(ReminderLoaded(List.from(_reminders)));
    });
  }
}
