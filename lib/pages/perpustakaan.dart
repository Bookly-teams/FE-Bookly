import 'package:fe_bookly/pages/tampilanperpustakaan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Perpustakaan());
}

class Perpustakaan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perpustakaan',
      home: TampilanPerpustakaan(),
    );
  }
}