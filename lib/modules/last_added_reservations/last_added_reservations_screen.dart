import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/last_added_reservations/last_added_reservations_controller.dart';
import 'package:balonsistem/shared/widgets/custom_reservation_card.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LastAddedReservationsScreen
    extends GetView<LastAddedReservationsController> {
  const LastAddedReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: TextSemiBold(
          text: 'Son Eklenen Rezervasyonlar',
          color: controller.constants.colors.black,
          fontsize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: controller.constants.paddings.horizontal12 +
              controller.constants.paddings.bottom16,
          child: Column(
              children: List.generate(
                  10,
                  (index) => CustomReservationCard(
                      color: controller.constants.colors.red))),
        ),
      ),
    );
  }
}
