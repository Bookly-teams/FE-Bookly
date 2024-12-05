import 'package:fe_bookly/pages/tulis.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/constant.dart';
import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/services/bagian_services.dart';
import 'package:fe_bookly/services/user_services.dart';

class CreateBagiansForm extends StatefulWidget {
  final int bukuId; // Changed from String to int

  const CreateBagiansForm({
    super.key,
    required this.bukuId,
  });

  @override
  State<CreateBagiansForm> createState() => _CreateBagiansFormState();
}

class _CreateBagiansFormState extends State<CreateBagiansForm> {
  final TextEditingController _judulBagianController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void _createBagian(String judul, String content) async {
    setState(() {
      isLoading = true;
    });

    ApiResponse response = await tambahBagian(
      judul,
      content,
      widget.bukuId,
    );

    setState(() {
      isLoading = false;
    });

    if (response.error == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Tulis(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bagian berhasil ditambahkan'),
        ),
      );
    } else if (response.error == unauthorized) {
      if (!mounted) return;
      logout().then((_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Masuk()),
          (route) => false,
        );
      });
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _judulBagianController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              0,
              20,
              MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul TextField
                  TextFormField(
                    controller: _judulBagianController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Beri Judul Bagian Ceritamu',
                      hintStyle: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF1D1D1D),
                        fontSize: 12,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF1D1D1D),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Content TextField in Expanded
                  SizedBox(
                    height: constraints.maxHeight * 0.8,
                    child: TextFormField(
                      controller: _contentController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Konten tidak boleh kosong';
                        }
                        return null;
                      },
                      maxLines: null,
                      expands:
                          true, // Makes TextField expand to fill available space
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        hintText: 'Ketuk di sini untuk memulai menulis',
                        hintStyle: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF1D1D1D),
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF1D1D1D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Save Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _createBagian(
                            _judulBagianController.text,
                            _contentController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF9EFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF433878),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
