import 'package:balonsistem/modules/home/home_controller.dart';
import 'package:balonsistem/shared/widgets/custom_day_select.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFlexibleSpaceBar extends StatelessWidget {
  const HomeFlexibleSpaceBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: controller.constants.paddings.horizontal12,
        child: Container(
          margin: controller.constants.paddings.top120,
          child: Column(
            children: [
              //Day Select
              CustomDaySelectWidget(controller: controller),
              SizedBox(
                height: 12.h,
              ),
              Expanded(
                child: Row(
                  children: [
                    _homeInfoCardWidget(
                        "4",
                        "Konfirme",
                        Boxicons.bx_check_circle,
                        controller.constants.colors.confirmationCard),
                    SizedBox(
                      width: 8.h,
                    ),
                    _homeInfoCardWidget("100", "Kapasite", Boxicons.bx_group,
                        controller.constants.colors.capacityCard),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Expanded(
                child: Row(
                  children: [
                    _homeInfoCardWidget("4", "Beklemede", Boxicons.bx_hourglass,
                        controller.constants.colors.waitingCard),
                    SizedBox(
                      width: 4.h,
                    ),
                    _homeInfoCardWidget("50", "Paslandi", Boxicons.bx_code,
                        controller.constants.colors.rustesdCard),
                    SizedBox(
                      width: 4.h,
                    ),
                    _homeInfoCardWidget("5", "İptal", Boxicons.bx_calendar_x,
                        controller.constants.colors.red),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _homeInfoCardWidget(
      String pax, String cardName, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: controller.constants.paddings.all8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiBold(
                  text: cardName,
                  fontsize: 12.sp,
                ),
                Icon(
                  icon,
                  color: controller.constants.colors.white,
                ),
              ],
            ),
            Row(
              children: [
                TextExtraBold(
                  text: pax,
                  fontsize: 28.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                const TextLight(text: "pax"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
