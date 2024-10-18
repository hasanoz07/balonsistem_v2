import 'package:balonsistem/modules/home/home_controller.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomDaySelectWidget extends StatelessWidget {
  const CustomDaySelectWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
        color: controller.constants.colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
          children: List.generate(
        4,
        (index) {
          return _daySelectButton(controller.days[index], index);
        },
      )),
    );
  }

  Widget _daySelectButton(String day, int dayIndex) {
    return Obx(
      () => Expanded(
        child: Bounceable(
          onTap: dayIndex != 3
              ? () {
                  controller.selectedDayIndex.value = dayIndex;
                  controller.date = DateFormat('yyyy-MM-dd')
                      .format(DateTime.now().subtract(const Duration(days: 1)));
                }
              : () => controller.selectDate(Get.context!),
          child: Container(
            decoration: BoxDecoration(
              color: controller.selectedDayIndex.value == dayIndex
                  ? controller.constants.colors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: TextSemiBold(
                text: day,
                color: controller.selectedDayIndex.value == dayIndex
                    ? controller.constants.colors.black
                    : controller.constants.colors.white,
                weight: controller.selectedDayIndex.value == dayIndex
                    ? FontWeight.w700
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
