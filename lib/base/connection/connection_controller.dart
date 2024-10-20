import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  final Rx<MConnectivityResult> _connectionType = MConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  MConnectivityResult get connectionType => _connectionType.value;

  set connectionType(value) {
    _connectionType.value = value;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    late List<ConnectivityResult> connectivityResults;
    try {
      connectivityResults = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return;
    }
    _updateState(connectivityResults);
  }

  void _updateState(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi)) {
      connectionType = MConnectivityResult.wifi;
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    } else if (results.contains(ConnectivityResult.mobile)) {
      connectionType = MConnectivityResult.mobile;
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    } else if (results.contains(ConnectivityResult.none) || results.isEmpty) {
      connectionType = MConnectivityResult.none;
      Get.dialog(
        AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text('Please check your internet connection'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      connectionType = MConnectivityResult.none;
      if (kDebugMode) {
        print('Failed to get connection type');
      }
    }
    update();
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }

  Future<void> checkInternetConnection() async {
    await getConnectivityType();
    if (connectionType == MConnectivityResult.none) {
      if (kDebugMode) {
        print("No internet connection");
      }
    }
  }
}

enum MConnectivityResult { none, wifi, mobile }
