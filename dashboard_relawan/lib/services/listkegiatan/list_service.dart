import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/model/list_kegiatan/list_model.dart';

class ActivityService {
  Future<List<EventModel>> fetchActivities() async {
    // Simulasi data dummy
    await Future.delayed(const Duration(seconds: 1));
    return [
      EventModel(
        title: "Kegiatan Desa Makmur Abadi",
        date: "28 Juni 2025",
        location: "Dekatmu",
        time: '08:00',
        imageUrl: '',
      ),
      EventModel(
        title: "Kegiatan Sehat Desa",
        date: "15 Desember 2025",
        location: "Sulsel",
        time: '09:30',
        imageUrl: '',
      ),
      EventModel(
        title: "Kegiatan Desa Relawan",
        date: "28 Juni 2025",
        location: "Dekatmu",
        time: '10:00',
        imageUrl: '',
      ),
      EventModel(
        title: "Kegiatan Abadi Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        time: '13:00',
        imageUrl: '',
      ),
      EventModel(
        title: "Kegiatan Relawan Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        time: '15:00',
        imageUrl: '',
      ),
    ];
  }

  Future getActivities() async {}

  Future getActivityById(String activityId) async {}

  Future<void> createActivity(Activity activity) async {}

  Future<void> updateActivity(String id, Activity updatedActivity) async {}

  Future<void> registerToActivity(String activityId, String userId) async {}
}
