import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/init/init_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitScreen extends GetView<InitController> {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        decoration: BoxDecoration(color: controller.constants.colors.primary),
      ),
    );
  }
}
