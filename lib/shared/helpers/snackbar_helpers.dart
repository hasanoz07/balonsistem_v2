import 'package:balonsistem/shared/constants/colors.dart';
import 'package:get/get.dart';

class SnackbarHelpers {
  static const double opacity = 0.5;

  static void showSuccesSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.instance.white,
      backgroundColor: AppColors.instance.green.withOpacity(opacity),
    );
  }

  static void showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.instance.white,
      backgroundColor: AppColors.instance.red.withOpacity(opacity),
    );
  }

  static void showInfoSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.instance.white,
      backgroundColor: AppColors.instance.blue.withOpacity(opacity),
    );
  }

  static void showSystemSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.instance.white,
      backgroundColor: AppColors.instance.primary.withOpacity(opacity),
    );
  }
}
