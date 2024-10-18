import 'package:balonsistem/modules/reservations/reservations_controller.dart';
import 'package:balonsistem/shared/widgets/custom_day_select.dart';
import 'package:flutter/material.dart';

class ReservationsFlexibleSpaceBar extends StatelessWidget {
  const ReservationsFlexibleSpaceBar({
    super.key,
    required this.controller,
  });

  final ReservationsController controller;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: controller.constants.paddings.horizontal12 +
            controller.constants.paddings.top16,
        child: Container(
          margin: controller.constants.paddings.top100,
          child: Column(
            children: [
              CustomDaySelectWidget(controller: controller.homeController),
            ],
          ),
        ),
      ),
    );
  }
}
