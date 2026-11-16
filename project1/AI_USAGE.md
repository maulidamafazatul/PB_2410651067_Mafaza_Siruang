# AI_USAGE.md

Catatan penggunaan AI project SIRUANG (Pemrograman Bergerak, MJU.TIK.025). Satu bagian per milestone, terbaru di atas. Selama sesi UTS saya tidak memakai AI.

---

## v0.3 - Data Module (BAB 7)

| Komponen | Keterangan |
| :--- | :--- |
| **Tool AI yang Digunakan** | Gemini.Ai |
| **Peran AI** | L1 Explainer, L2 Scaffolder, L3 Reviewer |
| **Tujuan Penggunaan** | Memahami List, `ListView.builder`, `setState`, dan CRUD; menerapkan contoh modul ke SIRUANG; menelusuri error; menyesuaikan tampilan dengan Figma; menyusun draf dokumentasi |
| **Bagian yang Dibantu** | Model `Peminjaman`, data mock, form tervalidasi, screen Status Pengajuan, Jadwal, `PageHeader`, README, CHANGELOG |
| **Saran AI yang Digunakan** | Kode model, form tervalidasi, dan CRUD diberikan AI sebagai titik awal ([dipakai / diadaptasi]). Perbaikan import dan format `pubspec.yaml` ([dipakai]) |
| **Modifikasi / Verifikasi Mahasiswa** | [Tulis hanya yang sudah dikerjakan: menjalankan di Chrome, mengisi aset dari Figma, menguji skenario uji, memperbaiki error] |
| **Bagian yang Saya Pahami** | [Tulis dengan kata-katamu sendiri: alur Create/Read/Update/Delete, fungsi `setState`, `validate()`, `dispose()`, dan mengapa data hilang saat aplikasi dimuat ulang] |
| **Status Akhir** | [selesai / belum selesai / perlu revisi] |

**Error yang saya temui:**

- `Task isn't defined`: alamat import salah karena file berada di folder berbeda. Diperbaiki dengan `import '../models/task.dart';`.
- `Expected "assets" to be a list`: format `assets` di `pubspec.yaml` salah (spasi dan tanda `-`). Diperbaiki sesuai format YAML.
