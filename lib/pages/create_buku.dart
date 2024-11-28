import 'package:fe_bookly/pages/create_bagian.dart';
import 'package:fe_bookly/pages/tulis.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/components/create_cover.dart';
import 'package:fe_bookly/components/create_book_form.dart';
import 'package:fe_bookly/components/add_chapter.dart';

class CreateBuku extends StatefulWidget {
  const CreateBuku({super.key});

  @override
  State<CreateBuku> createState() => _CreateBukuState();
}

class _CreateBukuState extends State<CreateBuku> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 480),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20), // Fixed margin
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const Tulis()),
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
                      ),
                      const SizedBox(height: 21),
                      const CreateCover(),
                      const SizedBox(height: 55),
                      Form(
                        key: _formKey,
                        child: const CreateBookForm(),
                      ),
                      const SizedBox(height: 269),
                      Center(
                        child: AddChapterButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CreateBagian(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
