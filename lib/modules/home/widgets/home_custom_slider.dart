import 'package:balonsistem/modules/home/home_controller.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCustomSlider extends StatelessWidget {
  const HomeCustomSlider({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          aspectRatio: 4,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlay: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          viewportFraction: 0.6),
      items: [
        _customSliderItem(),
      ],
    );
  }

  Container _customSliderItem() {
    return Container(
      padding: controller.constants.paddings.all12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextSemiBold(
            text: "ABC MEDYA",
            fontsize: 16.sp,
            color: controller.constants.colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextExtraBold(
                text: "25 Pax",
                color: controller.constants.colors.black,
                fontsize: 20.sp,
              ),
              TextBold(
                text: "270 TL",
                color: controller.constants.colors.greenbuttoncolor,
                fontsize: 16.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
