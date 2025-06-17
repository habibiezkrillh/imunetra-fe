class Activity {
  final String title;
  final String date;
  final String location;
  final String image;

  Activity({
    required this.title,
    required this.date,
    required this.location,
    required this.image, required String time, required int capacity, required int participantCount,
  });

  get participantCount => null;

  get capacity => null;

  get time => null;

  static fromJson(item) {}
}
