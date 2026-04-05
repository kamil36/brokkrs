import 'package:brokkrs/app_pages.dart';
import 'package:brokkrs/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brokkrs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/otp': (context) => const VerifyOtpPage(),
        '/home': (context) => const HomeShell(),
        '/chat-detail': (context) => const ChatDetailPage(),
        '/profile-edit': (context) => const EditProfilePage(),
        '/notifications': (context) => const NotificationsPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
