import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:frontendtenagamedisimunetra/views/login.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeTerms = false;
  File? _ktpImage;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final birthDateController = TextEditingController();
  final addressController = TextEditingController();

  Future<void> _pickKTP() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _ktpImage = File(picked.path);
      });
    }
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
          prefixIcon: Icon(icon, color: const Color(0xFF3B6BFD)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate() && _agreeTerms) {
      print('Register Success');
      // TODO: Simpan data dan kirim ke backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    'assets/images/Logo.jpg',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Silahkan Daftarkan Diri \nAnda',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  hintText: 'Nama Lengkap',
                  icon: Icons.person,
                  controller: fullNameController,
                ),
                _buildTextField(
                  hintText: 'Alamat Email',
                  icon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  hintText: 'Kata Sandi',
                  icon: Icons.lock,
                  controller: passwordController,
                  obscure: true,
                ),
                _buildTextField(
                  hintText: 'Konfirmasi Kata Sandi',
                  icon: Icons.lock_outline,
                  controller: confirmPasswordController,
                  obscure: true,
                ),
                _buildTextField(
                  hintText: 'Kota Domisili',
                  icon: Icons.location_city,
                  controller: cityController,
                ),
                _buildTextField(
                  hintText: 'Nomor Telepon',
                  icon: Icons.phone,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                _buildTextField(
                  hintText: 'Tanggal Lahir',
                  icon: Icons.calendar_today,
                  controller: birthDateController,
                ),
                _buildTextField(
                  hintText: 'Alamat Lengkap',
                  icon: Icons.home,
                  controller: addressController,
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _pickKTP,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.image, color: Color(0xFF3B6BFD)),
                            const SizedBox(width: 10),
                            Text(
                              _ktpImage == null ? 'Unggah KTP' : 'KTP Terpilih',
                              style: GoogleFonts.poppins(
                                color: _ktpImage == null ? Colors.grey : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.upload, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _agreeTerms = !_agreeTerms;
                          });
                        },
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: _agreeTerms
                              ? Center(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF3B6BFD),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Saya Setuju dengan Segala Syarat & Ketentuan yang berlaku di Aplikasi Imunetra',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: _handleRegister,
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B6BFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah Punya Akun?',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: Text(
                          ' Masuk',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF3B6BFD),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
