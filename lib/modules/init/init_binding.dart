import 'package:balonsistem/modules/init/init_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitController>(() => InitController());
  }
}
