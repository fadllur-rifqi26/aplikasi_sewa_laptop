import 'package:aplikasi_jasa_sewa_laptop/widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_jasa_sewa_laptop/database/app_db.dart'; // sesuaikan package name anda

// Buat instance database global
late AppDatabase database;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  database = AppDatabase(); // Inisialisasi di sini
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
