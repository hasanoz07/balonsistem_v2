import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/reservations/reservations_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationsScreen extends GetView<ReservationsController> {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        child: const Center(
          child: Text('Reservations Screen'),
        ),
      ),
    );
  }
}
