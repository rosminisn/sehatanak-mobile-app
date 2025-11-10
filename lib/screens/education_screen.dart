import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const EducationScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final articles = [
      {
        "title": "Tips MPASI Bergizi",
        "preview":
            "Memasuki usia si kecil yang ke 6 bulan, tentunya Parents sedang bersiap menyambut masa pemberian MPASI alias makanan pendamping ASI...",
      },
      {
        "title": "Pentingnya Air Minum Cukup",
        "preview":
            "Air merupakan komponen vital yang menunjang berbagai fungsi tubuh. Bagi orang dewasa, asupan air yang cukup penting untuk menjaga metabolisme...",
      },
      {
        "title": "Ciri Awal Anak Kekurangan Gizi",
        "preview":
            "Fase MPASI adalah momen yang mendebarkan bagi banyak ibu. Rasanya campur aduk—antara antusias karena si kecil mulai mengenal makanan padat...",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Edukasi Gizi & Stunting",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => onNavigate('home'),
        ),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Daftar Artikel / Kartu Informasi",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...articles.map((article) => _buildArticleCard(
                article['title']!,
                article['preview']!,
              )),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Color(0xFF64748B), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Cari",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
              ),
            ),
          ),
          Icon(Icons.mic, color: Color(0xFF64748B), size: 20),
        ],
      ),
    );
  }

  Widget _buildArticleCard(String title, String preview) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            preview,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              "Lihat Detail",
              style: TextStyle(
                color: Color(0xFF3B82F6),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
