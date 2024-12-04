import 'package:fe_bookly/components/navigation_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      'image': "assets/images/binarrembulan.png",
      'title': 'Binar Rembulan',
      'author': '@arrinda_sell',
      'description': 'Tidak sesuai namanya yang menggambarkan keindahan...',
    },
    {
      'image': "assets/images/orangbiasa.png",
      'title': 'Orang Biasa',
      'author': '@marronad',
      'description': 'Adipati terpaksa menikah sepeninggal...',
    },
    {
      'image': "assets/images/serdadubulan.png",
      'title': 'Serdadu Bulan',
      'author': '@killmill77',
      'description': 'Lunar mengaku satu hal: gadis itu telah jatuh cinta...',
    },
    {
      'image': "assets/images/afeatheraway.png",
      'title': 'A Feather Away',
      'author': '@eternalblooms',
      'description':
          'Pada pesta dansa musim dingin bertema masquerade, siapa sangka kalau Lyra...',
    },
  ];

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
              child: ListView.builder(
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            story['image']!,
                            width: 80,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                story['title']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                story['author']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'Plus Jakarta Sans',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                story['description']!,
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
