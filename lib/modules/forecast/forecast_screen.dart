import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/forecast/forecast_controller.dart';
import 'package:balonsistem/modules/forecast/widgets/forecast_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForecastScreen extends GetView<ForecastController> {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: controller.constantsInstances.paddings.all32,
      child: BaseScaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 2.sw,
            child: ForecastChart(
              dataLabels: controller.myDataLabels,
              dataValues: controller.myDataValues,
            ),
          ),
        ),
      ),
    );
  }
}
