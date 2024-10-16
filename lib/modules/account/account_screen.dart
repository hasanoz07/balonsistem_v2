import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/account/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        child: const Center(
          child: Text('Account Screen'),
        ),
      ),
    );
  }
}
