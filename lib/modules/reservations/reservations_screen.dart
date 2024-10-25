import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/reservations/reservations_controller.dart';
import 'package:balonsistem/modules/reservations/widgets/reservations_flexible_space_bar.dart';
import 'package:balonsistem/shared/widgets/custom_reservation_card.dart';
import 'package:balonsistem/shared/widgets/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReservationsScreen extends GetView<ReservationsController> {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomSliverAppBar(
              height: 130.h,
              flexibleSpace:
                  ReservationsFlexibleSpaceBar(controller: controller),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: controller.constants.paddings.horizontal12,
            child: Container(
              color: controller.constants.colors.backgroundColor,
              child: Column(
                  children: List.generate(
                10,
                (index) => CustomReservationCard(
                    color: controller.constants.colors.red),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
