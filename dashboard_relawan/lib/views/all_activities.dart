import 'package:flutter/material.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard_relawan/views/detail_kegiatan.dart';

class AllActivitiesPage extends StatelessWidget {
  final List<Activity> activities;
  final String title;

  const AllActivitiesPage({
    super.key,
    required this.activities,
    required this.title, required activity, required isReminder, required onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.8,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: activities.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final activity = activities[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ActivityDetailPage(
                    activity: activity,
                    isReminder: false,
                    activities: activities,
                    title: title,
                    onSearchChanged: null,
                  ),
                ),
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Background image
                  Image.network(
                    activity.image,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),

                  // Overlay gradient (agar teks terbaca)
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  // Content
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity.title,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 14, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(
                              activity.date,
                              style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 14, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(
                              "10.00 - 16.00", // Waktu bisa disesuaikan
                              style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 14, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(
                              activity.location,
                              style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
