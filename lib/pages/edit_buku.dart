import 'dart:convert';
import 'dart:io';
import 'package:fe_bookly/constant.dart';
import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/pages/tulis.dart';
import 'package:fe_bookly/services/buku_services.dart';
import 'package:fe_bookly/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditBuku extends StatefulWidget {
  final int? bukuId;
  const EditBuku({super.key, this.bukuId});

  @override
  State<EditBuku> createState() => _EditBukuState();
}

class _EditBukuState extends State<EditBuku> {
  bool _loading = false;
  File? imageFile;
  List<dynamic> _dataBuku = [];
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // Updated method name
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> ambilDataBuku() async {
    setState(() {
      _loading = true;
    });

    try {
      ApiResponse response = await lihatSatuBuku(widget.bukuId!);

      if (response.error == null) {
        if (response.data is List) {
          setState(() {
            _dataBuku = response.data as List<dynamic>;
            _loading = false;
          });
        }
      } else if (response.error == unauthorized) {
        if (mounted) {
          await logout();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Masuk()),
            (route) => false,
          );
        }
      } else {
        setState(() {
          _loading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${response.error}')));
        }
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  List<Widget> buildDaftarIsi() {
    return _dataBuku.isNotEmpty && _dataBuku[0].bagian != null
        ? List.generate(
            _dataBuku[0].bagian.length,
            (index) => Container(
              color: const Color(0xFFF1D8FF),
              margin: const EdgeInsets.symmetric(vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _dataBuku[0].bagian![index].judulBagian ??
                            'Judul Bagian tidak tersedia',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _dataBuku[0].bagian![index].tanggalPublikasi != null
                            ? DateFormat('dd/MM/yyyy').format(DateTime.parse(
                                _dataBuku[0].bagian![index].tanggalPublikasi!))
                            : 'Tanggal tidak tersedia',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B6B6B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/icon_trash.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        : [
            const Center(
              child: Text('Tidak ada bab tersedia'),
            )
          ];
  }

  @override
  void initState() {
    super.initState();
    ambilDataBuku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Buku'),
        backgroundColor: Colors.white, // Fixed color
        elevation: 0, // Optional: removes shadow
        scrolledUnderElevation: 0, // Prevents color change on scroll
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tulis(),
                ),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: getImage,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                          vertical: 22,
                        ),
                        height: 154,
                        color: const Color(0xFFF9EFFF),
                        child: Row(
                          children: [
                            Container(
                              width: 78,
                              height: 110,
                              decoration: BoxDecoration(
                                image: (_dataBuku.isNotEmpty &&
                                        _dataBuku[0].cover != null)
                                    ? DecorationImage(
                                        image: MemoryImage(
                                            base64Decode(_dataBuku[0].cover)),
                                        fit: BoxFit.cover,
                                      )
                                    : (imageFile != null
                                        ? DecorationImage(
                                            image: FileImage(imageFile!),
                                            fit: BoxFit.cover,
                                          )
                                        : null),
                                color: const Color(0xFFE4B1F0),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: (imageFile == null &&
                                      (_dataBuku.isEmpty ||
                                          _dataBuku[0].cover == null))
                                  ? Center(
                                      child: Image.asset(
                                        'assets/images/create_plus.png',
                                        width: 24,
                                        height: 24,
                                        semanticLabel: 'Add Cover Icon',
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 24),
                            const Expanded(
                              child: Text(
                                'Edit Sampul Cerita',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Judul Cerita',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            _dataBuku.isNotEmpty
                                ? (_dataBuku[0].judul ?? 'Judul tidak tersedia')
                                : 'Judul tidak tersedia',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6B6B6B),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 22),
                          const Text(
                            'Deskripsi Cerita',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            _dataBuku.isNotEmpty
                                ? (_dataBuku[0].deskripsi ??
                                    'Deskripsi tidak tersedia')
                                : 'Deskripsi tidak tersedia',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B6B6B),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Daftar Isi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Limit the height of the scrollable area
                    SingleChildScrollView(
                      child: Column(
                        children: buildDaftarIsi(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9EFFF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/create_plus.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'Tambah Bab',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF433878),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      ),
    );
  }
}
