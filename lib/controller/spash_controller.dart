import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:gsgr/service/push_notification_service.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/view/Base/main_screen.dart';
import 'package:gsgr/view/auth/login_screen.dart';
import 'package:notification_permissions/notification_permissions.dart';

class Splashcontroller extends GetxController {
  static const String id = 'app_notification';
  FirebaseMessaging messaging;
  NotificationSettings settings;
  SessionManager _sessionManager = SessionManager();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  FirebaseNotification firebaseNotification = FirebaseNotification();
  String token;

  static const applicationLifecycleChannel =
      BasicMessageChannel<String>('applicationLifeCycle', StringCodec());
  static const kApplicationWillTerminate = 'applicationWillTerminate';
  static const kApplicationWillEnterForeground =
      'applicationWillEnterForeground';
  static const kApplicationDidEnterBackground = 'applicationDidEnterBackground';

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() async {
    await requestPermision();
    applicationLifecycleChannel.setMessageHandler((message) async {
      switch (message) {
        case kApplicationWillTerminate:
          print('from  kApplicationWillTerminate');
          break;
        case kApplicationWillEnterForeground:
          print('from  kApplicationWillEnterForeground');
          checkApplicationWillEnterForeground();

          break;
        case kApplicationDidEnterBackground:
          print('from  kApplicationDidEnterBackground');
          // _viewModel.applicationMoveToBackground();
          break;
        default:
          break;
      }
      return message;
    });

    checkPushnotification();
    super.onInit();
  }

  Future checkApplicationWillEnterForeground() async {}

  checkPushnotification() async {
    if (Platform.isAndroid) {
      Future<PermissionStatus> permissionStatus =
          NotificationPermissions.getNotificationPermissionStatus();
      bool granted = await permissionStatus.then((value) {
        if (value == PermissionStatus.denied) {
          return false;
        } else {
          return true;
        }
      });
      if (granted) {
        firebaseNotification.setupFirebase();
      }
      gotologin();
      //else {
      //   showPushAlert();
      // }
    } else {
      messaging = FirebaseMessaging.instance;
      messaging
          .subscribeToTopic('all')
          .whenComplete(() => print('subcribe to to topic'));

      bool granted = await requestDeviceToken();
      if (granted ?? false) {
        token = await messaging?.getToken();
        print('=== TOKEN === $token');
        flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          if (message.notification != null) {
            print('push to ');
            _showNotificationWithDefaultSound(message);
          }
        });

        // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        //   print('A new onMessageOpenedApp event was published!');
        // });

        // _sessionManager.setString(_sessionManager.token, token ?? '');
        settings = await messaging?.getNotificationSettings();

        _sessionManager.setToken(token);

        gotologin();
      } else {
        gotologin();
      }
    }
  }

  void gotologin() {
    Future.delayed(Duration(seconds: 2), () {
      _sessionManager.isLogin().then((value) {
        if (value ?? false) {
          Get.offNamed(MainScreen.routeName);
        } else {
          Get.offNamed(LoginSreen.routeName);
        }
      });

      // _sessionManager.getString(_manager.token).then((value) {
      //   if (value?.isEmpty ?? true) {
      //     Get.offNamed(LoginSreen.routeName);
      //   } else {
      //     Get.offNamed(MainScreen.routeName);
      //   }
      // });
    });
  }

  requestPermision() async {
    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // gotologin();
      checkPushnotification();
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
      checkPushnotification();
    } else {
      checkPushnotification();
      print('User declined or has not accepted permission');
    }
  }

  Future<bool> requestDeviceToken() async {
    if (Platform.isAndroid) {
      Future<PermissionStatus> permissionStatus =
          NotificationPermissions.getNotificationPermissionStatus();
      await permissionStatus.then((value) {
        if (value == PermissionStatus.denied) {
          return false;
        } else {
          return true;
        }
      });
    } else {
      settings = await messaging?.getNotificationSettings();

      if (settings?.authorizationStatus == AuthorizationStatus.authorized) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future _showNotificationWithDefaultSound(RemoteMessage message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'kccs_channe_001', 'KCCSCHANEL', 'KCCS',
        importance: Importance.max, priority: Priority.high);

    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    print('push to 1');
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin.show(
        0,
        '${message.notification?.title ?? ' '}',
        '${message.notification?.body ?? ' '}',
        platformChannelSpecifics,
        payload: 'Default_Sound',
      );
    } else {
      await flutterLocalNotificationsPlugin.show(
        0,
        '${message.notification?.title ?? ''}',
        '${message.notification?.body ?? ''}',
        platformChannelSpecifics,
        payload: 'Default_Sound',
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
