<<<<<<< Updated upstream
import 'package:equatable/equatable.dart';

abstract class ActivityEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadActivities extends ActivityEvent {}
=======
abstract class EventEvent {}

class LoadEvents extends EventEvent {}
>>>>>>> Stashed changes
