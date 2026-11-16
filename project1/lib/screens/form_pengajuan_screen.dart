import 'package:flutter/material.dart';

import '../data/peminjaman_data.dart';
import '../models/peminjaman.dart';
import '../theme/app_colors.dart';

// BAB 6 (form + validasi) sekaligus pintu Create/Update untuk BAB 7.
// Kalau [existing] diisi, form berfungsi sebagai Edit.
// Hasilnya dikirim kembali lewat Navigator.pop(context, hasil).
class FormPengajuanScreen extends StatefulWidget {
  const FormPengajuanScreen({super.key, this.existing});

  final Peminjaman? existing;

  @override
  State<FormPengajuanScreen> createState() => _FormPengajuanScreenState();
}

class _FormPengajuanScreenState extends State<FormPengajuanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _kegiatanController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _mulaiController = TextEditingController();
  final _selesaiController = TextEditingController();

  String? _ruangan;
  DateTime? _tanggal;
  TimeOfDay? _mulai;
  TimeOfDay? _selesai;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _kegiatanController.text = e.kegiatan;
      _ruangan = e.ruangan;
      _tanggal = e.tanggal;
      _tanggalController.text = e.tanggalText;
      _mulai = _parseJam(e.jamMulai);
      _selesai = _parseJam(e.jamSelesai);
      _mulaiController.text = e.jamMulai;
      _selesaiController.text = e.jamSelesai;
    }
  }

  @override
  void dispose() {
    _kegiatanController.dispose();
    _tanggalController.dispose();
    _mulaiController.dispose();
    _selesaiController.dispose();
    super.dispose();
  }

  TimeOfDay _parseJam(String text) {
    final parts = text.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  String _formatJam(TimeOfDay t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  Future<void> _pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: _tanggal ?? DateTime.now(),
      firstDate: DateTime(2026),
      lastDate: DateTime(2028),
    );
    if (hasil == null) return;
    setState(() {
      _tanggal = hasil;
      _tanggalController.text =
          '${hasil.day.toString().padLeft(2, '0')}-'
          '${hasil.month.toString().padLeft(2, '0')}-${hasil.year}';
    });
  }

  Future<void> _pilihJam({required bool mulai}) async {
    final hasil = await showTimePicker(
      context: context,
      initialTime: (mulai ? _mulai : _selesai) ?? TimeOfDay.now(),
    );
    if (hasil == null) return;
    setState(() {
      if (mulai) {
        _mulai = hasil;
        _mulaiController.text = _formatJam(hasil);
      } else {
        _selesai = hasil;
        _selesaiController.text = _formatJam(hasil);
      }
    });
  }

  void _submitForm() {
    // validate() menjalankan semua validator dan menampilkan pesan error.
    if (!_formKey.currentState!.validate()) return;

    final hasil = Peminjaman(
      id: widget.existing?.id ?? PeminjamanData.nextId++,
      kegiatan: _kegiatanController.text.trim(),
      ruangan: _ruangan!,
      tanggal: _tanggal!,
      jamMulai: _formatJam(_mulai!),
      jamSelesai: _formatJam(_selesai!),
      status: 'Menunggu', // pengajuan baru/diubah selalu menunggu persetujuan
    );
    Navigator.pop(context, hasil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Ubah Pengajuan' : 'Ajukan Peminjaman Ruangan'),
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _kegiatanController,
              decoration: const InputDecoration(
                labelText: 'Nama Kegiatan',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) return 'Nama kegiatan wajib diisi';
                if (text.length < 3) return 'Nama kegiatan minimal 3 karakter';
                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _ruangan,
              decoration: const InputDecoration(
                labelText: 'Pilih ruang kosong',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final r in PeminjamanData.ruangKosong)
                  DropdownMenuItem(value: r, child: Text(r)),
              ],
              onChanged: (value) => setState(() => _ruangan = value),
              validator: (value) =>
                  value == null ? 'Ruangan wajib dipilih' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _tanggalController,
              readOnly: true,
              onTap: _pilihTanggal,
              decoration: const InputDecoration(
                labelText: 'Tanggal Kegiatan',
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Tanggal wajib dipilih'
                  : null,
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _mulaiController,
                    readOnly: true,
                    onTap: () => _pilihJam(mulai: true),
                    decoration: const InputDecoration(
                      labelText: 'Jam mulai',
                      suffixIcon: Icon(Icons.access_time),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Wajib dipilih'
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _selesaiController,
                    readOnly: true,
                    onTap: () => _pilihJam(mulai: false),
                    decoration: const InputDecoration(
                      labelText: 'Jam selesai',
                      suffixIcon: Icon(Icons.access_time),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Wajib dipilih';
                      }
                      if (_mulai != null && _selesai != null) {
                        final mulaiMenit = _mulai!.hour * 60 + _mulai!.minute;
                        final selesaiMenit =
                            _selesai!.hour * 60 + _selesai!.minute;
                        if (selesaiMenit <= mulaiMenit) {
                          return 'Harus setelah jam mulai';
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur unggah KTM menyusul')),
                );
              },
              icon: const Icon(Icons.upload_file),
              label: const Text('Unggah KTM'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                foregroundColor: AppColors.navy,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _submitForm,
              child: Text(_isEdit ? 'Simpan Perubahan' : 'Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
