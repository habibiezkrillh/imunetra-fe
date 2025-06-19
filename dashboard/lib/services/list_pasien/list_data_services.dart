import 'package:dashboard/model/input_data_pasien/input_model.dart';
import 'package:dashboard/model/list_pasien/list_data_model.dart';

class PasienService {
  List<Pasien> pasienDummy = [
    Pasien(nama: "Andi", umur: 25, Jenis_Kelamin: "Laki-laki", status: "Positif"),
    Pasien(nama: "Budi", umur: 30, Jenis_Kelamin: "Laki-laki", status: "Negatif"),
    Pasien(nama: "Citra", umur: 28, Jenis_Kelamin: "Perempuan", status: "Positif"),
  ];

  Future<List<Pasien>> fetchPasien() async {
    await Future.delayed(Duration(seconds: 1));
    return pasienDummy;
  }

  Future<void> simpanPasien(InputModel pasien) async {}
}
