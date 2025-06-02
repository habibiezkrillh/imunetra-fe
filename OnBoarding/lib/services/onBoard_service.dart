import 'package:imunetra/models/OnBoarding_models.dart';

class OnboardingService {
  List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        title: "Imunetra",
        image: "assets/images/gambar1.png",
        desc: "Bersama kita cegah pneumonia pada anak-anak yang membutuhkan."
      ),
      OnboardingModel(
        title: "Imunetra",
        image: "assets/images/gambar2.png",
        desc: "Individu dan profesional bisa saling terhubung dan berkontribusi dalam upaya kesehatan anak."
      ),
      OnboardingModel(
        title: "Imunetra",
        image: "assets/images/gambar3.png",
        desc: "Bergabung sekarang dan jadi bagian dari perubahan untuk mencegah Pneumonia"
      ),
    ];
  }
}