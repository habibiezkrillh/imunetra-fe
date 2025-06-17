import 'package:dashboard_relawan/model/list_kegiatan/list_model.dart';
import 'package:dashboard_relawan/services/listkegiatan/list_service.dart';

class ActivityRepository {
  final ListService service;

  ActivityRepository({required this.service});

  Future<List<EventModel>> getActivities() {
    return service.fetchActivities();
  }

  Future getActivityDetail(String id) async {}
}
