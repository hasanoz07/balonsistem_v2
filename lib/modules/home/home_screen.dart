import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/home/home_controller.dart';
import 'package:balonsistem/modules/home/widgets/home_chart.dart';
import 'package:balonsistem/modules/home/widgets/home_custom_slider.dart';
import 'package:balonsistem/modules/home/widgets/home_flexible_space_bar.dart';
import 'package:balonsistem/shared/widgets/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomSliverAppBar(
                height: 300.h,
                flexibleSpace: HomeFlexibleSpaceBar(controller: controller),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: controller.constants.paddings.top16,
              child: Container(
                color: controller.constants.colors.backgroundColor,
                child: Column(
                  children: [
                    HomeCustomSlider(controller: controller),
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: controller.constants.paddings.horizontal12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeChart(
                            dataValues: controller.myDataValues,
                            dataLabels: controller.myDataLabels,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
