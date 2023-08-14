import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gsgr/controller/new_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:get/get.dart';
import 'package:gsgr/view/bottomSheets/BottomSheetNews.dart';

class NotificationHandler {
  static final flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  static BuildContext context;
  static void initNotification() {
    var initAndroid = AndroidInitializationSettings('ic_push');
    var initIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initSetting =
        InitializationSettings(android: initAndroid, iOS: initIOS);
    flutterLocalNotificationPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification);
  }

  static Future onSelectNotification(String payload) async {
    if (payload != null) {
      final newsCtl = Get.put(NewController());
      await newsCtl.loadNews();
      Get.bottomSheet(
        BottomSheetNews(
          newsId: int.parse(payload),
        ),
        enableDrag: true,
        isScrollControlled: true,
      );
    }
  }

  static Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    Helper.showDialog(title, body);
  }
}
