import 'package:balonsistem/data/local/local_storage/local_storage_service.dart';
import 'package:balonsistem/data/models/auth/req/login_req_model.dart';
import 'package:balonsistem/data/models/auth/resp/login_resp_model.dart';
import 'package:balonsistem/data/models/auth/resp/refresh_resp_model.dart';
import 'package:balonsistem/data/network/api/auth_api.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/enums/user_data_keys.dart';
import 'package:balonsistem/shared/helpers/loading_helpers.dart';
import 'package:balonsistem/shared/helpers/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  ConstantsInstances constants = ConstantsInstances.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final LocalStorageService _localStorage = LocalStorageService.instance;

  final AuthApi _authApi = AuthApi();

  late final LoginRespModel _loginRespModel;

  late final RefreshRespModel _refreshRespModel;

  Future<void> login() async {
    LoginReqModel loginReqModel = LoginReqModel(
      email: emailController.text,
      password: passwordController.text,
    );
    if (loginReqModel.email.isEmpty || loginReqModel.password.isEmpty) {
      SnackbarHelpers.showInfoSnackbar(
          "Uyarı", "Lütfen E-posta ve Şifre Giriniz");
      return;
    }
    try {
      LoadingHelpers.showLoadingDialog();
      final response = await _authApi.login(loginReqModel);
      if (response.statusCode == 200) {
        _loginRespModel = LoginRespModel.fromJson(response.data);
        _localStorage.saveData(
            UserDataKeys.accessToken.name, _loginRespModel.accessToken);
        _localStorage.saveData(
            UserDataKeys.userId.name, _loginRespModel.user.id);
        _localStorage.saveData(
            UserDataKeys.name.name, _loginRespModel.user.name);
        _localStorage.saveData(
            UserDataKeys.roleName.name, _loginRespModel.user.rolename);
        _localStorage.saveData(UserDataKeys.profilePhoto.name,
            _loginRespModel.user.profilePhotoUrl);
        _localStorage.saveData(
            UserDataKeys.compaines.name, _loginRespModel.user.firmalar);
        await refreshToken();
        LoadingHelpers.hideLoadingDialog();
      } else {
        LoadingHelpers.hideLoadingDialog();
        SnackbarHelpers.showErrorSnackbar(
            "Hata", "Bir hata oluştu lütfen daha sonra yeniden deneyiniz");
      }
    } catch (e) {
      LoadingHelpers.hideLoadingDialog();
      SnackbarHelpers.showErrorSnackbar(
          "Hata", "Lütfen e-posta ve şifrenizi kontrol ediniz");
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
        SnackbarHelpers.showErrorSnackbar(
            "Hata", "Bir hata oluştu lütfen daha sonra yeniden deneyiniz");
      }
    } catch (e) {
      SnackbarHelpers.showErrorSnackbar(
          "Hata", "Bir hata oluştu lütfen daha sonra yeniden deneyiniz");
    }
  }
}
