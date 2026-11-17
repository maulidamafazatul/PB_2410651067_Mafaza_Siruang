import '../models/peminjaman.dart';

// Sumber data mock BAB 7: disimpan di memori, hilang saat aplikasi dimuat ulang.
// Semua data fiktif.
class PeminjamanData {
  static final List<Peminjaman> items = [
    Peminjaman(
      id: 1,
      kegiatan: 'Rapat Anggota BEM',
      kategoriKegiatan: 'rapat',
      ruangan: 'B.114',
      tanggal: DateTime(2026, 11, 9),
      jamMulai: '07:00',
      jamSelesai: '08:40',
      status: 'Menunggu',
    ),
    Peminjaman(
      id: 2,
      kegiatan: 'Kongres',
      kategoriKegiatan: 'rapat',
      ruangan: 'B.117',
      tanggal: DateTime(2026, 11, 10),
      jamMulai: '07:00',
      jamSelesai: '08:40',
      status: 'Disetujui',
    ),
    Peminjaman(
      id: 3,
      kegiatan: 'seminar chat GPT',
      kategoriKegiatan: 'seminar',
      ruangan: 'B.116',
      tanggal: DateTime(2026, 11, 9),
      jamMulai: '12:00',
      jamSelesai: '14:00',
      status: 'Ditolak',
      alasan: 'bentrok',
    ),
  ];

  static int nextId = 4;

  // Pilihan ruang kosong untuk dropdown di form.
  static const List<String> ruangKosong = [
    'B.104',
    'B.105',
    'B.114',
    'B.116',
    'B.117',
  ];
  // Pilihan Kategori kegiatan (Rapat, Seminar dan KelasPengganti )
  static const List<String> kategoriKegiatan = [
    'Rapat',
    'Seminar',
    'Kelas Pengganti',
  ];


  // Create atau Update: kalau id sudah ada, data diganti; kalau belum, ditambah.
  static void simpan(Peminjaman p) {
    final index = items.indexWhere((e) => e.id == p.id);
    if (index == -1) {
      items.add(p);
    } else {
      items[index] = p;
    }
  }

  // Delete
  static void hapus(int id) {
    items.removeWhere((e) => e.id == id);
  }
}
