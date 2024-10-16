import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/helpers/loading_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  ConstantsInstances constants = ConstantsInstances.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    LoadingHelpers.showLoadingDialog();

    await Future.delayed(const Duration(seconds: 2), () {
      LoadingHelpers.hideLoadingDialog();
      Get.offAllNamed('/navBar');
    });
  }
}
