import 'package:flutter/material.dart';
import 'daftar_baca.dart';

class NovelPage extends StatefulWidget {
  final String title;
  final String content;
  final String novelTitle;

  const NovelPage({
    Key? key,
    required this.title,
    required this.content,
    required this.novelTitle,
  }) : super(key: key);

  @override
  _NovelPageState createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  static const double _initialAppBarHeight = 200;
  double _appBarHeight = _initialAppBarHeight;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _appBarHeight = (_initialAppBarHeight - _scrollController.offset)
          .clamp(56.0, _initialAppBarHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: _appBarHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.7),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/cover_baca.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.novelTitle, // Use passed novel title
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NovelChapterPage(
                          novelTitle: widget.novelTitle, // Pass novel title
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title, // Use passed chapter title
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.content, // Use passed chapter content
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6D4C41),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}