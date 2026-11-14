import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> travelData;
  const HomePage({super.key, required this.travelData});

  void bukaDetail(BuildContext context, Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Katalog Wisata'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                icon: Icon(Icons.view_agenda_sharp),
                text: 'List View',
              ),
              Tab(
                icon: Icon(Icons.grid_view_rounded),
                text: 'Grid View',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(),
            buildGridView(),
          ],
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: travelData.length,
      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            onTap: () => bukaDetail(context, item),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item['gambar']!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(item['nama']!),
            subtitle: Text(item['lokasi']!),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: travelData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item['gambar']!,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black45, Colors.transparent],
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['nama']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      item['lokasi']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => bukaDetail(context, item),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['nama']!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item['gambar']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.broken_image, size: 48),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['nama']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        item['lokasi']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Keterangan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['keterangan'] ?? 'Belum ada keterangan.',
                    style: const TextStyle(fontSize: 15, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}