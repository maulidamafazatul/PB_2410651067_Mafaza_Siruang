// Model data BAB 7: satu objek = satu pengajuan peminjaman ruangan.
// Field yang bisa diubah (Update) tidak memakai final.
class Peminjaman {
  final int id;
  String kegiatan;
  String ruangan;
  DateTime tanggal;
  String jamMulai; // format HH:mm
  String jamSelesai; // format HH:mm
  String status; // Menunggu / Disetujui / Ditolak
  String? alasan; // diisi jika ditolak

  Peminjaman({
    required this.id,
    required this.kegiatan,
    required this.ruangan,
    required this.tanggal,
    required this.jamMulai,
    required this.jamSelesai,
    this.status = 'Menunggu',
    this.alasan,
  });

  // Tanggal dalam format dd-MM-yyyy, tanpa package tambahan.
  String get tanggalText {
    final d = tanggal.day.toString().padLeft(2, '0');
    final m = tanggal.month.toString().padLeft(2, '0');
    return '$d-$m-${tanggal.year}';
  }
}
