# SiRuang

## Deskripsi
Siruang (Aplikasi papan jadwal digital yang berfungsi memberikan informasi ruangan kosong di gedung B)

## Identitas
Nama: Mafaza
NIM: 2410651067

## Versi
v0.0 - Prototype

## Fitur Prototype v0.0
- Menampilkan nama aplikasi
- Menampilkan deskripsi aplikasi
- Menampilkan identitas pengembang
- Menampilkan target pengguna
- Menampilkan tombol interaktif sederhana dengan SnackBar

## Cara Menjalankan
flutter pub get
flutter run -d chrome

## Catatan Kendala
-

## Catatan Penggunaan AI
-Tool AI yang Digunakan [Gemini]
-Peran AI [explainer]
-Tujuan Penggunaan [memahami struktrur proyek standard flutter]
-Bagian yang Dibantu [struktur flutter]
-Saran AI yang Digunakan [beberapa struktur dari ppt berbeda dengan isi new folder create yg kita buat]
-Modifikasi atau Verifikasi Mahasiswa [memahami perbedaan tersebut]
-Bagian yang Dipahami[build ada ketika project sudah di running]
-Status Akhir [berhasil]

# SIRUANG (Sistem Informasi Ruangan)

  ## Deskripsi
  SIRUANG adalah aplikasi prototype untuk membantu mahasiswa Universitas Muhammadiyah Jember dalam memantau jadwal perkuliahan secara real-time dan mengecek ketersediaan ruangan kosong di Gedung B.

  ## Milestone Saat Ini
  UI Blueprint

  ## Versi
  UI Blueprint - Design Milestone BAB 4

  ## Ringkasan UI Blueprint
- Splash Screen
- Login & Guest Access
- Beranda (Dashboard Statistik)
- Jadwal Ruangan
- Ruang Kosong Hari Ini

  ## Style Guide Singkat
- Warna utama: Navy / Biru Gelap / #253C6D / #1D3557
- Warna aksen: Oranye / #E89951
- Warna pendukung: Putih, abu-abu terang (#F2F2F2)
- Tombol utama: Rounded Button (Radius 10px) warna Oranye
- Tipografi: Poppins & Inter
- Touch target: Full-width button dengan ukuran nyaman disapu jempol

  ## Accessibility Dasar
- Teks mudah dibaca
- Tombol cukup besar
- Warna teks dan latar cukup kontras
- Alur screen maju dan kembali jelas

  ## Artefak Desain
  Wireframe dan style guide disimpan pada folder docs/ui-blueprint/.

  ## Catatan Penggunaan AI
  AI digunakan sebagai mitra berpikir (thought partner) untuk brainstorming alur UX, susunan statistik dashboard, serta review keterbacaan layout.

  # SIRUANG (Sistem Informasi Ruangan) Gedung B

Aplikasi Flutter untuk memantau jadwal ruang kelas Gedung B Universitas Muhammadiyah Jember, mengecek ruang kosong, dan mengajukan peminjaman ruangan. Pengguna sasaran: mahasiswa dan pengurus Ormawa.

- Nama: Mafaza | NIM: 2410651067 | Kelas: [isi]
- Mata kuliah: Pemrograman Bergerak (MJU.TIK.025)
- Versi: **v0.3 - Data Module**

## Fitur

- Navigasi 4 tab: Beranda, Jadwal, Kosong, Pengajuan
- Jadwal ruangan dengan pencarian dan pilihan hari
- Form pengajuan dengan validasi (BAB 6)
- CRUD pengajuan peminjaman, empty state, dan SnackBar (BAB 7)

## Data Module

**Model `Peminjaman`:** id, kegiatan, ruangan, tanggal, jamMulai, jamSelesai, status, alasan.

**Sumber data:** mock data di memori (`lib/data/peminjaman_data.dart`). Data tidak permanen dan kembali ke data awal saat aplikasi dimuat ulang. Semua data fiktif.

**Alur CRUD:** Create lewat tombol Ajukan dan form, Read lewat `ListView.builder`, Update lewat menu titik tiga lalu Ubah, Delete lewat menu titik tiga lalu Hapus dengan dialog konfirmasi. Daftar kosong menampilkan empty state.

**Validasi form:** nama kegiatan wajib dan minimal 3 karakter; ruangan, tanggal, dan jam wajib diisi; jam selesai harus setelah jam mulai.

## Catatan Keamanan dan Keterbatasan

- Data fiktif, tanpa data pribadi asli, tanpa API key atau credential.
- Login masih simulasi. Jadwal dan statistik Beranda masih data tetap.
- Unggah KTM masih placeholder.