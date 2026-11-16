import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'beranda_screen.dart';
import 'jadwal_screen.dart';
import 'ruang_kosong_screen.dart';
import 'status_pengajuan_screen.dart';

// Rangka aplikasi setelah login: 4 tab di menu bawah.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final List<Widget> _pages = const [
    BerandaScreen(),
    JadwalScreen(),
    RuangKosongScreen(),
    StatusPengajuanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Hanya halaman aktif yang dibangun, jadi daftar Pengajuan
        // selalu membaca data terbaru setiap tab dibuka.
        child: _pages[_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.navy,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (int i) {
          setState(() {
            _index = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room_outlined),
            label: 'Kosong',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Pengajuan',
          ),
        ],
      ),
    );
  }
}
