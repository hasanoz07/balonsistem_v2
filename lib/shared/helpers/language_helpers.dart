import 'package:balonsistem/data/local/local_storage/local_storage_service.dart';
import 'package:balonsistem/shared/enums/local_storage_keys.dart';

final class LanguageHelpers {
  LanguageHelpers._();

  static final LanguageHelpers instance = LanguageHelpers._();

  static final LocalStorageService _localStorageService =
      LocalStorageService.instance;

  static String _getCurrentLanguageCode() {
    return _localStorageService.retrieveData(
          LocalStorageKeys.languageCode.name,
        ) ??
        "en";
  }

  static String _getCurrentCountryCode() {
    return _localStorageService.retrieveData(
          LocalStorageKeys.countryCode.name,
        ) ??
        "US";
  }

  String get currentLanguageCode => _getCurrentLanguageCode();
  String get currentCountryCode => _getCurrentCountryCode();

  String convertedCurrentLang({
    required final Map<String, dynamic> texts,
  }) {
    final String currentLanguage = _getCurrentLanguageCode();
    return texts[currentLanguage] ?? "";
  }
}
