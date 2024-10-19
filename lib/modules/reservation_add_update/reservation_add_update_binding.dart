import 'package:balonsistem/modules/reservation_add_update/reservation_add_update_controller.dart';
import 'package:get/get.dart';

class ReservationAddUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationAddUpdateController>(
        () => ReservationAddUpdateController());
  }
}
