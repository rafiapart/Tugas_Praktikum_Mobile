import 'package:flutter/material.dart';
import 'package:mobile_tugas_6/homePage.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> travelData = [
  {
    'nama': 'Raja Ampat',
    'gambar':
        'https://images.unsplash.com/photo-1703769605314-502c031fe751?w=1200&auto=format&fit=crop&q=80&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi': 'Papua',
    'keterangan':
        'Raja Ampat adalah gugusan ribuan pulau kecil yang terkenal sebagai salah satu surga snorkeling dan diving terbaik di dunia. '
        'Perairannya menjadi rumah bagi ratusan jenis terumbu karang dan ribuan spesies ikan, sehingga dijuluki pusat keanekaragaman hayati laut dunia. '
        'Pemandangan gugusan pulau karst dari atas bukit Wayag dan Piaynemo jadi ikon wisata di sini.',
  },
  {
    'nama': 'Candi Borobudur',
    'gambar':
        'https://wallpapers.com/images/hd/borobudur-temple-pathway-green-grasses-0wx4atm8xkwaz6vk.jpg',
    'lokasi': 'Jawa Tengah',
    'keterangan':
        'Candi Borobudur adalah candi Buddha terbesar di dunia yang dibangun pada abad ke-9 pada masa Dinasti Syailendra. '
        'Bangunannya terdiri dari sembilan tingkat dengan ribuan relief dan ratusan stupa. '
        'Borobudur telah ditetapkan sebagai Situs Warisan Dunia UNESCO dan ramai dikunjungi, terutama saat matahari terbit.',
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'katalog wisata',
      debugShowCheckedModeBanner: false,
      home: HomePage(travelData: travelData),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(160, 121, 85, 72),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}