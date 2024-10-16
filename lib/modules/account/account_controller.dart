import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountController extends GetxController {
  ConstantsInstances constants = ConstantsInstances.instance;
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

  logout() {
    Get.offAllNamed(Routes.login);
  }
}
