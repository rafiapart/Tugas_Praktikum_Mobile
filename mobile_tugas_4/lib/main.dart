import 'package:flutter/material.dart';
import 'package:mobile_tugas_4/api_service.dart';
import 'package:mobile_tugas_4/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Berita',
      debugShowCheckedModeBanner: false,
      home: News(),
    );
  }
}

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();

  List<Article> _articles = [];
  bool _isLoading = true;
  bool _showBackToTop = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadArticles();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final shouldShow = _scrollController.offset > 300;
    if (shouldShow != _showBackToTop) {
      setState(() => _showBackToTop = shouldShow);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _loadArticles() async {
    try {
      final data = await _apiService.fetchArticles();
      if (!mounted) return;
      setState(() {
        _articles = data;
        _error = null;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildMessage(String text) {
    return ListView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [SizedBox(height: 300, child: Center(child: Text(text)))],
    );
  }

  Widget _buildContent() {
    if (_error != null) {
      return _buildMessage('Error : $_error');
    }
    if (_articles.isEmpty) {
      return _buildMessage('Tidak ada berita yang ditemukan');
    }
    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        final article = _articles[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    width: 80,
                    errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
                  )
                : const Icon(Icons.image),
            title: Text(article.title),
            subtitle: Text(article.description ?? 'Tidak Ada deskripsi'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Berita'),
        backgroundColor: Colors.brown,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(onRefresh: _loadArticles, child: _buildContent()),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.brown,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
    );
  }
}
