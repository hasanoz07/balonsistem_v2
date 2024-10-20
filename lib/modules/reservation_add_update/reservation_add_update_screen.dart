import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/reservation_add_update/reservation_add_update_controller.dart';
import 'package:balonsistem/shared/constants/fonts.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:get/get.dart';

class ReservationAddUpdateScreen
    extends GetView<ReservationAddUpdateController> {
  const ReservationAddUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          title: TextSemiBold(
            text: 'Rezervasyon Ekle',
            color: controller.constants.colors.black,
            fontsize: 18.sp,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: controller.constants.paddings.horizontal12 +
                controller.constants.paddings.bottom16 +
                controller.constants.paddings.top16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fieldTitle("Durumu"),
                _customDropdown(controller.statusCode, controller.statusList),
                _fieldTitle("Firma"),
                _customDropdown(controller.companyCode, controller.companyList),
                _fieldTitle("Tarih"),
                _customDatePicker(context),
                _fieldTitle("Pax"),
                _customPaxPicker(),
                _fieldTitle("PP Fiyat"),
                _ppPricePicker(context),
                _fieldTitle("Alış Yeri Seçiniz"),
                _customDropdown(controller.buyingLocationCode,
                    controller.buyingLocationList),
                _fieldTitle("Grup Kodu/Oda No"),
                _customTextField(
                    context: context,
                    textEditingController: controller.roomNumberController,
                    hintText: "Grup Kodu veya Oda No"),
                _fieldTitle("Açıklama"),
                _customTextField(
                    context: context,
                    textEditingController: controller.descriptionController,
                    hintText: "Grup Kodu veya Oda No",
                    maxLines: 6),
                SizedBox(
                  width: 1.sw,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addReservation();
                    },
                    child: Text(
                      controller.constants.strings.login.tr,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _customTextField({
    required BuildContext context,
    required TextEditingController textEditingController,
    required String hintText,
    int maxLines = 1,
  }) {
    return Padding(
      padding: controller.constants.paddings.top8 +
          controller.constants.paddings.bottom16,
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: textEditingController,
        maxLines: maxLines,
        style: TextStyle(
            fontFamily: AppFonts.LIGHT.value,
            fontSize: 14.sp,
            color: controller.constants.colors.black),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }

  Widget _ppPricePicker(BuildContext context) {
    return Padding(
      padding: controller.constants.paddings.top8 +
          controller.constants.paddings.bottom16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: AppFonts.LIGHT.value,
                  fontSize: 14.sp,
                  color: controller.constants.colors.black),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              controller: controller.ppPriceController,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: DropdownButtonFormField(
                style: TextStyle(
                    fontFamily: AppFonts.LIGHT.value,
                    fontSize: 14.sp,
                    color: controller.constants.colors.black),
                value: controller.priceCurrenyCode.value,
                items: controller.priceCurrenyList,
                onChanged: (value) {
                  value = value;
                }),
          )
        ],
      ),
    );
  }

  Widget _customPaxPicker() {
    return Padding(
      padding: controller.constants.paddings.top8 +
          controller.constants.paddings.bottom16,
      child: Obx(
        () => Center(
          child: SizedBox(
            width: 0.75.sw,
            child: NumberPicker(
                selectedTextStyle: TextStyle(
                    color: controller.constants.colors.primary,
                    fontSize: 26.sp,
                    fontFamily: AppFonts.SEMI_BOLD.value),
                axis: Axis.horizontal,
                value: controller.currentValuePax.value,
                minValue: 1,
                textStyle: TextStyle(
                    color: controller.constants.colors.black,
                    fontSize: 18.sp,
                    fontFamily: AppFonts.LIGHT.value),
                maxValue: 100,
                onChanged: (value) {
                  controller.currentValuePax.value = value;
                }),
          ),
        ),
      ),
    );
  }

  Widget _customDatePicker(BuildContext context) {
    return Padding(
      padding: controller.constants.paddings.top8 +
          controller.constants.paddings.bottom16,
      child: Bounceable(
        onTap: () {
          controller.selectDate(context);
        },
        child: TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: controller.dateController,
          enabled: false,
          style: TextStyle(
              fontFamily: AppFonts.LIGHT.value,
              fontSize: 14.sp,
              color: controller.constants.colors.black),
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            hintText: "Tarih Seçiniz",
            hintStyle: TextStyle(
                fontFamily: AppFonts.LIGHT.value,
                fontSize: 14.sp,
                color: controller.constants.colors.black),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.constants.colors.primary, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.constants.colors.primary, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.constants.colors.primary, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.constants.colors.primary, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customDropdown(
    String? value,
    List<DropdownMenuItem<String>>? items,
  ) {
    return Padding(
      padding: controller.constants.paddings.top8 +
          controller.constants.paddings.bottom16,
      child: DropdownButtonFormField(
          style: TextStyle(
              fontFamily: AppFonts.LIGHT.value,
              fontSize: 14.sp,
              color: controller.constants.colors.black),
          value: value,
          items: items,
          onChanged: (value) {
            value = value;
          }),
    );
  }

  Widget _fieldTitle(String title) {
    return TextBold(
        text: title,
        fontsize: 16.sp,
        color: controller.constants.colors.appbartexticon);
  }
}
