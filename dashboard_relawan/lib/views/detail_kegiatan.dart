import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity activity;

  const ActivityDetailPage({
    super.key,
    required this.activity,
    required String activityId,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]);
    final titleStyle = GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600);
    final headingStyle = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Gambar + tombol back
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.network(
                    activity.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            // Konten
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lokasi sebagai kategori
                    Text("Lokasi: ${activity.location}", style: textStyle),

                    const SizedBox(height: 4),

                    // Judul + kuota
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            activity.title,
                            style: titleStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.people, color: Color(0xFF5588FF), size: 20),
                        const SizedBox(width: 4),
                        Text(
                          '${activity.participantCount}/${activity.capacity}',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Tanggal & waktu
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 18, color: Color(0xFF5588FF)),
                        const SizedBox(width: 6),
                        Text(activity.date, style: textStyle),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 18, color: Color(0xFF5588FF)),
                        const SizedBox(width: 6),
                        Text(activity.time ?? '08.00 WITA', style: textStyle),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Deskripsi
                    Text("Deskripsi Kegiatan", style: headingStyle),
                    const SizedBox(height: 8),
                    Text(
                      activity.description ?? 'Deskripsi belum tersedia.',
                      style: textStyle,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Info slot tersisa
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Slot Tersisa", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                      const SizedBox(height: 4),
                      Text(
                        '${activity.capacity - activity.participantCount} orang',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // Tombol daftar
                 ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        title: Text('Konfirmasi Pendaftaran', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                        content: Text(
                          'Apakah kamu yakin ingin mendaftar ke kegiatan ini?',
                          style: GoogleFonts.poppins(),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Batal', style: GoogleFonts.poppins(color: Colors.grey[600])),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Berhasil mendaftar!', style: GoogleFonts.poppins()),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              // Di sini bisa tambahkan logic daftar ke backend atau update state
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5588FF),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text('Konfirmasi', style: GoogleFonts.poppins(color: Colors.white)),
                          ),
                        ],
                      );
                    },
                  );
                },
                  icon: const Icon(Icons.check_circle, size: 22, color: Colors.white), // lebih besar
                  label: Text(
                    "Daftar",
                    style: GoogleFonts.poppins(
                      fontSize: 16, // ukuran font diperbesar
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5588FF),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // padding diperbesar
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // sedikit lebih bulat
                    ),
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

