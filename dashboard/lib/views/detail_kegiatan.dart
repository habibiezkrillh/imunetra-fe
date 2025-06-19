import 'package:dashboard/bloc/list_pasien/list_data_bloc.dart';
import 'package:dashboard/bloc/reminder_card/reminder_bloc.dart';
import 'package:dashboard/bloc/reminder_card/reminder_event.dart';
import 'package:dashboard/repository/list_pasien/list_data_repo.dart';
import 'package:dashboard/services/list_pasien/list_data_services.dart';
import 'package:dashboard/views/list_data_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard/model/dashboard/user_model.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity activity;
  final bool isReminder;

  const ActivityDetailPage({
    super.key,
    required this.activity,
    this.isReminder = false, required List activities, required String title, required onSearchChanged,
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
            // Gambar + back
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
                    Text("Lokasi: ${activity.location}", style: textStyle),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(activity.title, style: titleStyle, overflow: TextOverflow.ellipsis),
                        ),
                        const Icon(Icons.people, color: Color(0xFF5588FF), size: 20),
                        const SizedBox(width: 4),
                        Text('${activity.participantCount}/${activity.capacity}', style: textStyle),
                      ],
                    ),
                    const SizedBox(height: 16),
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
                        Text(activity.time, style: textStyle),
                      ],
                    ),
                    const SizedBox(height: 20),
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

            // Footer dinamis
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
              ),
              child: isReminder
                  ? _buildReminderFooter(context)
                  : _buildRegisterFooter(context),
            ),
          ],
        ),
      ),
    );
  }

  // Tombol "Daftar"
  Widget _buildRegisterFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Info slot
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
                        context.read<ReminderBloc>().add(AddReminder(activity));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Berhasil mendaftar!', style: GoogleFonts.poppins()),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
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
          icon: const Icon(Icons.check_circle, size: 22, color: Colors.white),
          label: Text(
            "Daftar",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5588FF),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }

  // Tombol "Input Data Pasien"
  Widget _buildReminderFooter(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => ListPasienBloc(PasienRepo(PasienService()))..add(FetchPasienEvent()),
                child: ListDataPasien(selectedFilter: '',onSearchChanged: (String ) {  }, onFilterChanged: (String ) {  }, onAddPatient: () {  },),
              ),
            ),
          );
        },
        icon: const Icon(Icons.note_add, size: 22, color: Colors.white),
        label: Text(
          "Input Data Pasien",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF5588FF),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
