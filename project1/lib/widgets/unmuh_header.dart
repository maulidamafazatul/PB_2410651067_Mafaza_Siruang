import 'package:flutter/material.dart';

// Banner kampus di bagian atas layar (gambar dari Figma).
class UnmuhHeader extends StatelessWidget {
  const UnmuhHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/header_unmuh.png',
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}