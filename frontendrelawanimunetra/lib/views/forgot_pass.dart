import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontendtenagamedisimunetra/views/otp_verification.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(   
        backgroundColor: Colors.white,
        leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40), 
            Text(
              'Lupa Kata Sandi',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Silakan masukkan email anda untuk reset kata sandi',
              style: GoogleFonts.poppins(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextFormField(
              style: GoogleFonts.poppins(),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Masukkan email anda",
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                prefixIcon: const Icon(Icons.email, color: Color(0xFF3B6BFD)),
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
            const SizedBox(height: 24),
            SizedBox(
              width: 300, // Lebar tombol 200 pixel
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    CupertinoPageRoute(builder: (context) => const OTPVerificationView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B6BFD),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Selanjutnya",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
