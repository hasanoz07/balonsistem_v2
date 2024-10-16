import 'package:flutter/material.dart';

enum AppImages {
  splashBranding("splash_branding"),
  brandIcon("brand_icon"),
  splashLogo("splash_logo");

  final String value;
  const AppImages(this.value);

  Image get png => Image.asset(
        "assets/images/$value.png",
      );
  Image get jpg => Image.asset(
        "assets/icons/$value.jpg",
      );
}

extension AppImagesExtension on AppImages {
  Image pngWithAttiributes({
    required Color color,
    double? height,
  }) {
    return Image.asset(
      "assets/images/$value.png",
      color: color,
      height: height,
    );
  }
}
