import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

// Kartu informasi: dipakai di Jadwal, Ruang Kosong, dan Status Pengajuan.
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayCard,
      elevation: 3,
      shadowColor: Colors.black26,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Color(0xFF6B6B6B)),
        ),
        trailing: trailing,
      ),
    );
  }
}
