import 'package:flutter/material.dart';

import '../data/peminjaman_data.dart';
import '../models/peminjaman.dart';
import '../theme/app_colors.dart';
import '../widgets/info_card.dart';
import '../widgets/page_header.dart';
import '../widgets/unmuh_header.dart';
import 'form_pengajuan_screen.dart';

// Satu baris jadwal. terisi = true berarti ruangan sedang dipakai (tanda centang),
// terisi = false berarti kosong dan bisa diajukan (tanda plus).
class _Jadwal {
  const _Jadwal(
    this.ruang,
    this.jam,
    this.dosen,
    this.matkul, {
    this.terisi = true,
  });

  final String ruang;
  final String jam;
  final String dosen;
  final String matkul;
  final bool terisi;
}

// Data mock (fiktif), disesuaikan dengan desain Figma.
const List<_Jadwal> _kemarin = [
  _Jadwal('B.101', '07:00–08:40', 'Pak Budi', 'Algoritma'),
  _Jadwal('B.104', '09:00–10:40', 'Pak Satrio', 'IoT', terisi: false),
];

const List<_Jadwal> _hariIni = [
  _Jadwal('B.101', '07:00–08:40', 'Pak Budi', 'Algoritma'),
  _Jadwal('B.101', '09:00–10:40', 'Pak Agung', 'IoT'),
  _Jadwal('B.102', '07:00–08:40', 'Pak Dasuki', 'Web Dasar', terisi: false),
  _Jadwal('B.102', '09:00–10:40', 'Pak Budi', 'Algoritma'),
  _Jadwal('B.103', '07:00–08:40', 'Pak Bagus', 'Web Lanjut'),
  _Jadwal('B.103', '09:00–10:40', 'Pak Ari', 'IoT'),
  _Jadwal('B.105', '07:00–08:40', 'Pak Rimba', 'English'),
  _Jadwal('B.107', '08:00–09:40', 'Pak Leo', 'Basis Data', terisi: false),
];

const List<_Jadwal> _besok = [
  _Jadwal('B.101', '07:00–08:40', 'Pak Agung', 'IoT'),
  _Jadwal('B.105', '09:00–10:40', 'Pak Rimba', 'English'),
  _Jadwal('B.107', '08:00–09:40', 'Pak Leo', 'Basis Data', terisi: false),
];

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({super.key});

  @override
  State<JadwalScreen> createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  // 0 = Kemaren, 1 = Hari ini, 2 = Besok, 3 = tanggal pilihan sendiri
  int _selectedDay = 1;
  String _query = '';
  String? _tanggalPilihan;

  final List<String> _labels = const ['Kemaren', 'Hari ini', 'Besok'];

  // Data yang tampil: sesuai hari yang dipilih, lalu disaring oleh kolom cari.
  List<_Jadwal> get _data {
    List<_Jadwal> sumber;
    switch (_selectedDay) {
      case 0:
        sumber = _kemarin;
        break;
      case 1:
        sumber = _hariIni;
        break;
      case 2:
        sumber = _besok;
        break;
      default:
        sumber = const [];
    }
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return sumber;
    return sumber
        .where(
          (j) => '${j.ruang} ${j.dosen} ${j.matkul}'.toLowerCase().contains(q),
        )
        .toList();
  }

  Future<void> _pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2028),
    );
    if (hasil == null) return;
    setState(() {
      _selectedDay = 3;
      _tanggalPilihan =
          '${hasil.day.toString().padLeft(2, '0')}-'
          '${hasil.month.toString().padLeft(2, '0')}-${hasil.year}';
    });
  }

  // Tanda plus pada ruangan kosong membuka form pengajuan.
  Future<void> _ajukan() async {
    final hasil = await Navigator.push<Peminjaman>(
      context,
      MaterialPageRoute(builder: (context) => const FormPengajuanScreen()),
    );
    if (hasil == null || !mounted) return;
    PeminjamanData.simpan(hasil);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Pengajuan "${hasil.kegiatan}" terkirim. Lihat di tab Pengajuan.',
        ),
      ),
    );
  }

  Widget _chip(String label, int index) {
    final aktif = _selectedDay == index;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: aktif ? Colors.white : Colors.black,
        ),
      ),
      selected: aktif,
      showCheckmark: false,
      selectedColor: AppColors.orange,
      backgroundColor: const Color(0xFFEDEDED),
      side: BorderSide.none,
      shape: const StadiumBorder(),
      onSelected: (_) {
        setState(() {
          _selectedDay = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _data;

    return Column(
      children: [
        const UnmuhHeader(),
        PageHeader(
          title: 'Jadwal Ruangan',
          searchHint: 'cari ruangan',
          onSearchChanged: (value) {
            setState(() {
              _query = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < _labels.length; i++) _chip(_labels[i], i),
              ActionChip(
                avatar: Icon(
                  Icons.calendar_month_outlined,
                  size: 18,
                  color: _selectedDay == 3 ? Colors.white : Colors.black,
                ),
                label: Text(
                  _tanggalPilihan ?? 'pilih',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _selectedDay == 3 ? Colors.white : Colors.black,
                  ),
                ),
                backgroundColor: _selectedDay == 3
                    ? AppColors.orange
                    : const Color(0xFFEDEDED),
                side: BorderSide.none,
                shape: const StadiumBorder(),
                onPressed: _pilihTanggal,
              ),
            ],
          ),
        ),
        Expanded(
          child: data.isEmpty
              ? const Center(
                  child: Text('Belum ada jadwal untuk pilihan ini.'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final j = data[index];
                    return InfoCard(
                      title: '${j.ruang} · ${j.jam}',
                      subtitle: '${j.dosen} · ${j.matkul}',
                      trailing: j.terisi
                          ? const Icon(Icons.check, color: AppColors.navy)
                          : IconButton(
                              icon: const Icon(Icons.add, color: AppColors.navy),
                              tooltip: 'Ajukan peminjaman',
                              onPressed: _ajukan,
                            ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
