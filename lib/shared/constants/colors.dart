import 'dart:ui';

final class AppColors {
  const AppColors._();

  static const AppColors instance = AppColors._();

  // Primary Colors
  Color get primary => const Color(0xff5966d5);
  Color get secondary => const Color(0xff37adf5);
  Color get splashTextColor => const Color(0xffFFFFFF);

  Color get white => const Color(0xFFFFFFFF);
  Color get scaffoldBackground => const Color(0xffF6F7FA);
  Color get backgroundColor => const Color(0xfff4f5f9);

  Color get appBar => const Color(0xFFFFFFFF);
  Color get black => const Color(0xff353f58);

  // Brand Colors
  Color get dodgerollGold => const Color(0xFFf59d15);
  Color get oceanDepths => const Color(0xFF1e3d59);

  // Helper function to convert hex color strings to Color
  Color hexToColor(String hexCode) {
    final hexColor = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}
