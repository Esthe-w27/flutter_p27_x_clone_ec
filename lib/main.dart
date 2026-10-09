import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_clone_ec/pages/login_page.dart';
import 'package:x_clone_ec/pages/home.dart';

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
      home: FutureBuilder<bool?>(
        future: SharedPreferencesAsync().getBool('estConnecte'),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return (snapshot.data ?? false) ? const Home() : const LoginPage();
        },
      ),
    );
  }
}
