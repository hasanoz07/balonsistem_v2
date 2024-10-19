import 'package:balonsistem/modules/init/init_binding.dart';
import 'package:balonsistem/modules/init/init_screen.dart';
import 'package:balonsistem/modules/last_added_reservations/last_added_reservations_binding.dart';
import 'package:balonsistem/modules/last_added_reservations/last_added_reservations_screen.dart';
import 'package:balonsistem/modules/login/login_binding.dart';
import 'package:balonsistem/modules/login/login_screen.dart';
import 'package:balonsistem/modules/navbar/navbar_binding.dart';
import 'package:balonsistem/modules/navbar/navbar_screen.dart';
import 'package:balonsistem/modules/notifications/notifications_binding.dart';
import 'package:balonsistem/modules/notifications/notifications_screen.dart';
import 'package:balonsistem/modules/reservation_add_update/reservation_add_update_binding.dart';
import 'package:balonsistem/modules/reservation_add_update/reservation_add_update_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

final class AppPages {
  AppPages._();

  static final AppPages instance = AppPages._();

  final String initial = Routes.init;

  final List<GetPage<dynamic>> routes = <GetPage>[
    GetPage(
      name: Routes.init,
      page: () => const InitScreen(),
      binding: InitBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.navBar,
      page: () => const NavbarScreen(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationsScreen(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.reservationAddUpdate,
      page: () => const ReservationAddUpdateScreen(),
      binding: ReservationAddUpdateBinding(),
    ),
    GetPage(
      name: Routes.lastAddedReservations,
      page: () => const LastAddedReservationsScreen(),
      binding: LastAddedReservationsBinding(),
    ),
  ];
}
