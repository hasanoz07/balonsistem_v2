import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.height,
    this.flexibleSpace,
  });

  final double height;
  final ConstantsInstances _constants = ConstantsInstances.instance;
  final Widget? flexibleSpace;
  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
        expandedHeight: height,
        floating: true,
        pinned: true,
        backgroundColor: _constants.colors.primary,
        leadingWidth: 130.w,
        leading: Padding(
          padding: _constants.paddings.left12,
          child: Bounceable(
            onTap: () {},
            child: Row(
              children: [
                const TextExtraBold(text: "Bütün Firmalar "),
                Icon(
                  Icons.arrow_downward_sharp,
                  color: _constants.colors.white,
                  size: 14.r,
                ),
              ],
            ),
          ),
        ),
        actions: [
          _actionButton(() {}, Icons.history),
          _actionButton(() {}, Icons.notifications),
          _actionButton(() {}, Icons.add_circle_outlined),
          _actionButton(() {}, Icons.person)
        ],
        flexibleSpace: flexibleSpace);
  }

  Padding _actionButton(void Function()? onTap, IconData icon) {
    return Padding(
      padding: _constants.paddings.right12,
      child: Bounceable(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _constants.colors.black.withOpacity(0.25),
            ),
            margin: EdgeInsets.only(right: 2.w),
            padding: EdgeInsets.all(4.sp),
            child: Icon(icon, color: _constants.colors.white)),
      ),
    );
  }
}