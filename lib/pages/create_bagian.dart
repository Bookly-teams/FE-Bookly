import 'package:fe_bookly/pages/create_buku.dart';
import 'package:flutter/material.dart';

class CreateBagian extends StatefulWidget {
  const CreateBagian({super.key});

  @override
  State<CreateBagian> createState() => _CreateBagianState();
}

class _CreateBagianState extends State<CreateBagian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateBuku()));
      },
    ));
  }
}
