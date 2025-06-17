import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/services/dash_service.dart';

class ActivityRepository {
  final ActivityService _service = ActivityService();

  Future<List<Activity>> getActivities() => _service.fetchActivities();
}
