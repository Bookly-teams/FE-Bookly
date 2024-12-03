// lib/pages/create_buku.dart
import 'dart:io';
import 'package:fe_bookly/constant.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/components/create_cover.dart';
import 'package:fe_bookly/components/create_book_form.dart';
import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/pages/create_bagian.dart';
import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/pages/tulis.dart';
import 'package:fe_bookly/services/buku_services.dart';
import 'package:fe_bookly/services/user_services.dart';

class CreateBuku extends StatefulWidget {
  const CreateBuku({super.key});

  @override
  State<CreateBuku> createState() => _CreateBukuState();
}

class _CreateBukuState extends State<CreateBuku> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false; // Remove final to make it mutable
  File? imageFile;

  void _handleImageSelected(File image) {
    setState(() {
      imageFile = image;
    });
  }

  void _createBook(String title, String description) async {
    setState(() {
      _loading = true;
    });

    String? image = imageFile == null ? null : getStringImage(imageFile);
    ApiResponse response = await tambahBuku(image ?? '', title, description);

    setState(() {
      _loading = false;
    });

    if (response.error == null) {
      int? bukuId;
      if (response.data != null && response.data is Map<String, dynamic>) {
        // Konversi ke int
        bukuId = int.tryParse(
            (response.data as Map<String, dynamic>)['buku_id'].toString());

        print('Buku ID yang didapat: $bukuId'); // Debug print

        if (bukuId != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateBagian(bukuId: bukuId!),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gagal mendapatkan ID buku')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Response data tidak valid')),
        );
      }
    } else if (response.error == unauthorized) {
      logout().then((_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Masuk()),
          (route) => false,
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.error}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 480),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 21),
                      CreateCover(
                        imageFile: imageFile,
                        onImageSelected: _handleImageSelected,
                      ),
                      const SizedBox(height: 55),
                      CreateBookForm(
                        formKey: _formKey,
                        onSubmit: _createBook,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Tulis()),
                  (route) => false);
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 9),
          const Text(
            'Tambahkan Informasi Cerita',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
