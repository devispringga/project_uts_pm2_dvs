import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tugas_1/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk durasi splash screen, misalnya 3 detik
    Timer(const Duration(seconds: 5), () {
      // Pindah ke halaman login setelah durasi selesai
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Image.asset(
          'assets/musikita.png',
          width: 350,
          height: 350,
        ),
      ),
    );
  }
}
