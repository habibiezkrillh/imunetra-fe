import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/main_navigation.dart';
import '../views/chat/chat_view.dart';
import '../views/chat/detail_chat_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // Root route with bottom navigation
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => const MainNavigationView(),
      routes: [
        // Nested Chat route
        GoRoute(
          path: 'chat',
          name: 'chat',
          builder: (context, state) => const ChatView(),
        ),
      ],
    ),

    // Global Detail Chat Route
    GoRoute(
      path: '/chat/detail/:name',
      name: 'chat-detail',
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? 'User';
        return DetailChatView(
          senderName: name,
          message: 'Halo, boleh tahu lebih dalam mengenai acaranya?',
        );
      },
    ),
  ],
);
