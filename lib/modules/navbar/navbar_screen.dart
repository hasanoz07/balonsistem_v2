import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/navbar/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarScreen extends GetView<NavBarController> {
  final PreferredSizeWidget? appBar;
  const NavbarScreen({
    super.key,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: false,
      body: PopScope(
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) {
            controller.currentIndex.value = 0;
          }
        },
        child: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: controller.navBarHelpers.screens,
          ),
        ),
      ),
      navBarController: controller,
    );
  }
}
