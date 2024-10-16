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
  //İnput Decoration Theme
  Color get boysenberryShadow => const Color(0xFFf1f4fb);
  Color get white54 => const Color(0x8AFFFFFF);

  //Old Project Colors
  //-------- Change all Colors below with your desied colors hash values for your project (OPTIONAL):

  Color get splashtextcolor => const Color(0xffFFFFFF);

  //---------- All other color values that need not change neccessarily unless you are a developer-----

  Color get greyBorder => const Color(0xffdddde8);
  Color get appbar => const Color(0xffFFFFFF);
  Color get chatBubbleColor => const Color(0xffBBDEFB);
  Color get appbartexticon => const Color(0xff242425);
  Color get backgroundcolor => const Color(0xfff4f5f9);

  Color get greylightcolor => const Color(0xfff1f4fb);
  Color get greytext => const Color(0xff88889b);
  Color get greydark => const Color(0xffd3d5df);
  Color get grey => const Color(0xff61729b);
  Color get mask => const Color(0xff000000);
  Color get greenbuttoncolor => const Color(0xff5DBB7C);
  Color get ordercard => const Color(0xff727791);
  Color get green => const Color(0xff1fa264);
  Color get greensqaush => const Color(0xff33C177);
  Color get pink => const Color(0xffff2f74);
  Color get red => const Color(0xffe35d6f);
  Color get cyan => const Color(0xff56c3d9);
  Color get yellow => const Color(0xfff6ba49);
  Color get blue => const Color(0xff54a3f1);
  Color get purple => const Color(0xff596ad6);
  Color get scaffoldbcg => const Color(0xffF6F7FA);
  Color get whitelight => const Color(0xffF6F6F6);
  Color get orange => const Color(0xffefa031);
  Color get notificationdotcolor => const Color(0xff4CAF50);
  Color get favoritedotcolor => const Color(0xff00BCD4);
  Color get whitedim => const Color(0xffFFFFFF).withOpacity(0.87);
  Color get ratingcolorbcg => const Color(0xff59AC05);
  Color get onlinetag => const Color(0xff6BD438);
  Color get gorgonzolaBlue => const Color(0xff5966d5);

  // Helper function to convert hex color strings to Color
  Color hexToColor(String hexCode) {
    final hexColor = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}
