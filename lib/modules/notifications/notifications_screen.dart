import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("NotificationsScreen"),
      ),
    );
  }
}
