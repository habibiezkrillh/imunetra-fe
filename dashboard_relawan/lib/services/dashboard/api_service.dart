import 'package:dashboard_relawan/model/dashboard/user_model.dart';


class DashboardService {
  DashboardService();

  /// Mengambil daftar aktivitas secara lokal (dummy data).
  Future<List<Activity>> fetchActivities() async {
    await Future.delayed(Duration(seconds: 1)); // simulasi delay jaringan

    return [
      Activity(
        title: "Kegiatan Desa Makmur Abadi",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event1.jpg',
        time: '08:00',
        capacity: 35,
        participantCount: 21, 
        description: '',
      ),
      Activity(
        title: "Kegiatan Sehat Desa",
        date: "15 Desember 2025",
        location: "Sulsel",
        image: 'assets/images/event2.jpg',
        time: '09:30',
        capacity: 35,
        participantCount: 21, 
        description: '',
      ),
      Activity(
        title: "Kegiatan Desa Relawan",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event3.jpg',
        time: '10:00',
        capacity: 35,
        participantCount: 21, 
        description: '',
      ),
      Activity(
        title: "Kegiatan Abadi Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event4.jpg',
        time: '13:00',
        capacity: 35,
        participantCount: 21, 
        description: '',
      ),
      Activity(
        title: "Kegiatan Relawan Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event5.jpg',
        time: '15:00',
        capacity: 35,
        participantCount: 21, 
        description: '',
      ),
    ];
  }
}
