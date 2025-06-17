import 'package:dashboard_relawan/bloc/dashboard/dashboard_bloc.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_event.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_state.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/views/all_activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(RepositoryProvider.of(context))..add(LoadActivities()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DashboardLoaded) {
                  final activities = state.activities;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Halo Aurel',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('Selamat Datang Kembali'),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: 'Cari kegiatan...',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: const Color.fromARGB(255, 190, 190, 190)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF5588FF), Color(0xFF7BAEFF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.notifications_active, color: Colors.white, size: 36),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Pengingat Kegiatan', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text("Desa Sehat ta'", style: TextStyle(color: Colors.white, fontSize: 15)),
                                  Text('Jumat, 20 Juli 2025', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kegiatan Bulan Juni', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllActivitiesPage(
                                    title: 'Kegiatan Bulan Juni', // ← sesuai judul yang tampil
                                    activities: activities,       // ← kirim data yang sama
                                  ),
                                ),
                              );
                            },
                            child: Text('Lihat Semua', style: TextStyle(fontSize: 14, color: Colors.blue)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: activities.length,
                          itemBuilder: (context, index) {
                            return _buildCard(activities[index]);
                          },
                        ),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kegiatan Disekitarmu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllActivitiesPage(
                                    title: 'Kegiatan Disekitar anda', // ← sesuai judul yang tampil
                                    activities: activities,       // ← kirim data yang sama
                                  ),
                                ),
                              );
                            },
                            child: Text('Lihat Semua', style: TextStyle(fontSize: 14, color: Colors.blue)),
                          ),

                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: activities.length,
                          itemBuilder: (context, index) {
                            return _buildCard(activities[index]);
                          },
                        ),
                      ),
                    ],
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

  Widget _buildCard(Activity activity) {
    return Container(
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
          gradient: LinearGradient(
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
              backgroundColor: Color.fromARGB(183, 84, 124, 246),
              label: Text(
                activity.date,
                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700), // pastikan warna teks kontras
              ),
            ),            Spacer(),
            Text(activity.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}