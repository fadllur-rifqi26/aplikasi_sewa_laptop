import 'package:aplikasi_jasa_sewa_laptop/data_laptop/detail_page.dart';
import 'package:aplikasi_jasa_sewa_laptop/data_laptop/laptop_model.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
Widget build(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(
        fontFamily: 'Outfit', 
      ),
    ),
    child: Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(),
              const SizedBox(height: 24),

              _buildPromoBanner(),
              const SizedBox(height: 24),

              _buildFilterScroll(),
              const SizedBox(height: 24),

              const Text(
                "Laptop Tersedia Sekarang",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              _buildProductGrid(),
              const SizedBox(height: 24),

              _buildActiveRentalStatus(),
              const SizedBox(height: 80), 
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    ),
    );
  }


  Widget _buildHeader() {
    return Row(
      children: [
        const Icon(Icons.laptop_mac, color: Colors.blue, size: 30),
        const SizedBox(width: 8),
        const Text(
          "SewaLaptop",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Cari laptop...",
                prefixIcon: Icon(Icons.search, size: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.notifications_none, color: Colors.blue),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/images/pp.png'),
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4A90E2), Color(0xFF5AB9EA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sewa laptop cepat, siap pakai",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("Mulai dari Rp50.000/hari", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Sewa Sekarang"),
                ),
              ],
            ),
          ),
          const Icon(Icons.laptop, size: 80, color: Colors.white),
        ],
      ),
    );
  }


  Widget _buildFilterScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _filterChip("Harga", hasDropdown: true),
          _filterChip("RAM"),
          _filterChip("Brand"),
          _filterChip("Termurah", hasDropdown: true),
        ],
      ),
    );
  }

  Widget _filterChip(String label, {bool hasDropdown = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          if (hasDropdown) const Icon(Icons.keyboard_arrow_down, size: 16),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
  List<Laptop> listLaptop = [
    Laptop(
      name: "ThinkPad T14 Gen 3",
      specs: "i5, 16GB, SSD 512GB",
      price: "Rp120.000",
      imagePath: "assets/images/laptop_thinkpad.png", 
      description: "Laptop bisnis tangguh.",
    ),
    Laptop(
      name: "MacBook Air M1",
      specs: "Apple M1, 8GB, 256GB",
      price: "Rp150.000",
      imagePath: "assets/images/laptop_mac.png",
      description: "Ringan dan bertenaga.",
    ),
    Laptop(
      name: "ROG Strix G15",
      specs: "i7, 16GB, SSD 1TB",
      price: "Rp200.000",
      imagePath: "assets/images/laptop_rog.png", 
      description: "Laptop gaming performa tinggi.",
    ),
    Laptop(
      name: "HP ProBook 450 G8",
      specs: "i5, 16GB, SSD 512GB",
      price: "Rp120.000",
      imagePath: "assets/images/laptop_hp.png", 
      description: "Laptop bisnis tangguh.",
    ),
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: listLaptop.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  childAspectRatio: 0.6, 
  mainAxisSpacing: 16,
  crossAxisSpacing: 16,
),
    itemBuilder: (context, index) {
      return ProductCard(laptop: listLaptop[index]);
    },
  );
}

  Widget _buildActiveRentalStatus() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(128), blurRadius: 10)],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE3F2FD),
            child: Icon(Icons.info_outline, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sedang disewa: ThinkPad X1 Carbon", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Sisa waktu: 2 hari", style: TextStyle(color: Colors.blue, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Detail", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Cari"),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Pesanan"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Laptop laptop;

  const ProductCard({super.key, required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(128),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                laptop.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),

          Text(
            laptop.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            laptop.specs,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
            maxLines: 1,
          ),
          const SizedBox(height: 8),

          Text(
            "${laptop.price}/hari",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 10),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tersedia", style: TextStyle(color: Colors.green, fontSize: 10)),
              SizedBox(
                height: 30, 
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(laptop: laptop)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text(
                    "Sewa",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}