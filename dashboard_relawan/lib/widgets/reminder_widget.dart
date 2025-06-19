import 'package:dashboard_relawan/bloc/reminder_card/reminder_bloc.dart';
import 'package:dashboard_relawan/bloc/reminder_card/reminder_state.dart';
import 'package:dashboard_relawan/views/detail_kegiatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';

class ReminderCard extends StatelessWidget {
  final VoidCallback onTap;

  const ReminderCard({super.key, required this.onTap, required bool hasReminder, Activity? latestReminder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderBloc, ReminderState>(
      builder: (context, state) {
        if (state is ReminderLoaded && state.reminders.isNotEmpty) {
          final Activity latest = state.reminders.last;
          return buildReminder(context, latest, true);
        } else {
          return buildReminder(context, null, false);
        }
      },
    );
  }

  Widget buildReminder(BuildContext context, Activity? activity, bool hasReminder) {
  return Center(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5588FF), Color(0xFF7BAEFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.notifications_active, color: Colors.white, size: 36),
              const SizedBox(width: 16),
              Expanded(
                child: hasReminder
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pengingat Kegiatan',
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(activity!.title,
                              style: const TextStyle(color: Colors.white, fontSize: 15)),
                          Text(activity.date,
                              style: const TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      )
                    : const Text(
                        'Belum mendaftar di kegiatan apapun,\nYuk daftar!',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (hasReminder)
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ActivityDetailPage(
                        activity: activity!,
                        isReminder: true, activities: [], title: '', onSearchChanged: null,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.assignment, color: Colors.black),
                label: const Text(
                  "Input Data Pasien",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
}