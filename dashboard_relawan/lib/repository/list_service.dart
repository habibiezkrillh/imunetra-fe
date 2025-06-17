import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/services/list_service.dart';

class ActivityRepository {
  final ActivityService service;

  ActivityRepository({required this.service});

  Future<List<Activity>> getActivities() {
    return service.fetchActivities();
  }
}
