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
  //All Padding
  EdgeInsets get all16 => 16.padAll;
}
