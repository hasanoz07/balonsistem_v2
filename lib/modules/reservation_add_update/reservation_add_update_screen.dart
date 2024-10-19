import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/reservation_add_update/reservation_add_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationAddUpdateScreen
    extends GetView<ReservationAddUpdateController> {
  const ReservationAddUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("ReservationAddUpdateScreen"),
      ),
    );
  }
}
