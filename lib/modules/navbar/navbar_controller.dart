import 'package:balonsistem/modules/navbar/helpers/navbar_helper.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final NavBarHelpers navBarHelpers = NavBarHelpers.instance;

  void onTapNavBarItem(int value) {
    currentIndex.value = value;
    while (Get.currentRoute != Routes.navBar) {
      Get.back();
    }
  }
}
