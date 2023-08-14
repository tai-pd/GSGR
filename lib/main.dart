import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gsgr/router.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/splash/splash_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'main_binding.dart';

//  import 'package:gsgr/service/push_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  Directory appDocDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocDir.path);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GSGR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kMainBackground,
        primarySwatch: Colors.blue,
        primaryColor: AppColors.kMainBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      initialBinding: MainBinding(),
      getPages: AppRouters.routers,
    );
  }
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // PushnotificationService
  // FirebaseNotification.showNotification(data['title'], data['body']);
}
