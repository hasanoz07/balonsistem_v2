import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/login/login_controller.dart';
import 'package:balonsistem/shared/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: controller.constants.colors.primary,
      body: Center(
          child: Text("data",
              style: TextStyle(
                  fontSize: 20, fontFamily: AppFonts.SEMI_BOLD.value))),
    );
  }
}
