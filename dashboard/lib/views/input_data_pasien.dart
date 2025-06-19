import 'package:dashboard/bloc/input_data_pasien/input_bloc.dart';
import 'package:dashboard/bloc/input_data_pasien/input_event.dart';
import 'package:dashboard/bloc/input_data_pasien/input_state.dart';
import 'package:dashboard/model/input_data_pasien/input_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

InputModel? _pasienYangDibuat;

class InputDataPasienPage extends StatefulWidget {
  const InputDataPasienPage({super.key});

  @override
  State<InputDataPasienPage> createState() => _InputDataPasienPageState();
}

class _InputDataPasienPageState extends State<InputDataPasienPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController gejalaController = TextEditingController();
  final TextEditingController detakJantungController = TextEditingController();
  final TextEditingController suhuController = TextEditingController();
  final TextEditingController napasController = TextEditingController();

  String jenisKelamin = 'Laki-laki';
  String status = 'Positif';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Penginputan Data Pasien', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        centerTitle: true,
        leading: const BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<PasienBloc, PasienState>(
          listener: (context, state) {
            if (state is PasienSuccess && _pasienYangDibuat != null) {
              Navigator.pop(context, _pasienYangDibuat);
            } else if (state is PasienFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Gagal: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildSectionTitle('Informasi Pasien'),
                  _buildField('Nama Pasien', namaController),
                  _buildField('Umur Pasien', umurController, type: TextInputType.number),
                  _buildDropdown('Jenis Kelamin', ['Laki-laki', 'Perempuan'], jenisKelamin, (val) {
                    setState(() => jenisKelamin = val!);
                  }),

                  const SizedBox(height: 12),
                  _buildSectionTitle('Data Kesehatan Pasien'),
                  _buildField('Denyut Jantung', detakJantungController),
                  _buildField('Tinggi Demam Pasien', suhuController),
                  _buildField('Kecepatan pernapasan', napasController),
                  _buildDropdown('Riwayat Terkena Pneumonia', ['Positif', 'Negatif'], status, (val) {
                    setState(() => status = val!);
                  }),
                  _buildField('Gejala lain yang tidak normal', gejalaController, maxLines: 4),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state is PasienLoading ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D5CFF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    child: Text(
                      state is PasienLoading ? 'Menyimpan...' : 'Simpan Data Pasien',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller,
      {TextInputType type = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          maxLines: maxLines,
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            hintText: label,
            hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String value, void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            hintText: label,
            hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item, style: GoogleFonts.poppins())))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final pasien = InputModel(
        nama: namaController.text,
        umur: int.parse(umurController.text),
        jenisKelamin: jenisKelamin,
        gejala: gejalaController.text,
        status: status,
      );
      _pasienYangDibuat = pasien;
      context.read<PasienBloc>().add(TambahPasienEvent(pasien));
    }
  }
}
