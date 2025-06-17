import 'package:dashboard_relawan/services/api_service.dart';
import '../model/dashboard/user_model.dart';

class DashboardRepo {
  final DashboardService service;

  DashboardRepo(this.service);

  Future<List<Activity>> getAllActivities() {
    return service.fetchActivities();
  }
}
