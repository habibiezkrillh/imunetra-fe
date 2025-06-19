abstract class DashboardEvent {}

class LoadActivities extends DashboardEvent {}
class SearchActivities extends DashboardEvent {
  final String query;

  SearchActivities(this.query);
}
