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
      )];
  }
}