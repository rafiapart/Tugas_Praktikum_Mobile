import 'package:flutter/material.dart';
import 'package:card_jane/kartu_nama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Nama',
      debugShowCheckedModeBanner: false,
      home: KartuNama(),
    ); // MaterialApp
  }
}