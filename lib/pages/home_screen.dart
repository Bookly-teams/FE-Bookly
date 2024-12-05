import 'dart:convert';

import 'package:fe_bookly/constant.dart';
import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/models/buku.dart';
import 'package:fe_bookly/pages/detail_buku.dart';
import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/services/buku_services.dart';
import 'package:fe_bookly/services/user_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    super.initState();
    getStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Beranda',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : stories.isEmpty
                    ? const Center(child: Text('Tidak ada buku'))
                    : ListView.builder(
                        itemCount: stories.length,
                        itemBuilder: (BuildContext context, int index) {
                          final story = stories[index] as Buku;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailNovelPage(),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
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
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            story.judul ?? 'Tidak ada judul',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Plus Jakarta Sans',
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            story.namaPengguna ??
                                                'Tidak ada nama pengguna',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[700],
                                              fontFamily: 'Plus Jakarta Sans',
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.list,
                                                size: 16,
                                                color: Colors.grey[700],
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                '${story.totalBagian ?? 0} Bagian',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[700],
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            story.deskripsi ??
                                                'Tidak ada deskripsi',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Plus Jakarta Sans',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
