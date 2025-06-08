import 'package:flutter/material.dart';
import 'package:frontendtenagamedisimunetra/views/otp_verification.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSentPage extends StatelessWidget {
  final String email;

  const EmailSentPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 0), // menaikkan elemen di bawahnya sedikit
              Image.asset(
                'assets/images/email_verif.jpg',
                width: 400,  // sebelumnya 400
                height: 300, // sebelumnya 120
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                'Kode Verifikasi telah terkirim ke email anda',
                style: GoogleFonts.poppins(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 300, 
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OTPVerificationView()),
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
      ),
    );
  }
}
