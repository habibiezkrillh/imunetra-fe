import 'package:dashboard_relawan/model/dashboard/user_model.dart';

abstract class ReminderState {}

class ReminderInitial extends ReminderState {}

class ReminderLoaded extends ReminderState {
  final List<Activity> reminders;
  ReminderLoaded(this.reminders);
}
