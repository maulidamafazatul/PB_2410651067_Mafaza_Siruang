import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

// Bagian atas yang sama di semua screen setelah Beranda:
// judul oranye (+ kolom cari kalau diisi) di kiri, maskot Nimbus di kanan.
class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.searchHint,
    this.onSearchChanged,
  });

  final String title;
  final String? subtitle;
  final String? searchHint; // kalau diisi, kolom cari ikut tampil
  final ValueChanged<String>? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFEDEDED),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: const TextStyle(color: AppColors.navy, fontSize: 12),
                  ),
                ],
                if (searchHint != null) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      onChanged: onSearchChanged,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.search, color: AppColors.navy),
                        hintText: searchHint,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/maskot_nimbus.png',
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
