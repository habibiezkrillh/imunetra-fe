import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Atur Ulang Kata Sandi',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Silahkan masukkan kata sandi baru anda',
              style: GoogleFonts.poppins(
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextFormField(
              style: GoogleFonts.poppins(),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Masukkan kata sandi baru anda",
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF3B6BFD)),
                filled: true,
                fillColor: Colors.grey[100],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF3B6BFD), width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _passwordRuleItem("Kata sandi harus mengandung :"),
                const SizedBox(height: 6),
                _passwordRuleItem("Mengandung nomor"),
                const SizedBox(height: 6),
                _passwordRuleItem("Minimal 8 karakter"),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Simpan kata sandi dan kembali ke login
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D7CFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordRuleItem(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
