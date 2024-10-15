import 'package:balonsistem/shared/constants/colors.dart';
import 'package:balonsistem/shared/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  CustomTheme._();

  static final CustomTheme instance = CustomTheme._();

  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.instance.backgroundColor,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.instance.black,
      elevation: 8,
      color: Colors.transparent,
      // titleTextStyle: AppTextStyle.textSemibold
      //     .copyWith(color: AppColors.textBlack100)
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.5.w),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.instance.primary, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.instance.primary, width: 1.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.instance.primary, width: 1.0),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.instance.primary,
      todayBorder: BorderSide(color: AppColors.instance.primary),
      todayBackgroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.instance.primary
              : AppColors.instance.white),
      dayBackgroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.instance.primary
              : AppColors.instance.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.instance.black.withOpacity(0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp)),
          textStyle: TextStyle(
            fontFamily: AppFonts.SEMI_BOLD.value,
            fontSize: 12.sp,
          ),
          backgroundColor: AppColors.instance.black),
    ),
  );
}
