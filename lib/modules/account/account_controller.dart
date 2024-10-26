import 'package:balonsistem/data/local/local_storage/local_storage_service.dart';
import 'package:balonsistem/data/network/api/auth_api.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/enums/user_data_keys.dart';
import 'package:balonsistem/shared/helpers/loading_helpers.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountController extends GetxController {
  final ConstantsInstances constants = ConstantsInstances.instance;
  final LocalStorageService _localStorageService = LocalStorageService.instance;
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
        _localStorageService.retrieveData(
          UserDataKeys.accessToken.name,
        ),
      );
    } catch (e) {
      throw Exception('Could not log out');
    } finally {
      LoadingHelpers.hideLoadingDialog();
      _localStorageService.clearAllData();
      Get.offAllNamed(Routes.login);
    }
  }
}
