import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    this.date,
    this.title,
    this.desc,
  });
  final ConstantsInstances _constants = ConstantsInstances.instance;
  final String? date;
  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _constants.paddings.all12,
      height: 150.h,
      decoration: BoxDecoration(
          color: _constants.colors.white,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                    color: _constants.colors.primary.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    size: 20.r,
                    color: _constants.colors.primary,
                  ),
                ),
              ),
              TextLight(
                text: date ?? "-",
                color: _constants.colors.black,
                fontsize: 14.sp,
              )
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          TextBold(
            text: title ?? "-",
            fontsize: 16.sp,
            maxlines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4.h,
          ),
          TextRegular(
            text: desc ?? "-",
            color: _constants.colors.black,
            fontsize: 14.sp,
            maxlines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4.h,
          ),
        ],
      ),
    );
  }
}
