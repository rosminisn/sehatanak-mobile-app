import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final Map<String, dynamic>? childData;

  const HomeScreen({
    super.key, 
    required this.onNavigate,
    this.childData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildStatusCard(),
                    _buildExploreSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('👋', style: TextStyle(fontSize: 28)),
                  const SizedBox(width: 8),
                  const Text(
                    'Halo, Hamdan!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '"Bagaimana pertumbuhan [Nama Anak] hari ini?"',
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
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
          children: [
            _buildStatusItem(
              icon: '📊',
              label: 'Status',
              value: childData?['status'] ?? 'Resiko Stunting Rendah',
              valueColor: const Color(0xFF10B981),
            ),
            _buildStatusItem(
              icon: '📅',
              label: 'Usia',
              value: childData?['usia'] ?? '2 Tahun 3 Bulan',
            ),
            _buildStatusItem(
              icon: '⚖️',
              label: 'Berat',
              value: childData?['berat'] ?? '12 kg',
            ),
            _buildStatusItem(
              icon: '📏',
              label: 'Tinggi',
              value: childData?['tinggi'] ?? '85 cm',
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem({
    required String icon,
    required String label,
    required String value,
    Color? valueColor,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? const Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            color: Color(0xFFE2E8F0),
          ),
      ],
    );
  }

  Widget _buildExploreSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Explore',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildExploreCard(
                icon: '📈',
                title: 'Data Pertumbuhan',
                onTap: () => onNavigate('input'),
              ),
              _buildExploreCard(
                icon: '🔍',
                title: 'Edukasi Gizi',
                onTap: () => onNavigate('education'),
              ),
              _buildExploreCard(
                icon: '📋',
                title: 'Hasil Diagnosa',
                onTap: () => onNavigate('diagnosis'),
              ),
              _buildExploreCard(
                icon: '👶',
                title: 'Profil Anak',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildExploreCard({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}