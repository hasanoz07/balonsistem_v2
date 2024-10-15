import 'dart:convert';
import 'package:balonsistem/controllers/localization_controller.dart';
import 'package:balonsistem/data/local/local_storage/local_storage_service.dart';
import 'package:balonsistem/data/models/language/language_model.dart';
import 'package:balonsistem/shared/constants/langs.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  final LocalStorageService pref = LocalStorageService.instance;

  Get.lazyPut(() => pref);
  Get.lazyPut(
    () => LocalizationController(
      localStorage: Get.find<LocalStorageService>(),
    ),
  );

  // ignore: no_leading_underscores_for_local_identifiers
  Map<String, Map<String, String>> _languages = {};
  for (LanguageModel languageModel in AppLangs.languages) {
    String jsonStringValues = await rootBundle
        .loadString("assets/langs/${languageModel.languageCode}.json");
    // ignore: no_leading_underscores_for_local_identifiers
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    // ignore: no_leading_underscores_for_local_identifiers
    Map<String, String> _json = {};

    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });

    _languages["${languageModel.languageCode}_${languageModel.countryCode}"] =
        _json;
  }
  return _languages;
}
