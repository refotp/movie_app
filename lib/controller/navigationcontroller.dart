import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
  }
}
