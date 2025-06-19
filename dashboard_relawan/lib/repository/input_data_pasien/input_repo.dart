import 'package:dashboard_relawan/model/input_data_pasien/input_model.dart';
import 'package:dashboard_relawan/services/input_data_pasien/input_service.dart';

class InputDataRepository {
  final InputDataService service;

  InputDataRepository(this.service);

  Future<void> submitPasien(InputModel model) async {
    final success = await service.submitPasien(model);
    if (!success) throw Exception('Submit gagal');
  }
}
