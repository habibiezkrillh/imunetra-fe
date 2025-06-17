import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<Map<String, dynamic>> register({
    required String nama,
    required String email,
    required String password,
    required String kota,
    required String telepon,
    required String tanggalLahir,
    required String alamat,
    required String ktpPath,
  }) async {
    final uri = Uri.parse('$baseUrl/register');
    final request = http.MultipartRequest('POST', uri)
      ..fields['nama'] = nama
      ..fields['email'] = email
      ..fields['password'] = password
      ..fields['kota'] = kota
      ..fields['telepon'] = telepon
      ..fields['tanggal_lahir'] = tanggalLahir
      ..fields['alamat'] = alamat
      ..files.add(await http.MultipartFile.fromPath(
        'ktp',
        ktpPath,
        contentType: MediaType('image', 'jpeg'),
      ));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal mendaftar');
    }
  }
}

