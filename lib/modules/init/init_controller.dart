import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/helpers/loading_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  final ConstantsInstances constants = ConstantsInstances.instance;
  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoadingHelpers.showLoadingDialog(Get.context!);
    });

    await Future.delayed(const Duration(seconds: 2), () {});
    LoadingHelpers.hideLoadingDialog(Get.context!);
    Get.offAllNamed(Routes.login);
  }
}
