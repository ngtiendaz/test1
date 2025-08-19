import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'album_detail_page.dart';

class HomePage extends StatelessWidget {
  final List<String> albums = ['Đợi', 'Album 2', 'Album 3', 'Album 4'];

  Widget buildHorizontalList(BuildContext context, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Chuyển trang khi bấm vào album
                  Get.to(() => AlbumDetailPage(albumName: items[index],
                    imageUrl: 'https://tse2.mm.bing.net/th/id/OIP.RGgv-V2Nag5E2gYhGwWR8AAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',));
                },
                child: Container(
                  width: 120,
                  margin: EdgeInsets.only(right: 12),
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(items[index], style: TextStyle(color: Colors.white)),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        buildHorizontalList(context, 'Albums', albums),
        // Có thể thêm các section khác như Top100, Chill,...
      ],
    );
  }
}
