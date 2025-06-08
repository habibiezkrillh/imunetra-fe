import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Column(
        children: [
          _buildTopHeader(context),
          Expanded(
            child: Center(
              child: Text(
                'Konten lainnya...',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Teks kiri
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey Rizman 👋",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Let’s find your\nbest project!",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // Foto profil
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/profile.jpg', // ganti dengan gambar kamu
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

