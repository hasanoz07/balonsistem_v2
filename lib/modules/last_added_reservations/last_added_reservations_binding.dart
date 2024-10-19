import 'package:balonsistem/modules/last_added_reservations/last_added_reservations_controller.dart';
import 'package:get/get.dart';

class LastAddedReservationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LastAddedReservationsController>(
      () => LastAddedReservationsController(),
    );
  }
}
