import 'package:dashboard/model/dashboard/user_model.dart';
import 'package:dashboard/services/listkegiatan/list_service.dart';

class DetailRepo {
  final ActivityService _service;

  DetailRepo(this._service);

  /// Ambil detail kegiatan berdasarkan ID
  Future<Activity> getActivityById(String id) async {
    try {
      final activity = await _service.getActivityById(id);
      return activity;
    } catch (e) {
      throw Exception('Gagal mengambil detail kegiatan: $e');
    }
  }

  /// Daftarkan user ke kegiatan tertentu
  Future<void> registerToActivity(String activityId, String userId) async {
    try {
      await _service.registerToActivity(activityId, userId);
    } catch (e) {
      throw Exception('Gagal mendaftar ke kegiatan: $e');
    }
  }

  Future fetchActivityDetail(String id) async {}
}
