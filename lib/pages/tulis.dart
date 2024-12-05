import 'package:fe_bookly/constant.dart';
import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/models/buku.dart';
import 'package:fe_bookly/pages/create_buku.dart';
import 'package:fe_bookly/pages/edit_buku.dart';
import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:fe_bookly/components/story_card.dart';
import 'package:fe_bookly/services/buku_services.dart';

class Tulis extends StatefulWidget {
  const Tulis({super.key});

  @override
  State<Tulis> createState() => _TulisState();
}

class _TulisState extends State<Tulis> {
  List<dynamic> _getBukuUser = []; // Ubah menjadi List<dynamic>
  int userId = 0;

  Future<void> ambilBukuUser() async {
    userId = await getUserId();
    ApiResponse response = await getBukuUser();

    // Pastikan response.data adalah List dan tidak null
    if (response.error == null) {
      if (response.data is List) {
        setState(() {
          _getBukuUser = response.data
              as List<dynamic>; // Asumsikan ada metode fromJson di model Buku
        });
      } else {
        // Jika data bukan List, tampilkan pesan kesalahan
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Data tidak valid')));
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
    ambilBukuUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await ambilBukuUser();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tulis',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 2,
                    fontFamily: 'Plus Jakarta Sans',
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.9, // Sesuaikan rasio aspek sesuai kebutuhan
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount:
                        _getBukuUser.length + 1, // Add 1 for NewStoryCard
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CreateBuku(),
                                ),
                              );
                            },
                            child: const NewStoryCard(),
                          ),
                        );
                      }
                      // Adjust index for actual book items
                      final bukus = _getBukuUser[index - 1] as Buku;
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditBuku(bukuId: bukus.id),
                              ),
                            );
                          },
                          child: StoryCard(
                            cover: bukus.cover,
                            judul: bukus.judul,
                            totalBagian: bukus.totalBagian,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const CustomNavigationBar(
                  currentIndex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
