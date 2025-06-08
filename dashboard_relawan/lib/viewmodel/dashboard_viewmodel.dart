import 'package:dashboard_relawan/model/user_model.dart';
import 'package:dashboard_relawan/services/repo_dashboard.dart';


class DashboardViewModel {
  final UserRepository repository;

  DashboardViewModel(this.repository);

  Future<UserModel> getUser() {
    return repository.fetchUser();
  }
}
