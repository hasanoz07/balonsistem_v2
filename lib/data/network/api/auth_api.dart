import 'package:balonsistem/data/models/auth/req/login_req_model.dart';
import 'package:balonsistem/data/network/service/api_service.dart';
import 'package:balonsistem/shared/constants/app_url.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final ApiService _apiService = ApiService();
  final AppUrl _appUrl = AppUrl.instance;

  //*E-Posta ile girişi sağlar
  Future<Response> login(LoginReqModel loginReqModel) async {
    try {
      final Response response = await _apiService.post(
        _appUrl.login,
        data: loginReqModel.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> refresh(
    String token,
  ) async {
    try {
      final Response response = await _apiService.post(_appUrl.refresh,
          options: Options(headers: {
            'Authorization': "Bearer $token",
            "Content-Type": "application/json"
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
