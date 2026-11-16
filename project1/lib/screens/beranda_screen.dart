import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/stat_card.dart';
import '../widgets/unmuh_header.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UnmuhHeader(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ---- Kartu Selamat Datang ----
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.grayCard,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'SELAMAT DATANG di',
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Image.asset('assets/images/logo_siruang.png',
                              width: 56),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'SIRUANG (Sistem Informasi Ruangan) adalah platform '
                        'digital terpadu Gedung B Universitas Muhammadiyah '
                        'Jember. Aplikasi ini memudahkan mahasiswa untuk '
                        'memantau penggunaan kelas secara real-time, mengecek '
                        'ketersediaan ruangan kosong, serta mengajukan '
                        'peminjaman ruangan untuk kegiatan perkuliahan maupun '
                        'organisasi mahasiswa (Ormawa) secara cepat dan '
                        'transparan.',
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: Image.asset('assets/images/maskot_nimbus.png',
                            height: 120),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // ---- Header Statistik (dengan gradasi) ----
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [AppColors.navy, Color(0xFFE3EEFB)],
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Statistik Hari ini',
                        style: TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rabu, 20 Januari 2025 - Gedung B',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // ---- Panel abu berisi 4 kartu angka ----
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.grayCard,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.6,
                    children: const [
                      StatCard(value: '12', label: 'Total Jadwal'),
                      StatCard(value: '7', label: 'Berlangsung'),
                      StatCard(value: '3', label: 'Libur'),
                      StatCard(value: '2', label: 'Selesai'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}