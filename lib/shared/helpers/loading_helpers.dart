import 'package:balonsistem/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingHelpers {
  static void showLoadingDialog(BuildContext context) {
    Get.dialog(_loadingWidget());
  }

  static void hideLoadingDialog(BuildContext context) {
    Get.back();
  }

  static Center _loadingWidget() {
    return Center(
      child: SizedBox(
        height: 100.h,
        child:
            LoadingIndicator(indicatorType: Indicator.ballRotateChase, colors: [
          AppColors.instance.dodgerollGold,
          AppColors.instance.oceanDepths,
        ]),
      ),
    );
  }
}
