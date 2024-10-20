import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/helpers/loading_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReservationAddUpdateController extends GetxController {
  ConstantsInstances constants = ConstantsInstances.instance;
  //!Status List
  String statusCode = "2";
  List<DropdownMenuItem<String>> statusList = [
    const DropdownMenuItem(value: "2", child: Text("Beklemede")),
    const DropdownMenuItem(value: "1", child: Text("Konfirme")),
  ];
  //!CompanyList
  String companyCode = "1";
  List<DropdownMenuItem<String>> companyList = [
    const DropdownMenuItem(value: "1", child: Text("Balon Sistem")),
    const DropdownMenuItem(value: "2", child: Text("Balon Sistem 2")),
  ];
  //!Date
  TextEditingController dateController = TextEditingController();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      print('Seçilen tarih: $picked');
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dateController.text = formattedDate;
      print(dateController.text);
    }
  }

  //!Pax
  final currentValuePax = 1.obs;
  //!PP Price
  TextEditingController ppPriceController = TextEditingController();
  RxString priceCurrenyCode = "EUR".obs;
  List<DropdownMenuItem<String>> priceCurrenyList = [
    const DropdownMenuItem(value: "TRY", child: Text("TRY")),
    const DropdownMenuItem(value: "USD", child: Text("USD")),
    const DropdownMenuItem(value: "EUR", child: Text("EUR")),
  ];
  //!Buying Locaiton
  String buyingLocationCode = "1";
  List<DropdownMenuItem<String>> buyingLocationList = [
    const DropdownMenuItem(value: "1", child: Text("Balon Sistem")),
    const DropdownMenuItem(value: "2", child: Text("Balon Sistem 2")),
  ];
  //!Room Number
  TextEditingController roomNumberController = TextEditingController();
  //!Description
  TextEditingController descriptionController = TextEditingController();
  Future<void> addReservation() async {
    LoadingHelpers.showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    LoadingHelpers.hideLoadingDialog();
    Get.back();
  }
}
