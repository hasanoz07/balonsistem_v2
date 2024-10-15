import 'package:balonsistem/shared/extensions/padding_ext.dart';
import 'package:flutter/widgets.dart';

final class AppPaddings {
  const AppPaddings._();

  static const AppPaddings instance = AppPaddings._();

  EdgeInsets get horizontal => 12.padHorizontal;
  EdgeInsets get vertical => 8.padVertical;
}
