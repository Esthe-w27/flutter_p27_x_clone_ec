import 'package:flutter/material.dart';
import 'package:x_clone_ec/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clone X',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFFFFF))),
      home: const LoginPage(),
    );
  }
}
