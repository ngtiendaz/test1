import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AlbumDetailPage extends StatefulWidget {
  final String albumName;
  final String imageUrl;

  const AlbumDetailPage({
    Key? key,
    required this.albumName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  Color dominantColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl),
    );
    setState(() {
      // Ưu tiên vibrantColor -> không có thì fallback về dominantColor
      dominantColor =
          generator.vibrantColor?.color ??
          generator.dominantColor?.color ??
          Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          // Header với gradient
          Container(
            padding: const EdgeInsets.all(5),
            height: 380, // Chiều cao header
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  dominantColor.withOpacity(0.9), // sáng
                  dominantColor.withOpacity(0.6), // trung gian
                  const Color(0xFF121212), // nền tối
                ],
                stops: const [0.0, 0.4, 2.1],
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.imageUrl,
                          width: 210,
                          height: 210,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.albumName,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Wrxdie",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 30, // cách mép trên
                   // cách mép trái
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white70,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Danh sách bài hát nền đen
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                ListTile(
                  title: Text(
                    "1000 Ánh Mắt",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Shiki, Obito",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Anh Vẫn Đợi",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Shiki",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Có Đôi Điều",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Shiki",
                    style: TextStyle(color: Colors.white70),
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
