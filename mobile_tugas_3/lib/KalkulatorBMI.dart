import 'package:flutter/material.dart';

enum Gender { lakiLaki, perempuan }

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  Gender _gender = Gender.lakiLaki;
  double? _hasilBMI;
  String _pesan = 'Masukkan Data Anda!!!';

  (String, Color) _kategori(double bmi) {
    final bool pria = _gender == Gender.lakiLaki;
    final double batasKurus = pria ? 18 : 17;
    final double batasIdeal = pria ? 25 : 23;
    const double batasGemuk = 27;

    if (bmi < batasKurus) return ('Kurus', Colors.orange);
    if (bmi <= batasIdeal) return ('Ideal', Colors.green);
    if (bmi <= batasGemuk) return ('Gemuk', Colors.deepOrange);
    return ('Obesitas', Colors.red);
  }

  void _hitungBMI() {
    FocusScope.of(context).unfocus();

    final double bb =
        double.tryParse(_bbController.text.replaceAll(',', '.')) ?? 0;
    final double tbCm =
        double.tryParse(_tbController.text.replaceAll(',', '.')) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        _hasilBMI = bb / (tbM * tbM);
      } else {
        _hasilBMI = null;
        _pesan = 'Data Tidak Valid!!!';
      }
    });
  }

  void _reset() {
    FocusScope.of(context).unfocus();
    _bbController.clear();
    _tbController.clear();

    setState(() {
      _hasilBMI = null;
      _pesan = 'Masukkan Data Anda!!!';
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double? hasil = _hasilBMI;
    final (String, Color)? kategori = hasil == null ? null : _kategori(hasil);
    final Color warna = kategori?.$2 ?? Colors.brown;
    final String labelGender =
        _gender == Gender.lakiLaki ? 'Laki-laki' : 'Perempuan';

    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.accessibility_new),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Jenis Kelamin',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      SegmentedButton<Gender>(
                        segments: const [
                          ButtonSegment(
                            value: Gender.lakiLaki,
                            icon: Icon(Icons.male),
                            label: Text('Laki-laki'),
                          ),
                          ButtonSegment(
                            value: Gender.perempuan,
                            icon: Icon(Icons.female),
                            label: Text('Perempuan'),
                          ),
                        ],
                        selected: {_gender},
                        style: SegmentedButton.styleFrom(
                          selectedBackgroundColor: Colors.brown,
                          selectedForegroundColor: Colors.white,
                        ),
                        onSelectionChanged: (pilihan) =>
                            setState(() => _gender = pilihan.first),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _bbController,
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.monitor_weight),
                          labelText: 'Berat Badan',
                          suffixText: 'kg',
                          filled: true,
                          fillColor: Colors.brown.shade50,
                          prefixIconColor: Colors.brown,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.brown, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _tbController,
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.height),
                          labelText: 'Tinggi Badan',
                          suffixText: 'cm',
                          filled: true,
                          fillColor: Colors.brown.shade50,
                          prefixIconColor: Colors.brown,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.brown, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: _hitungBMI,
                          icon: const Icon(Icons.calculate),
                          label: const Text('Hitung BMI',
                              style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            backgroundColor: Colors.brown,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: OutlinedButton.icon(
                          onPressed: _reset,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reset',
                              style: TextStyle(fontSize: 18)),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: warna.withValues(alpha: 0.12),
                  border: Border.all(color: warna, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      hasil == null
                          ? 'Hasil BMI'
                          : 'Hasil BMI ($labelGender)',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      hasil?.toStringAsFixed(1) ?? '--',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: warna,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      kategori?.$1 ?? _pesan,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: warna,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}