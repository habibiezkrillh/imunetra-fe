import 'package:flutter/material.dart';

class DetailChatView extends StatefulWidget {
  final String senderName;
  final String message;

  const DetailChatView({
    super.key,
    required this.senderName,
    required this.message,
  });

  @override
  State<DetailChatView> createState() => _DetailChatViewState();
}

class _DetailChatViewState extends State<DetailChatView> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, dynamic>> _messages = [
    {
      'isMe': false,
      'text': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '10:00',
    },
    {
      'isMe': true,
      'text': 'Selamat siang, Kak. Jadi nanti kita akan membersihkan sungai jeneberang',
      'time': '10:05',
    },
    {
      'isMe': true,
      'text': 'Dari perusahaan Kakak sendiri apakah tertarik untuk mensponsori acara Kami?',
      'time': '10:06',
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'isMe': true,
        'text': _messageController.text.trim(),
        'time': TimeOfDay.now().format(context),
      });
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 8),
            Text(widget.senderName),
          ],
        ),
        actions: const [
          Icon(Icons.call),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFFE0F2FE), // Latar biru muda
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isMe = msg['isMe'] as bool;

                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        msg['text'],
                        style: TextStyle(color: isMe ? Colors.white : Colors.black87),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketik Pesan...',
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                  color: Colors.blue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
