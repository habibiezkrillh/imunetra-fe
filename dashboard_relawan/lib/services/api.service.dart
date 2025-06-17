import '../model/dashboard/user_model.dart';

class DashboardService {
  Future<List<Activity>> fetchActivities() async {
    // Simulasi pengambilan data
    await Future.delayed(Duration(seconds: 1));
    return [
      Activity(
        title: "Kegiatan Desa Makmur Abadi",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event1.jpg',
        time: '08:00 - 12:00',
        capacity: 50,
        participantCount: 35,
      ),
      Activity(
        title: "Kegiatan Sehat Desa",
        date: "15 Desember 2025",
        location: "Sulsel",
        image: 'assets/images/event2.jpg',
        time: '10:00 - 14:00',
        capacity: 40,
        participantCount: 20,
      ),
      Activity(
        title: "Kegiatan Desa Relawan",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event3.jpg',
        time: '13:00 - 17:00',
        capacity: 60,
        participantCount: 45,
      ),
      Activity(
        title: "Kegiatan Abadi Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event4.jpg',
        time: '09:00 - 11:00',
        capacity: 30,
        participantCount: 25,
      ),
      Activity(
        title: "Kegiatan Relawan Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event5.jpg',
        time: '07:00 - 10:00',
        capacity: 50,
        participantCount: 40,
      ),
    ];
  }
}
