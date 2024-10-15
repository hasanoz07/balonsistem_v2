import 'package:balonsistem/base/connection/connection_controller.dart';
import 'package:get/get.dart';

class ConnectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ConnectionController>(
      ConnectionController(),
      permanent: true,
    );
  }
}
