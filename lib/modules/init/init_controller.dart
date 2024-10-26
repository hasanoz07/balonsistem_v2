import 'package:balonsistem/data/local/local_storage/local_storage_service.dart';
import 'package:balonsistem/data/models/auth/resp/refresh_resp_model.dart';
import 'package:balonsistem/data/network/api/auth_api.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/enums/user_data_keys.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  final ConstantsInstances constants = ConstantsInstances.instance;
  final LocalStorageService _localStorage = LocalStorageService.instance;

  final AuthApi _authApi = AuthApi();

  late final RefreshRespModel _refreshRespModel;

  @override
  void onInit() async {
    super.onInit();
    if (_localStorage.retrieveData("accessToken") != null) {
      refreshToken();
    } else {
      await Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(Routes.login);
      });
    }
  }

  Future<void> refreshToken() async {
    try {
      final response =
          await _authApi.refresh(_localStorage.retrieveData("accessToken"));
      if (response.statusCode == 200) {
        _refreshRespModel = RefreshRespModel.fromJson(response.data);
        _localStorage.saveData(
            UserDataKeys.accessToken.name, _refreshRespModel.accessToken);
        _localStorage.saveData(
            UserDataKeys.userId.name, _refreshRespModel.user.id);
        _localStorage.saveData(
            UserDataKeys.roleName.name, _refreshRespModel.user.rolename);
        _localStorage.saveData(
            UserDataKeys.name.name, _refreshRespModel.user.name);
        _localStorage.saveData(UserDataKeys.profilePhoto.name,
            _refreshRespModel.user.profilePhotoUrl);
        _localStorage.saveData(
            UserDataKeys.compaines.name, _refreshRespModel.user.firmalar);
        Get.offAllNamed(Routes.navBar);
      } else {
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      Get.offAllNamed(Routes.login);
    }
  }
}
