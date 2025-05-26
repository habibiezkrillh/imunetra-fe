import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  static const List<Map<String, dynamic>> dummyChats = [
    {
      'name': 'Leonard',
      'message': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '10:00',
      'unread': false,
      'partner': false,
    },
    {
      'name': 'Astra',
      'message': 'Kami tertarik untuk berpartisipasi dalam acara tersebut.',
      'time': '09:30',
      'unread': true,
      'partner': true,
    },
    {
      'name': 'BNI',
      'message': 'Apakah ada proposal yang bisa dikirimkan?',
      'time': '08:45',
      'unread': true,
      'partner': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Semua'),
              Tab(text: 'Belum Dibaca'),
              Tab(text: 'Perusahaan Kerjasama'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatList(filter: 'all'),
            ChatList(filter: 'unread'),
            ChatList(filter: 'partner'),
          ],
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  final String filter;

  const ChatList({super.key, required this.filter});

  List<Map<String, dynamic>> getFilteredChats() {
    if (filter == 'unread') {
      return ChatView.dummyChats.where((chat) => chat['unread'] == true).toList();
    } else if (filter == 'partner') {
      return ChatView.dummyChats.where((chat) => chat['partner'] == true).toList();
    } else {
      return ChatView.dummyChats;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chats = getFilteredChats();

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(child: Text(chat['name'][0])),
          title: Text(chat['name']),
          subtitle: Text(chat['message']),
          trailing: Text(chat['time']),
          onTap: () {
            context.pushNamed(
              'chat-detail',
              pathParameters: {'name': chat['name']},
            );
          },
        );
      },
    );
  }
}
