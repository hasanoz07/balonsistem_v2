import 'package:balonsistem/modules/account/account_screen.dart';
import 'package:balonsistem/modules/forecast/forecast_screen.dart';
import 'package:balonsistem/modules/home/home_screen.dart';
import 'package:balonsistem/modules/navbar/enum/bottom_pages.dart';
import 'package:balonsistem/modules/navbar/extensions/navbar_ext.dart';
import 'package:balonsistem/modules/reservations/reservations_screen.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:flutter/material.dart';

final class NavBarHelpers {
  NavBarHelpers._();

  static final NavBarHelpers instance = NavBarHelpers._();

  final List<Widget> screens = [
    const HomeScreen(),
    const ReservationsScreen(),
    const ForecastScreen(),
    const AccountScreen(),
  ];
  final ConstantsInstances constants = ConstantsInstances.instance;

  BottomNavigationBarItem build({required BottomPages type}) {
    return BottomNavigationBarItem(
      activeIcon: type.icon,
      icon: type.inActiveIcon,
      label: type.title,
    );
  }
}
