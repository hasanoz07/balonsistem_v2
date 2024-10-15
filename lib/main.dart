import 'package:balonsistem/base/connection/connection_binding.dart';
import 'package:balonsistem/controllers/localization_controller.dart';
import 'package:balonsistem/init/di.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/app_translations.dart';
import 'package:balonsistem/shared/constants/langs.dart';
import 'package:balonsistem/shared/constants/strings.dart';
import 'package:balonsistem/shared/themes/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await DependencyInjection.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => (ScreenUtilInit(
        designSize: Size(constraints.maxWidth, constraints.maxHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return GetBuilder<LocalizationController>(
            builder: (localizationController) {
              return GetMaterialApp(
                title: AppStrings.instance.appName,
                translations: AppTranslations(
                  languages: DependencyInjection.languages,
                ),
                fallbackLocale: Locale(
                  AppLangs.languages.first.languageCode,
                  AppLangs.languages.first.countryCode,
                ),
                locale: localizationController.locale,
                debugShowCheckedModeBanner: false,
                theme: CustomTheme.instance.lightTheme,
                initialRoute: AppPages.instance.initial,
                getPages: AppPages.instance.routes,
                initialBinding: ConnectionBinding(),
              );
            },
          );
        },
      )),
    );
  }
}
