import 'package:balonsistem/base/connection/connection_controller.dart';
import 'package:balonsistem/modules/navbar/navbar_controller.dart';
import 'package:balonsistem/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScaffold extends GetView<ConnectionController> {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final NavBarController? navBarController;
  const BaseScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    this.floatingActionButton,
    this.navBarController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: navBarController != null
          ? SizedBox(
              height: navBarController!.currentIndex.value == 2 ? 44.h : 89.h,
              child: CustomNavBar(controller: navBarController!))
          : null,
    );
  }
}
