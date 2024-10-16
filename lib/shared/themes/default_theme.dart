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

    //!App Bar Theme
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.instance.black,
      elevation: 8,
      color: Colors.transparent,
      // titleTextStyle: AppTextStyle.textSemibold
      //     .copyWith(color: AppColors.textBlack100)
    ),

    //! İnput Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.instance.grey,
      focusColor: AppColors.instance.primary,
      contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.5.w),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.instance.primary, width: 1.5.w),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 1.0),
      ),
    ),

    //!Date Picker Theme
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

    //!Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.instance.white,
          textStyle: TextStyle(
            fontFamily: AppFonts.BOLD.value,
            fontSize: 16.sp,
          ),
          disabledBackgroundColor: AppColors.instance.black.withOpacity(0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          backgroundColor: AppColors.instance.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.instance.primary,
      unselectedItemColor: AppColors.instance.black,
      selectedLabelStyle: TextStyle(
        fontFamily: AppFonts.SEMI_BOLD.value,
        fontSize: 12.sp,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: AppFonts.LIGHT.value,
        fontSize: 10.sp,
      ),
    ),
  );
}
