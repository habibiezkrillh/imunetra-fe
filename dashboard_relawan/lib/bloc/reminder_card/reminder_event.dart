import 'package:dashboard_relawan/model/dashboard/user_model.dart';

abstract class ReminderEvent {}

class AddReminder extends ReminderEvent {
  final Activity activity;
  AddReminder(this.activity);
}
