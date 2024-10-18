import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomReservationCard extends StatelessWidget {
  const CustomReservationCard({super.key, required this.color});

  final ConstantsInstances constantsInstances = ConstantsInstances.instance;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {},
      child: Container(
        margin: constantsInstances.paddings.top16,
        width: 1.sw,
        height: 150.h,
        decoration: BoxDecoration(
          color: constantsInstances.colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _leftDivider(color),
            Expanded(
              child: Padding(
                padding: constantsInstances.paddings.horizontal12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _topCardWidget(color),
                    const SizedBox.shrink(),
                    _bottomCardWidget(color),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _bottomCardWidget(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Boxicons.bxs_user_account, color: color),
        SizedBox(
          width: 8.w,
        ),
        TextExtraBold(
          text: "2",
          color: Colors.black,
          fontsize: 14.sp,
        ),
        const Expanded(child: SizedBox.shrink()),
        Icon(Boxicons.bx_bookmark, color: color),
        SizedBox(
          width: 8.w,
        ),
        TextRegular(
          text: "VİP",
          color: Colors.black,
          fontsize: 14.sp,
        ),
        const Expanded(child: SizedBox.shrink()),
        TextRegular(
          text: "Ticket ID:123456",
          color: Colors.black,
          fontsize: 14.sp,
        ),
        const Expanded(child: SizedBox.shrink()),
        Container(
          padding: constantsInstances.paddings.all8,
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r)),
          child: TextRegular(text: "Closed", color: color),
        )
      ],
    );
  }

  Row _topCardWidget(Color color) {
    return Row(
      children: [
        Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(
          width: 8.w,
        ),
        TextSemiBold(
          text: "Balon Sistem",
          color: constantsInstances.colors.black,
        ),
        const Expanded(child: SizedBox.shrink()),
        Icon(
          Boxicons.bx_calendar_event,
          color: constantsInstances.colors.black,
        ),
        SizedBox(
          width: 4.w,
        ),
        TextRegular(
          text: "12.12.2020",
          color: constantsInstances.colors.black,
        ),
      ],
    );
  }

  Widget _leftDivider(Color color) {
    return Container(
      width: 16.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
        ),
      ),
    );
  }
}
