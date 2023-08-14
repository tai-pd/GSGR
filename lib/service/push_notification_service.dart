import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gsgr/value/session_manager.dart';
import 'notification_handler.dart';

class FirebaseNotification {
  FirebaseMessaging _fcm;
  SessionManager _sessionManager = SessionManager();
  void setupFirebase() {
    _fcm = FirebaseMessaging.instance;
    NotificationHandler.initNotification();
    firebareCloudMessageListener();
  }

  void firebareCloudMessageListener() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //gettoken

    _fcm.getToken().then((value) {
      _sessionManager.setToken(value);
      print('my TOKEN : $value');
    });

    _fcm
        .subscribeToTopic("gaitsaygiare")
        .whenComplete(() => print('Subrice ok'));

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      print('FirebaseMessaging.onMessage. ');
      showNotificationWithDefaultSound(remoteMessage);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('on');
    });

    // _fcm.subscribeToTopic('gaitsaygiare').whenComplete(() => print('subr ok'));

    // FirebaseMessaging.onMessage.listen((event) {
    //   print('receiver $event');
    //   if (Platform.isAndroid)
    //     showNotificationWithDefaultSound(event.data['title'], event.data['body']);
    //   else if (Platform.isIOS)
    //     showNotificationWithDefaultSound(event.notification.title, event.notification.body);
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   print('open app $event');
    //   if (Platform.isIOS) {
    //     Helper.showDialog('title', '${event.messageId}');
    //   }
    // });
  }

  Future showNotificationWithDefaultSound(RemoteMessage message) async {
    print('push to 3');
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'kccs_channe_001', 'kccs_channe_001', 'KCCS',
        importance: Importance.max, priority: Priority.high);

    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    NotificationHandler.flutterLocalNotificationPlugin.show(
      0,
      '${message?.notification?.title ?? ''}',
      '${message?.notification?.body ?? ''}',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  // static void showNotification(title, body) async {
  //   var androidChanncel = AndroidNotificationDetails(
  //     'com.example.gsgr',
  //     'channelName',
  //     'channelDescription',
  //     autoCancel: false,
  //     ongoing: true,
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   var ios = IOSNotificationDetails();
  //   var platForm = NotificationDetails(android: androidChanncel, iOS: ios);
  //   await NotificationHandler.flutterLocalNotificationPlugin
  //       .show(0, title, body, platForm, payload: 'my payload');
  // }
}
