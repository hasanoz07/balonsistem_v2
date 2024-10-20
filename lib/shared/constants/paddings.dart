import 'package:balonsistem/shared/extensions/padding_ext.dart';
import 'package:flutter/widgets.dart';

final class AppPaddings {
  const AppPaddings._();

  static const AppPaddings instance = AppPaddings._();
  //Horizontal Padding
  EdgeInsets get horizontal12 => 12.padHorizontal;
  EdgeInsets get horizontal8 => 8.padHorizontal;
  //Vertical Padding
  EdgeInsets get vertical8 => 8.padVertical;
  //Top Padding
  EdgeInsets get top8 => 8.padTop;
  EdgeInsets get top16 => 16.padTop;
  EdgeInsets get top100 => 100.padTop;
  //Bottom Padding
  EdgeInsets get bottom8 => 8.padBottom;
  EdgeInsets get bottom12 => 12.padBottom;
  EdgeInsets get bottom16 => 16.padBottom;
  //Left Padding
  EdgeInsets get left8 => 8.padLeft;
  EdgeInsets get left12 => 12.padLeft;
  //Right Padding
  EdgeInsets get right8 => 8.padRight;
  EdgeInsets get right12 => 12.padRight;

  //All Padding
  EdgeInsets get all16 => 16.padAll;
  EdgeInsets get all12 => 12.padAll;
  EdgeInsets get all8 => 8.padAll;
}
