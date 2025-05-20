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
      appBar: AppBar(
        title: Text(senderName),
      ),
      body: Container(
        color: const Color(0xFFE5F2FF), // warna latar belakang seperti desainmu
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const ChatBubble(
              isSender: false,
              text: 'Halo, boleh tahu lebih dalam mengenai acaranya?',
              time: '10:00',
            ),
            const ChatBubble(
              isSender: true,
              text: 'Selamat siang, Kak. Jadi nanti kita akan membersihkan sungai jenebrang',
              time: '10:05',
            ),
            const ChatBubble(
              isSender: true,
              text: 'Dari perusahaan Kakak sendiri apakah tertarik untuk mensponsori acara Kami?',
              time: '10:06',
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String text;
  final String time;

  const ChatBubble({
    super.key,
    required this.isSender,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? const Color(0xFF88C9FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
