import 'package:imunetra/models/OnBoarding_models.dart';

class OnboardingService {
  List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        image: "assets/images/gambar1.png",
        title: "Imunetra",
        desc: "Bersama kita cegah pneumonia pada anak-anak yang membutuhkan."
      ),
      OnboardingModel(
        image: "assets/images/gambar2.png",
        title: "Imunetra",
        desc: "Melalui Imunetra, individu dan profesional bisa saling terhubung dan berkontribusi dalam upaya kesehatan anak."
      ),
      OnboardingModel(
        image: "assets/images/gambar3.png",
        title: "Imunetra",
        desc: "Bergabung sekarang dan jadi bagian dari perubahan untuk mencegah Pneumonia"
      ),
    ];
  }
}