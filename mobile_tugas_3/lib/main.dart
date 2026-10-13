import 'package:flutter/material.dart';
import 'package:mobile_tugas_3/KalkulatorBMI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      home: BMIScreen(),
    );
  }
}

