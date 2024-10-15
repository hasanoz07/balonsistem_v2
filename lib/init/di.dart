import 'package:balonsistem/data/local/local_storage/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:balonsistem/shared/constants/dep.dart' as dep;

final class DependencyInjection {
  DependencyInjection._();

  static final DependencyInjection instance = DependencyInjection._();
  static late final Map<String, Map<String, String>> languages;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await LocalStorageService.instance.init();
    languages = await dep.init();
  }
}
