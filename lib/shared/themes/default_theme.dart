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
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.instance.black,
        centerTitle: true
        // titleTextStyle: AppTextStyle.textSemibold
        //     .copyWith(color: AppColors.textBlack100)
        ),

    //! İnput Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 10.w),
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
