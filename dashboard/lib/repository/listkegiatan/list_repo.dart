import 'package:dashboard/model/dashboard/user_model.dart';
import 'package:dashboard/services/listkegiatan/list_service.dart';

class ActivityRepository {
  final ActivityService _service;

  ActivityRepository(this._service);

  Future<List<Activity>> fetchAllActivities() async {
    try {
      final activities = await _service.getActivities();
      return activities;
    } catch (e) {
      throw Exception('Gagal mengambil daftar kegiatan: $e');
    }
  }

  Future<Activity> getActivityDetail(String activityId) async {
    try {
      final activity = await _service.getActivityById(activityId);
      return activity;
    } catch (e) {
      throw Exception('Gagal mengambil detail kegiatan: $e');
    }
  }

  // Tambahan jika kamu ingin menambahkan atau update data kegiatan
  Future<void> createActivity(Activity activity) async {
    try {
      await _service.createActivity(activity);
    } catch (e) {
      throw Exception('Gagal membuat kegiatan baru: $e');
    }
  }

  Future<void> updateActivity(String id, Activity updatedActivity) async {
    try {
      await _service.updateActivity(id, updatedActivity);
    } catch (e) {
      throw Exception('Gagal memperbarui kegiatan: $e');
    }
  }

  Future getActivities() async {}
}
