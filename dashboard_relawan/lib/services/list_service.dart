<<<<<<< Updated upstream
import 'package:dashboard_relawan/model/dashboard/user_model.dart';

class ActivityService {
  Future<List<Activity>> fetchActivities() async {
    // Simulasi data dummy
    await Future.delayed(const Duration(seconds: 1));
    return [
      Activity(
        title: 'Bakti Sosial',
        date: '2025-06-20',
        time: '09.00 WITA',
        location: 'Makassar',
        image: 'https://via.placeholder.com/400x300',
        participantCount: 30,
        capacity: 50,
=======
import 'package:dashboard_relawan/model/list_kegiatan/list_model.dart';

class EventService {
  Future<List<EventModel>> fetchEvents() async {
    await Future.delayed(Duration(seconds: 1)); // Simulasi delay
    return [
      EventModel(
        title: 'Desa Sehat Ta\'',
        date: '20 - 22 Juni 2025',
        time: '10.00 - 16.00',
        location: 'Desa Kanjilo',
        imageUrl: 'assets/images/card.jpg',
>>>>>>> Stashed changes
      ),
    ];
  }
}
