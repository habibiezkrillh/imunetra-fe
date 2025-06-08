import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  final String userName;
  final String profileImageUrl;

  const DashboardPage({
    Key? key,
    required this.userName,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Header di paling atas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Foto profil di kiri
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
          
                    // Spacer kecil antar profil dan teks
                    SizedBox(width: 12),
          
                    // Nama pengguna di tengah
                    Expanded(
                      child: Center(
                        child: Text(
                          userName,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
          
                    // Ikon search di kanan
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.black),
                      onPressed: () {
                        // Aksi saat search ditekan
                      },
                    ),
                  ],
                ),
              ),
          
              // Konten lain di bawah
              Expanded(
                child: Center(
                  child: Text(
                    "Konten Dashboard",
                    style: GoogleFonts.poppins(fontSize: 16),
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
