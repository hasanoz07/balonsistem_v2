import 'package:balonsistem/modules/navbar/enum/bottom_pages.dart';
import 'package:balonsistem/modules/navbar/navbar_controller.dart';
import 'package:balonsistem/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  final NavBarController controller;
  const CustomNavBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: controller.onTapNavBarItem,
        backgroundColor: AppColors.instance.backgroundColor,
        elevation: 0,
        items: [
          controller.navBarHelpers.build(
            type: BottomPages.home,
          ),
          controller.navBarHelpers.build(
            type: BottomPages.reservations,
          ),
          controller.navBarHelpers.build(
            type: BottomPages.forecast,
          ),
          controller.navBarHelpers.build(
            type: BottomPages.account,
          ),
        ],
      ),
    );
  }
}
