import 'package:flutter/material.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/views/detail_kegiatan.dart';

class AllActivitiesPage extends StatefulWidget {
  final String title;
  final List<Activity> activities;

  const AllActivitiesPage({
    super.key,
    required this.title,
    required this.activities,
  });

  @override
  State<AllActivitiesPage> createState() => _AllActivitiesPageState();
}

class _AllActivitiesPageState extends State<AllActivitiesPage> {
  List<Activity> filteredActivities = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredActivities = widget.activities;
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredActivities = widget.activities
          .where((activity) =>
              activity.title.toLowerCase().contains(searchQuery) ||
              activity.location.toLowerCase().contains(searchQuery) ||
              activity.date.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back),
                    onTap: () => Navigator.pop(context),
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const Opacity(
                    opacity: 0,
                    child: Icon(Icons.grid_view_rounded),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  hintText: 'Cari kegiatan...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFBEBEBE)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredActivities.isEmpty
                  ? const Center(child: Text("Tidak ada kegiatan ditemukan"))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredActivities.length,
                      itemBuilder: (context, index) {
                        final activity = filteredActivities[index];
                        return _buildActivityCard(activity);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(Activity activity) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityDetailPage(activity: activity, activityId: '',),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 16),
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(activity.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.65), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white, size: 14),
                      const SizedBox(width: 6),
                      Text(activity.date, style: const TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.white, size: 14),
                      const SizedBox(width: 6),
                      Text(activity.time ?? "08.00 WITA", style: const TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.white, size: 14),
                      const SizedBox(width: 6),
                      Text(activity.location, style: const TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.people, size: 14, color: Colors.white),
                    const SizedBox(width: 6),
                    Text(
                      "${activity.participantCount}/${activity.capacity}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
