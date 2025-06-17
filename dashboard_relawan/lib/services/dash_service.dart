import 'package:dashboard_relawan/model/dashboard/user_model.dart';

class ActivityService {
  Future<List<Activity>> fetchActivities() async {
    // Contoh dummy data
    await Future.delayed(Duration(seconds: 1)); // simulasi loading
    return [
      Activity(date: "28 Juni 2025", title: "Kegiatan Desa Makmur Abadi", imagePath: "assets/images/course1.jpg"),
      Activity(date: "15 Desember 2025", title: "Kegiatan Relawan Setia", imagePath: "assets/images/course2.jpg"),
    ];
  }
}
