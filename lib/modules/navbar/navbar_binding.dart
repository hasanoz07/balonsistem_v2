import 'package:balonsistem/modules/account/account_controller.dart';
import 'package:balonsistem/modules/forecast/forecast_controller.dart';
import 'package:balonsistem/modules/home/home_controller.dart';
import 'package:balonsistem/modules/navbar/navbar_controller.dart';
import 'package:balonsistem/modules/reservations/reservations_controller.dart';
import 'package:get/get.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ReservationsController>(() => ReservationsController());
    Get.lazyPut<ForecastController>(() => ForecastController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
