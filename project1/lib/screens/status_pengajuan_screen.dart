import 'package:flutter/material.dart';

import '../data/peminjaman_data.dart';
import '../models/peminjaman.dart';
import '../theme/app_colors.dart';
import '../widgets/info_card.dart';
import '../widgets/page_header.dart';
import '../widgets/status_badge.dart';
import '../widgets/unmuh_header.dart';
import 'form_pengajuan_screen.dart';

// BAB 7: daftar pengajuan dengan Create, Read, Update, Delete + empty state.
class StatusPengajuanScreen extends StatefulWidget {
  const StatusPengajuanScreen({super.key});

  @override
  State<StatusPengajuanScreen> createState() => _StatusPengajuanScreenState();
}

class _StatusPengajuanScreenState extends State<StatusPengajuanScreen> {
  void _pesan(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));
  }

  // Create
  Future<void> _tambah() async {
    final hasil = await Navigator.push<Peminjaman>(
      context,
      MaterialPageRoute(builder: (context) => const FormPengajuanScreen()),
    );
    if (hasil == null || !mounted) return;
    setState(() {
      PeminjamanData.simpan(hasil);
    });
    _pesan('Pengajuan "${hasil.kegiatan}" ditambahkan');
  }

  // Update
  Future<void> _ubah(Peminjaman data) async {
    final hasil = await Navigator.push<Peminjaman>(
      context,
      MaterialPageRoute(
        builder: (context) => FormPengajuanScreen(existing: data),
      ),
    );
    if (hasil == null || !mounted) return;
    setState(() {
      PeminjamanData.simpan(hasil);
    });
    _pesan('Pengajuan "${hasil.kegiatan}" diperbarui');
  }

  // Delete, dengan dialog konfirmasi
  Future<void> _hapus(Peminjaman data) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus pengajuan?'),
        content: Text('"${data.kegiatan}" akan dihapus.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (yakin != true || !mounted) return;
    setState(() {
      PeminjamanData.hapus(data.id);
    });
    _pesan('Pengajuan "${data.kegiatan}" dihapus');
  }

  StatusBadge _badge(String status) {
    switch (status) {
      case 'Disetujui':
        return const StatusBadge(
          label: 'Disetujui',
          background: Color(0xFFD9EBD3),
          foreground: Color(0xFF1B5E20),
        );
      case 'Ditolak':
        return const StatusBadge(
          label: 'Ditolak',
          background: Color(0xFFF5D5D2),
          foreground: Color(0xFFB3261E),
        );
      default:
        return const StatusBadge(
          label: 'Menunggu',
          background: Color(0xFFF6D9A8),
          foreground: Color(0xFF7A4B00),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = PeminjamanData.items;

    return Column(
      children: [
        const UnmuhHeader(),
        const PageHeader(title: 'Status pengajuan saya'),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                foregroundColor: AppColors.navy,
              ),
              onPressed: _tambah,
              icon: const Icon(Icons.add),
              label: const Text('Ajukan'),
            ),
          ),
        ),
        Expanded(
          // Empty state kalau list kosong, selain itu tampilkan daftar.
          child: data.isEmpty
              ? const Center(
                  child: Text(
                    'Belum ada pengajuan. Ketuk "Ajukan" untuk menambah.',
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final p = data[index];
                    final alasan =
                        p.alasan == null ? '' : ' · alasan: ${p.alasan}';
                    return InfoCard(
                      title: '${p.kegiatan} · ${p.tanggalText}',
                      subtitle:
                          '${p.ruangan} · ${p.jamMulai}–${p.jamSelesai}$alasan',
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _badge(p.status),
                          PopupMenuButton<String>(
                            onSelected: (aksi) {
                              if (aksi == 'ubah') _ubah(p);
                              if (aksi == 'hapus') _hapus(p);
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(value: 'ubah', child: Text('Ubah')),
                              PopupMenuItem(
                                value: 'hapus',
                                child: Text('Hapus'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
