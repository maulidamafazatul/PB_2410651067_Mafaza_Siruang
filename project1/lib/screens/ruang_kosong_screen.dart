import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/info_card.dart';
import '../widgets/page_header.dart';
import '../widgets/unmuh_header.dart';
import '../data/peminjaman_data.dart';
import '../models/peminjaman.dart';
import 'form_pengajuan_screen.dart';

class RuangKosongScreen extends StatelessWidget {
  const RuangKosongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UnmuhHeader(),
        const PageHeader(
          title: 'Ruang Kosong Hari ini',
          subtitle: 'Rabu, 20 Januari 2025 - Gedung B',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const InfoCard(
                title: 'B.104 · 07:00–08:40',
                subtitle: 'Pak Satrio · IoT',
                trailing: Icon(Icons.cancel_outlined),
              ),
              const InfoCard(
                title: 'B.104 · 09:00–10:40',
                subtitle: 'Pak Muhtar · IoT',
                trailing: Icon(Icons.cancel_outlined),
              ),
              const InfoCard(
                title: 'B.105 · 09:00–10:40',
                subtitle: 'Pak Basuki · IoT',
                trailing: Icon(Icons.cancel_outlined),
              ),
              const SizedBox(height: 24),
              const Text(
                'Ingin menggunakan ruang kosong?',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  foregroundColor: AppColors.navy,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () async {
                  final hasil = await Navigator.push<Peminjaman>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormPengajuanScreen(),
                    ),
                  );
                  if (hasil == null || !context.mounted) return;
                  PeminjamanData.simpan(hasil);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Pengajuan "${hasil.kegiatan}" terkirim. Lihat di tab Pengajuan.',
                      ),
                    ),
                  );
                },
                child: const Text('Ajukan Peminjaman'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
