import 'package:aplikasi_jasa_sewa_laptop/styles.dart';
import 'package:flutter/material.dart';
import 'laptop_model.dart'; 

class DetailPage extends StatelessWidget {
  final Laptop laptop;

  const DetailPage({super.key, required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Laptop", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Laptop
            SizedBox(
              height: 250,
              child: Image.asset(laptop.imagePath, fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(laptop.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(laptop.price, style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
                  const Divider(height: 32),
                  
                  const Text("Spesifikasi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(laptop.specs, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 16),
                  
                  const Text("Deskripsi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(laptop.description, style: const TextStyle(fontSize: 14, height: 1.5)),
                  
                  const SizedBox(height: 24),
                  const Text("Pilih Durasi Sewa", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  // Contoh pilihan durasi sederhana
                  Row(
                    children: [
                      _durationChip("1 Hari"),
                      _durationChip("3 Hari"),
                      _durationChip("7 Hari"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Color(0xFFEEEEEE)))),
        child: ElevatedButton(
          onPressed: () {
            // Logika proses sewa di sini
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkBlue,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("Sewa Sekarang", style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _durationChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(label: Text(label), backgroundColor: Colors.blue.shade50),
    );
  }
}