import 'package:dashboard/model/list_pasien/list_data_model.dart';
import 'package:dashboard/services/list_pasien/list_data_services.dart';
class PasienRepo {
  final PasienService service;

  PasienRepo(this.service);

  Future<List<Pasien>> getPatients() => service.fetchPasien();

  Future<List<Pasien>> searchPasien(String keyword) async {
    final data = await service.fetchPasien();
    return data.where((e) => e.nama.toLowerCase().contains(keyword.toLowerCase())).toList();
  }

  Future<List<Pasien>> filterPasien(String filter) async {
    final data = await service.fetchPasien();
    if (filter == 'Semua') return data;
    return data.where((e) => e.status == filter).toList();
  }

}
