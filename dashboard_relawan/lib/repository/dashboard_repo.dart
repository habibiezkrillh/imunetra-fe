import '../services//api.service.dart';

class DashboardRepo {
  final DashboardService service;

  DashboardRepo(this.service);

  Future<List<Activity>> getAllActivities() {
    return service.fetchActivities();
  }
}
