import 'package:balonsistem/controllers/localization_controller.dart';
import 'package:balonsistem/data/models/language/language_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/langs.dart';

class CustomLanguageButton extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  final Widget widget;
  const CustomLanguageButton(
      {super.key,
      required this.languageModel,
      required this.widget,
      required this.localizationController,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        localizationController.setLanguage(
          Locale(
            AppLangs.languages[index].languageCode,
            AppLangs.languages[index].countryCode,
          ),
        );
        localizationController.setSelectedIndex(index);
      },
      child: Container(
        margin: EdgeInsets.all(
          3.r,
        ),
        decoration: const BoxDecoration(),
        child: Stack(
          children: [Center(child: widget)],
        ),
      ),
    );
  }
}
