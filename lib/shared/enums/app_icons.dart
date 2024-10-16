import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppIcons {
  tr("tr"),
  us("us"),
  appIcon("app_icon");

  final String value;
  const AppIcons(this.value);

  SvgPicture get svg => SvgPicture.asset(
        "assets/icons/$value.svg",
      );
  Image get png => Image.asset(
        "assets/icons/$value.png",
      );
  Image get jpg => Image.asset(
        "assets/icons/$value.jpg",
      );
}

extension AppIconsExt on AppIcons {
  SvgPicture svgWithAttiributes({
    required Color color,
    double? height,
  }) {
    return SvgPicture.asset(
      "assets/icons/$value.svg",
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: height,
    );
  }
}
