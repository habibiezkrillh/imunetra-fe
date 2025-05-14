import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileState {
  final String name;
  final String email;
  final String phone;
  final String city;
  final String? imagePath;

  ProfileState({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    this.imagePath,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? phone,
    String? city,
    String? imagePath,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}

class ProfileCubit extends Cubit<ProfileState> {
  final ImagePicker _picker = ImagePicker();

  ProfileCubit()
      : super(ProfileState(name: '', email: '', phone: '', city: '', imagePath: null));

  void updateProfile({String? name, String? email, String? phone, String? city}) {
    emit(state.copyWith(name: name, email: email, phone: phone, city: city));
  }

  Future<void> updateProfileImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      emit(state.copyWith(imagePath: pickedFile.path));
    }
  }
}
