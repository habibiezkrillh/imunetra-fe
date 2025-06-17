import 'package:dashboard_relawan/model/list_kegiatan/list_model.dart';
import 'package:dashboard_relawan/services/list_service.dart';

class EventRepository {
  final EventService service;
  EventRepository(this.service);

  Future<List<EventModel>> getEvents() => service.fetchEvents();
}
