import 'package:dashboard/model/input_data_pasien/input_model.dart';

class InputDataService {
  Future<bool> submitPasien(InputModel model) async {
    try {
      // Simulasi delay & API (nanti bisa ganti pakai http atau dio)
      await Future.delayed(const Duration(seconds: 2));
      print("Data dikirim: ${model.toJson()}");
      return true;
    } catch (e) {
      throw Exception('Gagal mengirim data: $e');
    }
  }
}
