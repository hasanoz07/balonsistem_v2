import 'dart:math';

import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:get/get.dart';

class ForecastController extends GetxController {
  ConstantsInstances constantsInstances = ConstantsInstances.instance;
  // Generate dataValues based on a sine wave pattern
  List<double> myDataValues =
      List.generate(30, (index) => sin(index / 2) * 5 + 10);

// Generate dataLabels as dates
  List<String> myDataLabels = List.generate(30, (index) {
    DateTime date = DateTime.now().add(Duration(days: index));
    return '${date.day}/${date.month}';
  });
}
