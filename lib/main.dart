import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Mobile Praktikum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // State dasar buat interaksi gesture
  bool isNyala = true;
  bool isTurbo = false;
  Offset posisiPanel = const Offset(40, 40);
  String teksStatus =
      "Silakan Tap, Long Press, atau Geser kotak panel di bawah!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F8F2),
      appBar: AppBar(
        title: const Text('Simulasi IoT Energi Surya - SDG 7'),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          // Bagian Header Informasi (Row & Column & Card)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _bikinKotakInfo(
                      "Kapasitas",
                      isTurbo ? "750 Watt" : "350 Watt",
                      Icons.electric_bolt,
                      Colors.amber,
                    ),
                    _bikinKotakInfo(
                      "Status",
                      isNyala ? "Connected" : "Idle",
                      Icons.power,
                      Colors.green,
                    ),
                    _bikinKotakInfo(
                      "Efisiensi",
                      "88%",
                      Icons.trending_up,
                      Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Kotak Log / Keterangan Aksi Gesture
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                const Icon(Icons.info, color: Colors.green),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    teksStatus,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Area Kanvas Utama menggunakan Stack untuk Drag/Pan
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 12,
                    left: 12,
                    child: Text(
                      "Area Drag & Drop Panel (Geser aku ke mana aja)",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),

                  // Komponen Interaktif (GestureDetector: Tap, LongPress, PanUpdate)
                  Positioned(
                    left: posisiPanel.dx,
                    top: posisiPanel.dy,
                    child: GestureDetector(
                      // 1. Aksi Tap (Nih buat ubah nyala/mati)
                      onTap: () {
                        setState(() {
                          isNyala = !isNyala;
                          teksStatus = isNyala
                              ? "Panel berhasil di-Tap: ON"
                              : "Panel berhasil di-Tap: OFF";
                        });
                      },
                      // 2. Aksi Long Press (Buat aktifin mode turbo)
                      onLongPress: () {
                        setState(() {
                          isTurbo = !isTurbo;
                          teksStatus = isTurbo
                              ? "Mode Turbo AKTIF (Long Press terdeteksi)!"
                              : "Mode Turbo dimatikan.";
                        });
                      },
                      // 3. Aksi Geser / Drag (Pan Update)
                      onPanUpdate: (detail) {
                        setState(() {
                          posisiPanel += detail.delta;
                          teksStatus =
                              "Panel digeser ke posisi X: ${posisiPanel.dx.toInt()}, Y: ${posisiPanel.dy.toInt()}";
                        });
                      },
                      child: Card(
                        elevation: isTurbo ? 8 : 4,
                        color: isNyala
                            ? (isTurbo ? Colors.orange[600] : Colors.green[600])
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SizedBox(
                          width: 130,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isTurbo
                                    ? Icons.local_fire_department
                                    : Icons.wb_sunny,
                                color: Colors.white,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                isTurbo ? "TURBO PANEL" : "Solar Cell",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget kecil biar baris kodingan ga terlalu panjang di atas
  Widget _bikinKotakInfo(
    String label,
    nilai,
    IconData iconnya,
    Color warnanya,
  ) {
    return Column(
      children: [
        Icon(iconnya, color: warnanya, size: 24),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 2),
        Text(
          nilai,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
