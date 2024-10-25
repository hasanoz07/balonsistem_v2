import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  ConstantsInstances constants = ConstantsInstances.instance;
  RxInt selectedDayIndex = 2.obs;
  String date = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().add(const Duration(days: 1)));
  List<String> days = ["Dün", "Bugün", "Yarın", "Tarih Seç"];
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      date = DateFormat('yyyy-MM-dd').format(picked);
      selectedDayIndex.value = 3;
    }
  }

  List<double> myDataValues = [5, 6.5, 5, 7.5, 9, 11.5, 2]; // Can be any length
  List<String> myDataLabels = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S'
  ]; // Can be any length
}
