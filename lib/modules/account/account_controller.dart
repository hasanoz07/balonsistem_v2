import 'dart:convert';

import 'package:balonsistem/data/local/local_storage/local_storage_service.dart';
import 'package:balonsistem/data/network/api/auth_api.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/enums/user_data_keys.dart';
import 'package:balonsistem/shared/helpers/loading_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(
        "Hasan ${localStorageService.retrieveData(UserDataKeys.profilePhoto.name)}");
  }

  final ConstantsInstances constants = ConstantsInstances.instance;
  final LocalStorageService localStorageService = LocalStorageService.instance;
  final AuthApi _authApi = AuthApi();

  final Uri telifHakki = Uri.parse('https://balonsistem.com/telifhakki');
  final Uri kullanimKosullari =
      Uri.parse('https://balonsistem.com/kullanim-kosullari');
  final Uri gizlilikPolitikasi = Uri.parse("https://balonsistem.com/gizlilik");
  final Uri kisiselVeriler =
      Uri.parse("https://balonsistem.com/kisisel-veriler");
  final Uri cerezPolitikasi =
      Uri.parse("https://balonsistem.com/cerez-politikalari");

  Future<void> goToWebSite(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  RxBool notificationStatus = true.obs;

  Future<void> logOut() async {
    try {
      LoadingHelpers.showLoadingDialog();
      await _authApi.logout(
        localStorageService.retrieveData(
          UserDataKeys.accessToken.name,
        ),
      );
    } catch (e) {
      throw Exception('Could not log out');
    } finally {
      LoadingHelpers.hideLoadingDialog();
      localStorageService.clearAllData();
      Get.offAllNamed(Routes.login);
    }
  }

  Future<Image> fetchImage() async {
    final response = await http.get(Uri.parse(
        "https://ui-avatars.com/api/?name=E+U&color=7F9CF5&background=EBF4FF"));
    if (response.statusCode == 200) {
      return Image.memory(base64Decode(base64Encode(response.bodyBytes)));
    } else {
      throw Exception("Failed to load image");
    }
  }
}
