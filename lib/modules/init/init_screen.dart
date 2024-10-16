import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/init/init_controller.dart';
import 'package:balonsistem/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class InitScreen extends GetView<InitController> {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        decoration: BoxDecoration(color: controller.constants.colors.primary),
        child: Center(
          child: SizedBox(
            height: 100.h,
            child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: [
                  AppColors.instance.dodgerollGold,
                  AppColors.instance.oceanDepths,
                ]),
          ),
        ),
      ),
    );
  }
}
