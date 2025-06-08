import 'package:dashboard_relawan/model/user_model.dart';

class UserRepository {
  Future<UserModel> fetchUser() async {
    await Future.delayed(Duration(seconds: 1));
    return UserModel(
      name: "Akbar Nourma",
      profileImageUrl: "https://example.com/avatar.jpg",
    );
  }
}
