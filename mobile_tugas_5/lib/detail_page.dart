import 'package:flutter/material.dart';

Color stockColor(int stock) {
  if (stock == 0) return Colors.red;
  if (stock <= 10) return Colors.orange;
  return Colors.green;
}

String stockText(int stock) {
  return stock == 0 ? 'Stok habis' : 'Stok: $stock unit';
}

class DetailPage extends StatelessWidget {
  final Map<String, String> phone;

  const DetailPage({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final stock = int.tryParse(phone['stock']!) ?? 0;

    final specs = [
      (Icons.memory, 'Chipset', phone['chipset']!),
      (Icons.developer_board, 'RAM', phone['ram']!),
      (Icons.sd_storage, 'Penyimpanan', phone['storage']!),
      (Icons.stay_current_portrait, 'Layar', phone['screen']!),
      (Icons.photo_camera, 'Kamera', phone['camera']!),
      (Icons.battery_charging_full, 'Baterai', phone['battery']!),
      (Icons.palette, 'Warna', phone['color']!),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(phone['name']!),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueGrey, scheme.surface],
                ),
              ),
              child: Hero(
                tag: phone['name']!,
                child: Image.network(
                  phone['image']!,
                  height: 260,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 260,
                      child: Icon(Icons.smartphone, size: 100),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        label: Text(phone['brand']!),
                        visualDensity: VisualDensity.compact,
                        avatar: const Icon(Icons.verified, size: 16),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        phone['rating']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    phone['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    phone['price']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: scheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: stockColor(stock).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          stock == 0
                              ? Icons.remove_shopping_cart
                              : Icons.inventory_2,
                          size: 16,
                          color: stockColor(stock),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          stockText(stock),
                          style: TextStyle(
                            color: stockColor(stock),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    phone['description']!,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Spesifikasi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 0,
                    color: scheme.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          for (int i = 0; i < specs.length; i++) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    specs[i].$1,
                                    size: 20,
                                    color: scheme.primary,
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      specs[i].$2,
                                      style: TextStyle(
                                        color: scheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      specs[i].$3,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (i != specs.length - 1) const Divider(height: 1),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: OutlinedButton.styleFrom(minimumSize: const Size(0, 50)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: stock == 0
                      ? null
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${phone['name']} ditambahkan ke keranjang',
                              ),
                            ),
                          );
                        },
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(stock == 0 ? 'Stok Habis' : 'Beli Sekarang'),
                  style: FilledButton.styleFrom(minimumSize: const Size(0, 50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}