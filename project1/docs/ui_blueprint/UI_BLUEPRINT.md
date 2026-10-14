Nama Aplikasi:
  SIRUANG (Sistem Informasi Ruangan)

  Tema Aplikasi:
  Manajemen dan monitoring alokasi ruangan perkuliahan Gedung B Unmuh Jember

  Target Pengguna:
  Mahasiswa, Dosen, Organisasi Mahasiswa (Ormawa/UKM), dan Staf BAAK / Tendik Gedung B Universitas Muhammadiyah Jember. Namun, kali ini saya berfokus pada fitur yang dapat diakses oleh mahasiswa.

  Tujuan Aplikasi:
  Memudahkan mahasiswa dan civitas akademika dalam memantau jadwal perkuliahan secara real-time, mengecek ketersediaan ruangan kosong, serta melakukan pengajuan peminjaman ruangan secara transparan.

  Daftar Screen:
1. Splash Screen
     Fungsi: Tampilan onboarding awal saat aplikasi pertama kali dibuka.
     Komponen: Logo SIRUANG, latar belakang gradasi Navy.

2. Login & Guest Access
     Fungsi: Otentikasi hak akses pengguna atau masuk tanpa login.
     Komponen: Banner Unmuh Jember, TextField NIM/NIP, TextField Password, tombol "Log In now", tombol "as a Guest".

3. Beranda (Dashboard Statistik)
     Fungsi: Menampilkan ringkasan statistik penggunaan ruangan hari ini.
     Komponen: Header Unmuh Jember, ilustrasi maskot kampus, 4 Card Statistik (Total Jadwal, Berlangsung, Libur, Selesai), Bottom Navigation Bar.

4. Jadwal Ruangan
     Fungsi: Memantau daftar alokasi jadwal perkuliahan secara rinci.
     Komponen: Header Unmuh Jember, Search Bar pencarian ruangan/dosen, Filter Chip Tanggal (Kemaren, Hari Ini, Besok, Pilih), Card List Jadwal, Bottom Navigation Bar.

5. Ruang Kosong Hari Ini
     Fungsi: Menampilkan daftar ruangan yang bebas/tidak terpakai dan memicu aksi pengajuan.
     Komponen: Top Bar Tanggal & Gedung, List Card Ruangan Bebas, tombol "Ajukan Peminjaman", Bottom Navigation Bar.

  Alur Maju:
  Splash Screen → Login
  Login → (Isi Kredensial & Klik "Log In now") → Beranda
  Login → (Klik "as a Guest") → Jadwal Ruangan (Mode Tamu)
  Beranda → Jadwal Ruangan
  Jadwal Ruangan → (Klik Filter "Hari Ini" / Tab "Kosong") → Ruang Kosong Hari Ini
  Ruang Kosong Hari Ini → (Mahasiswa: Klik "Ajukan Peminjaman") → Form Pengajuan Ruang
  Ruang Kosong Hari Ini → (Guest: Klik "Ajukan Peminjaman") → Pop-up Prompt Login → Login

  Alur Kembali:
  Login → (Klik Back / Gesture) → Pop-up Toast ("Ketuk sekali lagi untuk keluar")
  Beranda → (Klik Back / Gesture) → Login
  Jadwal Ruangan → (Klik Tab Nav "Beranda" / Gesture) → Beranda
  Ruang Kosong Hari Ini → (Klik Tab Nav "Jadwal" / Gesture) → Jadwal Ruangan
  Form Pengajuan Ruang → (Klik Back / Gesture) → Ruang Kosong Hari Ini