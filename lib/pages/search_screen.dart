import 'dart:convert';

import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:fe_bookly/constant.dart';
import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/services/buku_services.dart';
import 'package:fe_bookly/services/user_services.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> stories = [];
  bool isLoading = true;

  Future<void> getStories() async {
    setState(() => isLoading = true);
    ApiResponse response = await getBuku();
    if (response.error == null) {
      if (response.data is List) {
        setState(() {
          stories = response.data as List<dynamic>;
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Data tidak valid')));
      }
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Masuk()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    getStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Telusuri',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Telusuri cerita',
                prefixIcon: Icon(Icons.search, color: Colors.purple),
                filled: true,
                fillColor: Colors.purple[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : stories.isEmpty
                      ? const Center(child: Text('Tidak ada buku'))
                      : ListView.builder(
                          itemCount: stories.length,
                          itemBuilder: (BuildContext context, int index) {
                            final story = stories[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: story.cover != null
                                        ? Image.memory(
                                            base64Decode(story.cover!),
                                            width: 100,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          )
                                        : Container(
                                            width: 100,
                                            height: 150,
                                            color: Colors.grey[300],
                                            child: const Icon(Icons.image),
                                          ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          story.judul ?? 'Tidak ada judul',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          story.namaPengguna ??
                                              'Tidak ada nama pengguna',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontFamily: 'Plus Jakarta Sans',
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          story.deskripsi ??
                                              'Tidak ada deskripsi',
                                          style: const TextStyle(fontSize: 14),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
            ),
            const SizedBox(height: 24),
            const CustomNavigationBar(
              currentIndex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
