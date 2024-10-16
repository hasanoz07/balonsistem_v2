import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  final ConstantsInstances constants = ConstantsInstances.instance;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.login);
    });
  }
}
