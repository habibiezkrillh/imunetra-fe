import 'package:dashboard_relawan/bloc/reminder_card/reminder_bloc.dart';
import 'package:dashboard_relawan/bloc/reminder_card/reminder_state.dart';
import 'package:dashboard_relawan/views/detail_kegiatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_bloc.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_event.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_state.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/views/all_activities.dart';
import 'package:dashboard_relawan/widgets/reminder_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return BlocProvider<DashboardBloc>(
      create: (_) => DashboardBloc(RepositoryProvider.of(context))..add(LoadActivities()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DashboardLoaded) {
                  return BlocBuilder<ReminderBloc, ReminderState>(
                    builder: (context, reminderState) {
                      List<Activity> reminders = [];
                      if (reminderState is ReminderLoaded) {
                        reminders = reminderState.reminders as List<Activity>;
                      }

                      final filteredActivities = state.filteredActivities;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage('assets/images/profile.jpg'),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Halo Aurel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  Text('Selamat Datang Kembali'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              context.read<DashboardBloc>().add(SearchActivities(value));
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search, color: Colors.black),
                              hintText: 'Cari kegiatan...',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              contentPadding: const EdgeInsets.symmetric(vertical: 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 190, 190, 190)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          /// Reminder Card
                          ReminderCard(
                            onTap: () {
                              if (reminders.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ActivityDetailPage(
                                      activity: reminders.last,
                                      isReminder: true, activities: [], title: '', onSearchChanged: null,
                                    ),
                                  ),
                                );
                              }
                            },
                            hasReminder: reminders.isNotEmpty,
                            latestReminder: reminders.isNotEmpty ? reminders.last : null,
                          ),

                          const SizedBox(height: 24),
                          _buildSection(context, 'Kegiatan Bulan Juni', filteredActivities),
                          const SizedBox(height: 28),
                          _buildSection(context, 'Kegiatan Disekitarmu', filteredActivities),
                        ],
                      );
                    },
                  );
                } else if (state is DashboardError) {
                  return Center(child: Text(state.message));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Activity> activities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllActivitiesPage(
                      activities: activities,
                      title: title, activity: null, isReminder: null, onSearchChanged: null,
                    ),
                  ),
                );
              },
              child: const Text('Lihat Semua', style: TextStyle(fontSize: 14, color: Colors.blue)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: activities.length,
            itemBuilder: (context, index) => _buildCard(context, activities[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, Activity activity) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ActivityDetailPage(
              activity: activity,
              isReminder: false, activities: [], title: '', onSearchChanged: null,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(activity.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Chip(
                backgroundColor: const Color.fromARGB(183, 84, 124, 246),
                label: Text(
                  activity.date,
                  style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              const Spacer(),
              Text(activity.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
