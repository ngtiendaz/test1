import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zing_project/views/home_page.dart';
import 'package:zing_project/views/library_page.dart';
import 'package:zing_project/views/search_page.dart';
import 'controllers/bottom_nav_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      home: Scaffold(
        body: Obx(() {
          switch (navController.currentIndex.value) {
            case 0:
              return HomePage();
            case 1:
              return SearchPage();
            case 2:
              return LibraryPage();
            default:
              return HomePage();
          }
        }),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) => navController.changeIndex(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tìm kiếm'),
            BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Thư viện'),
          ],
        )),
      ),
    );
  }
}
