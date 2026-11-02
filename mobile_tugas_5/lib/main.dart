import 'package:flutter/material.dart';
import 'package:mobile_tugas_5/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Smartphone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedBrand = 'Semua';

  final List<Map<String, String>> phones = [
    {
      'name': 'iPhone 18 Pro',
      'brand': 'Apple',
      'image':
          'https://imgs.search.brave.com/GQbo6zACMuesjF0on6pXUnVUgp1-dJ1lcHBZ2RwdzA0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YXR0LmNvbS9zY21z/YXNzZXRzL2dsb2Jh/bC9kZXZpY2VzL290/aGVyL2FwcGxlL2Fw/cGxlLWlwaG9uZS0x/OC1wcm8tbWF4L2Rl/ZmF1bHRpbWFnZS9i/dXJndW5keS1oZXJv/LXpvb20ucG5n',
      'description':
          'Flagship terbaru Apple dengan performa kencang, kamera profesional, dan desain premium berbahan titanium.',
      'price': 'Rp 24.999.000',
      'stock': '8',
      'rating': '4.9',
      'chipset': 'Apple A20 Pro',
      'ram': '12 GB',
      'storage': '256 GB',
      'screen': '6.3" LTPO OLED 120Hz',
      'camera': '48 MP + 48 MP + 12 MP',
      'battery': '3.700 mAh',
      'color': 'Burgundy',
    },
    {
      'name': 'iPhone 17 Pro',
      'brand': 'Apple',
      'image':
          'https://imgs.search.brave.com/QjylriThvZRBO8Etqg-8GChDSeeR3cahrB4yAO8gpbs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YXR0LmNvbS9zY21z/YXNzZXRzL2dsb2Jh/bC9kZXZpY2VzL3Bo/b25lcy9hcHBsZS9h/cHBsZS1pcGhvbmUt/MTctcHJvLW1heC9k/ZWZhdWx0aW1hZ2Uv/Y29zbWljLW9yYW5n/ZS1oZXJvLXpvb20u/cG5n',
      'description':
          'Generasi Pro dengan bodi aluminium unibody, sistem kamera belakang tiga lensa 48 MP, dan baterai lebih awet.',
      'price': 'Rp 21.999.000',
      'stock': '15',
      'rating': '4.8',
      'chipset': 'Apple A19 Pro',
      'ram': '12 GB',
      'storage': '256 GB',
      'screen': '6.3" LTPO OLED 120Hz',
      'camera': '48 MP + 48 MP + 48 MP',
      'battery': '3.800 mAh',
      'color': 'Cosmic Orange',
    },
    {
      'name': 'iPhone 16 Pro',
      'brand': 'Apple',
      'image':
          'https://imgs.search.brave.com/6V6yI-OPlc9r8AQ7DXeGld69nFhdJPBhY6wvY0BbWEo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YXR0LmNvbS9zY21z/YXNzZXRzL2dsb2Jh/bC9kZXZpY2VzL3Bo/b25lcy9hcHBsZS9h/cHBsZS1pcGhvbmUt/MTYtcHJvLW1heC9k/ZWZhdWx0aW1hZ2Uv/ZGVzZXJ0LXRpdGFu/aXVtLWhlcm8tem9v/bS5wbmc',
      'description':
          'Hadir dengan tombol Camera Control dan chip A18 Pro yang siap untuk fitur Apple Intelligence.',
      'price': 'Rp 17.999.000',
      'stock': '22',
      'rating': '4.7',
      'chipset': 'Apple A18 Pro',
      'ram': '8 GB',
      'storage': '128 GB',
      'screen': '6.3" LTPO OLED 120Hz',
      'camera': '48 MP + 48 MP + 12 MP',
      'battery': '3.582 mAh',
      'color': 'Desert Titanium',
    },
    {
      'name': 'iPhone 15 Pro',
      'brand': 'Apple',
      'image':
          'https://imgs.search.brave.com/Jkih-ioWK3MoOCzHotJaMmOyxYyNy7EXyrV-HrmJY_4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dXBwaG9uZS5jb20v/aW1hZ2VzL3Bob25l/cy9hcHBsZS9pcGhv/bmUtMTUtcHJvLW1h/eC0xMjAwLndlYnA',
      'description':
          'iPhone pertama dengan bodi titanium dan port USB-C, cocok buat yang cari flagship dengan harga lebih bersahabat.',
      'price': 'Rp 14.999.000',
      'stock': '5',
      'rating': '4.6',
      'chipset': 'Apple A17 Pro',
      'ram': '8 GB',
      'storage': '128 GB',
      'screen': '6.1" Super Retina XDR 120Hz',
      'camera': '48 MP + 12 MP + 12 MP',
      'battery': '3.274 mAh',
      'color': 'Natural Titanium',
    },
    {
      'name': 'iPhone 14 Pro',
      'brand': 'Apple',
      'image':
          'https://imgs.search.brave.com/j_RqjbPaedhjUivBXAmIiidJ0uwxBsgIFii2b9--zmc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9waXNj/ZXMuYmJ5c3RhdGlj/LmNvbS9pbWFnZTIv/QmVzdEJ1eV9VUy9p/bWFnZXMvcHJvZHVj/dHMvNjM1NTViMDQt/ZmQ5MC00MDYyLTk1/N2MtODVlOGQ2ZjVj/YWIzLmpwZzttYXhI/ZWlnaHQ9NDI3O21h/eFdpZHRoPTY0MD9m/b3JtYXQ9d2VicA',
      'description':
          'Pelopor Dynamic Island dengan kamera utama 48 MP, masih sangat layak dipakai sampai sekarang.',
      'price': 'Rp 11.999.000',
      'stock': '0',
      'rating': '4.5',
      'chipset': 'Apple A16 Bionic',
      'ram': '6 GB',
      'storage': '128 GB',
      'screen': '6.1" Super Retina XDR 120Hz',
      'camera': '48 MP + 12 MP + 12 MP',
      'battery': '3.200 mAh',
      'color': 'Deep Purple',
    },
    {
      'name': 'Galaxy S25 Ultra',
      'brand': 'Samsung',
      'image':
          'https://imgs.search.brave.com/A7iot2lpH_VmxXbBlVzRcyfdaL7FOlOEFlFSZJouoEg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4x/LnNtYXJ0cHJpeC5j/b20vcngtaWJkMFRC/UkpZLXc0MjAtaDQy/MC9zYW1zdW5nLWdh/bGF4eS1zMjUtdS53/ZWJw',
      'description':
          'Flagship Samsung dengan S Pen, layar AMOLED terang, dan kamera 200 MP untuk hasil foto detail.',
      'price': 'Rp 21.999.000',
      'stock': '12',
      'rating': '4.8',
      'chipset': 'Snapdragon 8 Elite',
      'ram': '12 GB',
      'storage': '256 GB',
      'screen': '6.9" Dynamic AMOLED 120Hz',
      'camera': '200 MP + 50 MP + 10 MP + 50 MP',
      'battery': '5.000 mAh',
      'color': 'Black',
    },
    {
      'name': 'Galaxy S24 FE',
      'brand': 'Samsung',
      'image':
          'https://imgs.search.brave.com/vaIstSu_-9r_WReRQxK4x2Ce8ExqtmHmyCv8tXhnX-Q/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/OTEtaW1nLmNvbS9w/aWN0dXJlcy8xNTY2/NjctdjQtc2Ftc3Vu/Zy1nYWxheHktczI0/LWZlLW1vYmlsZS1w/aG9uZS1ocmVzLTgu/anBnP3Ry',
      'description':
          'Fan Edition dengan fitur Galaxy AI dan performa flagship di harga yang lebih terjangkau.',
      'price': 'Rp 9.499.000',
      'stock': '30',
      'rating': '4.5',
      'chipset': 'Exynos 2400e',
      'ram': '8 GB',
      'storage': '128 GB',
      'screen': '6.7" Dynamic AMOLED 120Hz',
      'camera': '50 MP + 12 MP + 8 MP',
      'battery': '4.700 mAh',
      'color': 'Green',
    },
    {
      'name': 'Xiaomi 15',
      'brand': 'Xiaomi',
      'image':
          'https://imgs.search.brave.com/uXBfZUyw9ZsO1qjVAd5URwxYfbLvrvFbc_I6wZ4GEMw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9waXhv/cGhvbmUuY29tL2lt/YWdlL2NhY2hlL2Nh/dGFsb2cvcHJvZHVj/dC11cGxvYWQvWGlh/b21pMTVHcmFzc0dy/ZWVuLzFYaWFvbWkx/NUdyYXNzR3JlZW4t/MzUweDM1MC53ZWJw',
      'description':
          'Flagship ringkas dengan kamera Leica, layar tajam, dan pengisian daya super cepat.',
      'price': 'Rp 13.999.000',
      'stock': '18',
      'rating': '4.7',
      'chipset': 'Snapdragon 8 Elite',
      'ram': '12 GB',
      'storage': '256 GB',
      'screen': '6.36" LTPO AMOLED 120Hz',
      'camera': '50 MP + 50 MP + 50 MP',
      'battery': '5.240 mAh',
      'color': 'Mint',
    },
    {
      'name': 'Redmi Note 14 Pro',
      'brand': 'Xiaomi',
      'image':
          'https://imgs.search.brave.com/3mYLhuSUnOKoSriVrLrlbjGNRrN6TdFU1DvA5hDlG74/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9rZS5q/dW1pYS5pcy9sWTVk/Z0JiS0VWRXZENkZs/MWp6WVJJRDlrYjg9/L2ZpdC1pbi81MDB4/NTAwL2ZpbHRlcnM6/ZmlsbCh3aGl0ZSkv/cHJvZHVjdC8xMi81/NDk1ODIzLzEuanBn/Pzc0OTQ',
      'description':
          'Pilihan mid-range favorit dengan layar AMOLED lega, kamera 200 MP, dan baterai tahan lama.',
      'price': 'Rp 4.999.000',
      'stock': '4',
      'rating': '4.4',
      'chipset': 'Helio G100 Ultra',
      'ram': '8 GB',
      'storage': '256 GB',
      'screen': '6.67" AMOLED 120Hz',
      'camera': '200 MP + 8 MP + 2 MP',
      'battery': '5.110 mAh',
      'color': 'Midnight Black',
    },
    {
      'name': 'Oppo Find X8',
      'brand': 'Oppo',
      'image':
          'https://imgs.search.brave.com/KN5alGSk5WUlNhqmBadGcIjGpCE3BsV6jD1Vwnn71ss/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/ZXRvcmVuLmNvbS91/cGxvYWQvaW1hZ2Vz/LzAuNTI5MTgwMDBf/MTczMjUwNDI5NV9v/cHBvLWZpbmQteDgt/NWctY3BoMjY1MS1k/dWFsLXNpbS01MTJn/Yi1zcGFjZS1ibGFj/ay0xNmdiLXJhbS1n/bG9iYWwtdmVyc2lv/bi5qcGc',
      'description':
          'Desain tipis elegan dengan kamera Hasselblad dan pengalaman ColorOS yang mulus.',
      'price': 'Rp 14.499.000',
      'stock': '9',
      'rating': '4.6',
      'chipset': 'Dimensity 9400',
      'ram': '12 GB',
      'storage': '256 GB',
      'screen': '6.59" LTPO AMOLED 120Hz',
      'camera': '50 MP + 50 MP + 50 MP',
      'battery': '5.630 mAh',
      'color': 'Space Black',
    },
    {
      'name': 'Vivo X200 Pro',
      'brand': 'Vivo',
      'image':
          'https://imgs.search.brave.com/G_8uMQtsmz5ZYaarzt0WsmI6M5UJye-1Gd_q0PEpcJs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly92c3By/b2QudmlqYXlzYWxl/cy5jb20vbWVkaWEv/Y2F0YWxvZy9wcm9k/dWN0L3YvaS92aXZv/eDIwMHByb2JsYWNr/XzEuanBnP29wdGlt/aXplPW1lZGl1bSZm/aXQ9Ym91bmRzJmhl/aWdodD01MDAmd2lk/dGg9NTAw',
      'description':
          'Spesialis fotografi dengan lensa Zeiss dan telefoto 200 MP yang jernih di segala kondisi.',
      'price': 'Rp 17.999.000',
      'stock': '7',
      'rating': '4.7',
      'chipset': 'Dimensity 9400',
      'ram': '16 GB',
      'storage': '512 GB',
      'screen': '6.78" LTPO AMOLED 120Hz',
      'camera': '50 MP + 200 MP + 50 MP',
      'battery': '6.000 mAh',
      'color': 'Cosmos Black',
    },
    {
      'name': 'Pixel 9 Pro',
      'brand': 'Google',
      'image':
          'https://imgs.search.brave.com/maKyl6JfTytexMimnYd7tS0d0CE4rWV-r8whLoy6CKQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZWxs/aWZpY2F0aW9uLmNv/bS9jZG4vc2hvcC9m/aWxlcy9TY3JlZW5z/aG90MjAyNi0wOS0w/NzIwMDQ1NV85N2Ji/NmE2YS0zNjc4LTQ2/MTctOTcwNS1kZDQ1/MTMzZThjOTIuanBn/P3Y9MTc4ODgyNjUz/NyZ3aWR0aD0xNDQ1',
      'description':
          'HP dengan Android murni dan fitur AI Google terbaik, unggul di fotografi komputasional.',
      'price': 'Rp 16.999.000',
      'stock': '3',
      'rating': '4.6',
      'chipset': 'Google Tensor G4',
      'ram': '16 GB',
      'storage': '256 GB',
      'screen': '6.3" LTPO OLED 120Hz',
      'camera': '50 MP + 48 MP + 48 MP',
      'battery': '4.700 mAh',
      'color': 'Obsidian',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final brands = ['Semua', ...phones.map((p) => p['brand']!).toSet()];
    final filtered = selectedBrand == 'Semua'
        ? phones
        : phones.where((p) => p['brand'] == selectedBrand).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Smartphone'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.smartphone),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: brands.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final brand = brands[i];
                return ChoiceChip(
                  label: Text(brand),
                  selected: selectedBrand == brand,
                  onSelected: (_) => setState(() => selectedBrand = brand),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final phone = filtered[index];
                final stock = int.tryParse(phone['stock']!) ?? 0;
                final scheme = Theme.of(context).colorScheme;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(phone: phone),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Hero(
                            tag: phone['name']!,
                            child: Container(
                              width: 90,
                              height: 90,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: scheme.outlineVariant),
                              ),
                              child: Image.network(
                                phone['image']!,
                                fit: BoxFit.contain,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return const Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.smartphone,
                                    size: 36,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  phone['brand']!.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: 1,
                                    color: scheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  phone['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  phone['price']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 9,
                                      color: stockColor(stock),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      stockText(stock),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: stockColor(stock),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      phone['rating']!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}