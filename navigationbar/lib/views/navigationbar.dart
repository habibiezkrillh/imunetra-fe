import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  final String location;

  const CustomNavBar({super.key, required this.location});

  int _getIndexFromLocation() {
    switch (location) {
      case '/':
        return 0;
      case '/chat':
        return 1;
      case '/riwayat':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/chat');
        break;
      case 2:
        context.go('/riwayat');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _getIndexFromLocation();

    final icons = [
      Icons.home,
      Icons.chat_bubble_outline,
      Icons.history,
      Icons.person,
    ];

    final labels = [
      'Home',
      'Pesan',    // Ganti "Chat" jadi "Pesan" sesuai gambar
      'Riwayat',
      'Profil',   // Ganti "Profile" jadi "Profil"
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => _onTap(context, index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icons[index],
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
                const SizedBox(height: 4),
                Text(
                  labels[index],
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
