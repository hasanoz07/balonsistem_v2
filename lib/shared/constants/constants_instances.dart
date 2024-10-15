import 'package:balonsistem/shared/constants/colors.dart';
import 'package:balonsistem/shared/constants/strings.dart';

final class ConstantsInstances {
  const ConstantsInstances._();

  static const ConstantsInstances instance = ConstantsInstances._();

  // General Instances
  final AppColors colors = AppColors.instance;
  final AppStrings strings = AppStrings.instance;
}
