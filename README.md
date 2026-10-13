# ⚡ Smart Eco-Energy Dashboard (SDG 7)

Aplikasi mobile interaktif berbasis Flutter yang mensimulasikan pemantauan energi surya IoT (Internet of Things). Aplikasi ini dikembangkan untuk memenuhi **Tugas 4 Pemrograman Mobile** dengan mengintegrasikan layout kompleks (*Stack, Row, Column, Card*) dan manipulasi 3 gesture interaktif secara real-time.

---

## 👥 Identitas Kelompok
* **Nama / Ketua Kelompok:** Natan Valeska Paputungan (NIM: 202431137)
* **Anggota Kelompok:** Tracy Christie Simanjuntak (NIM: 202431143)
* **Mata Kuliah / Kelas:** Pemrograman Mobile / F
* **Ketentuan Tugas (NIM Ganjil):** Implementasi gestur Tap, Long Press, dan Drag/Pan.
* **Tema Aplikasi:** Smart Eco-Energy Dashboard (Simulasi Panel Surya IoT berlandaskan Sustainable Development Goals / SDG 7: Energi Bersih dan Terjangkau).

---

## 🚀 Fitur & Implementasi Gesture (NIM Ganjil)
Aplikasi ini memanfaatkan `GestureDetector` untuk memicu perubahan *state* visual secara dinamis:

1. **Tap Gesture (`onTap`):**
   * **Fungsi:** Mengubah status koneksi panel surya (*Connected / Idle*).
   * **Efek Visual:** Warna kartu berubah antara hijau (aktif) dan abu-abu (standby).
2. **Long Press Gesture (`onLongPress`):**
   * **Fungsi:** Mengaktifkan atau menonaktifkan *Turbo Mode*.
   * **Efek Visual:** Kapasitas daya meningkat dari 350W menjadi 750W, ikon berubah menjadi api, dan warna kartu menjadi oranye.
3. **Drag/Pan Gesture (`onPanUpdate`):**
   * **Fungsi:** Memindahkan posisi elemen panel surya secara bebas di dalam kanvas `Stack`.
   * **Efek Visual:** Koordinat posisi X dan Y diperbarui secara real-time pada papan log informasi.

---
