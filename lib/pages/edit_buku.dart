import 'dart:io';
import 'package:fe_bookly/components/headers.dart';
import 'package:fe_bookly/pages/tulis.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditBuku extends StatefulWidget {
  const EditBuku({super.key});

  @override
  State<EditBuku> createState() => _EditBukuState();
}

class _EditBukuState extends State<EditBuku> {
  bool _loading = false;
  File? imageFile;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(
                      context: context,
                      title: 'Edit Buku',
                      destination: const Tulis(),
                    ),
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
                                image: imageFile == null
                                    ? null
                                    : DecorationImage(
                                        image: FileImage(imageFile!),
                                        fit: BoxFit.cover,
                                      ),
                                color: const Color(0xFFE4B1F0),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: imageFile == null
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Judul Cerita',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Assalamualaikum Ustadzah',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF6B6B6B),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 22),
                          Text(
                            'Deskripsi Cerita',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Assalamualaikum Ustadzah berkisah tentang perjalanan hidup Aisyah, seorang ustadzah muda yang baru saja ditugaskan di sebuah desa terpencil. Aisyah bertekad mengabdikan ilmunya untuk memberdayakan masyarakat, khususnya kaum perempuan yang selama ini terpinggirkan. Namun, kedatangannya tidak selalu disambut hangat; beberapa warga konservatif meragukan kemampuannya sebagai pemimpin perempuan. Cerita ini tidak hanya menyajikan lika-liku perjuangan, tetapi juga menyentuh tentang cinta yang tumbuh di antara dua insan yang dipersatukan oleh misi mulia.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B6B6B),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Daftar Isi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200, // Limit the height of the scrollable area
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              3,
                              (index) => Container(
                                    color: const Color(0xFFF1D8FF),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Prolog',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              '10/24/2024',
                                              style: TextStyle(
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
                                  )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
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
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Save action
                        },
                        child: const Text('Simpan'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
