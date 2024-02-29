import 'package:aldmictest/controller/navigationcontroller.dart';
import 'package:aldmictest/screens/favorite/favoritepage.dart';
import 'package:aldmictest/screens/listpage/listpage.dart';
import 'package:aldmictest/screens/profile/aboutus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController();
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex,
            children: const [
              HomePage(),
              FavoritePage(),
              AboutUS(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 0, 73, 134),
              selectedItemColor: Colors.white,
              unselectedItemColor: const Color.fromARGB(255, 0, 19, 39),
              currentIndex: controller.selectedIndex,
              onTap: (index) {
                controller.setSelectedIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.bookmark), label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.person), label: 'About us'),
              ]),
        ));
  }
}
