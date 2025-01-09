import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 1.obs;
  DateTime? lastBackPressTime;

  @override
  void onInit() {
    super.onInit();
    requestNotificationPermission();
  }

  void setIndex(int index) {
    selectedIndex.value = index;
    setStatusBarColor();
  }

  void setStatusBarColor() {
    final context = Get.context!;
    final statusBarColor = Theme.of(context).primaryColor;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      var result = await Permission.notification.request();
      if (result.isPermanentlyDenied) {
        await openAppSettings();
      }
    }
  }
}