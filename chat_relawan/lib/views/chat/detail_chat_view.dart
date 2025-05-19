import 'package:flutter/material.dart';

class DetailChatView extends StatelessWidget {
  final String senderName;
  final String message;

  const DetailChatView({
    super.key,
    required this.senderName,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9EDFF), // Warna biru muda
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Ganti sesuai kebutuhan
            ),
            const SizedBox(width: 8),
            Text(
              senderName,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.black),
            onPressed: () {}, // Tambahkan aksi telpon jika perlu
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Pesan dari lawan bicara
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text("Halo, boleh tahu lebih dalam mengenai acaranya?"),
                      ),
                      const SizedBox(height: 4),
                      const Text("10:00", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Pesan dari user
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF339CFF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          "Selamat siang, Kak. Jadi nanti kita akan membersihkan sungai jeneberang",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("10:05", style: TextStyle(fontSize: 12, color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(Icons.done_all, size: 16, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF339CFF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          "Dari perusahaan Kakak sendiri apakah tertarik untuk mensponsori acara Kami?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("10:06", style: TextStyle(fontSize: 12, color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(Icons.done_all, size: 16, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Input chat
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                const Icon(Icons.attach_file_outlined),
                const SizedBox(width: 4),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ketik Pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.camera_alt_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
