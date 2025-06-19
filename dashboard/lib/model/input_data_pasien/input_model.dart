class InputModel {
  final String nama;
  final int umur;
  final String jenisKelamin;
  final String gejala;
  final String status;

  InputModel({
    required this.nama,
    required this.umur,
    required this.jenisKelamin,
    required this.gejala,
    required this.status,
  });

  toJson() {}
}
