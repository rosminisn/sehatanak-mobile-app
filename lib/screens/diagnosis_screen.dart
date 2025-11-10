import 'package:flutter/material.dart';
import '../main.dart';

class DiagnosisScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const DiagnosisScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors['background'],
      appBar: AppBar(
        backgroundColor: colors['white'],
        title: const Text("Hasil Diagnosa Pertumbuhan",
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => onNavigate('home'),
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInfoRow("Status", "Risiko Stunting Rendah"),
            _buildInfoRow("Interpretasi", "Pertumbuhan anak sesuai standar WHO."),
            const SizedBox(height: 16),
            _buildChart(),
            _buildRecommendation(),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          const Text(":", style: TextStyle(fontSize: 14)),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors['white'],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        children: const [
          Text(
            "Grafik Pertumbuhan (Tinggi Vs Usia / Berat Vs Usia)",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3B82F6)),
          ),
          SizedBox(height: 16),
          Icon(Icons.bar_chart, size: 80, color: Color(0xFF64748B)),
          Text("Baby Growth Chart for Girls: Head Circumference",
              style: TextStyle(color: Color(0xFF64748B), fontSize: 14)),
          SizedBox(height: 8),
          Text("Source: WHO Child Growth Standards",
              style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildRecommendation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors['white'],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rekomendasi:",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3B82F6))),
          SizedBox(height: 8),
          Text("Pertahankan pola makan dan pemantauan rutin",
              style: TextStyle(fontSize: 14, height: 1.6)),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () => onNavigate('education'),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF3B82F6)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minimumSize: const Size.fromHeight(48),
          ),
          child: const Text("Lihat Artikel Edukasi Terkait",
              style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors['primary'],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Simpan Riwayat",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: () => onNavigate('home'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF3B82F6)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Kembali ke Beranda",
                    style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
