import 'package:dashboard_relawan/model/dashboard/user_model.dart';

class DetailService {
  Future<Activity> getActivityById(String id) async {
    await Future.delayed(Duration(seconds: 1)); // simulasi delay

    return Activity(
      title: 'Kegiatan Bersih Pantai',
      date: '28 Juni 2025',
      time: '08.00 WITA',
      location: 'Pantai Losari',
      image: 'https://example.com/image.jpg',
      capacity: 50,
      participantCount: 35,
      description: 'Ayo ikut kegiatan bersih pantai bersama relawan lainnya!',
    );
  }
}
