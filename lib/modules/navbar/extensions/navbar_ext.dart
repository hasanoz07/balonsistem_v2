import 'package:balonsistem/modules/navbar/enum/bottom_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NavBarExt on BottomPages {
  static const ConstantsInstances _constants = ConstantsInstances.instance;
  String get title {
    switch (this) {
      case BottomPages.home:
        return _constants.strings.home.tr;
      case BottomPages.reservations:
        return _constants.strings.reservations.tr;
      case BottomPages.forecast:
        return _constants.strings.forecast.tr;
      case BottomPages.account:
        return _constants.strings.account.tr;
    }
  }

  Widget get inActiveIcon {
    switch (this) {
      case BottomPages.home:
        return _inActiveIcon(Boxicons.bx_home);
      case BottomPages.reservations:
        return _inActiveIcon(Boxicons.bx_calendar);
      case BottomPages.forecast:
        return _inActiveIcon(Boxicons.bx_bar_chart);
      case BottomPages.account:
        return _inActiveIcon(Boxicons.bxs_user);
    }
  }

  Widget get icon {
    switch (this) {
      case BottomPages.home:
        return _activeIcon(Boxicons.bx_home);
      case BottomPages.reservations:
        return _activeIcon(Boxicons.bx_calendar);
      case BottomPages.forecast:
        return _activeIcon(Boxicons.bx_bar_chart);
      case BottomPages.account:
        return _activeIcon(Boxicons.bxs_user);
    }
  }

  Icon _activeIcon(IconData icon) => Icon(
        icon,
        color: _constants.colors.primary,
        size: 26.r,
      );
  Icon _inActiveIcon(IconData icon) => Icon(
        icon,
        color: _constants.colors.black,
        size: 20.r,
      );
}
