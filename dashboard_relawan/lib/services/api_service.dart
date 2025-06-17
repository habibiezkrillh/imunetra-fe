import '../model/dashboard/user_model.dart';

class DashboardService {
  DashboardService();

  Future<List<Activity>> fetchActivities() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Activity(
        title: "Kegiatan Desa Makmur Abadi",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event1.jpg',
        time: '',
        capacity: 35,
        participantCount: 21,
      ),
      Activity(
        title: "Kegiatan Sehat Desa",
        date: "15 Desember 2025",
        location: "Sulsel",
        image: 'assets/images/event2.jpg',
        time: '',
        capacity: 35,
        participantCount: 21,
      ),
      Activity(
        title: "Kegiatan Desa Relawan",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event3.jpg',
        time: '',
        capacity: 35,
        participantCount: 21,
      ),
      Activity(
        title: "Kegiatan Abadi Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event4.jpg',
        time: '',
        capacity: 35,
        participantCount: 21,
      ),
      Activity(
        title: "Kegiatan Relawan Sehat",
        date: "28 Juni 2025",
        location: "Dekatmu",
        image: 'assets/images/event5.jpg',
        time: '',
        capacity: 35,
        participantCount: 21,
      ),
    ];
  }

  Future getActivities() async {}
}
