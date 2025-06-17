import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/services/detail_kegiatan/detail_service.dart';

class DetailRepo {
  final DetailService service;

  DetailRepo({required this.service});

  Future<Activity> fetchActivityDetail(String id) {
    return service.getActivityById(id);
  }
}
