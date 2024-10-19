import 'package:balonsistem/modules/navbar/helpers/navbar_helper.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final NavBarHelpers navBarHelpers = NavBarHelpers.instance;

  void onTapNavBarItem(int value) {
    value == 2
        ? SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ])
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);

    currentIndex.value = value;
    while (Get.currentRoute != Routes.navBar) {
      Get.back();
    }
  }
}
