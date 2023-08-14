import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/spash_controller.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
  static final route = GetPage(name: routeName, page: () => SplashScreen());

  final ctl = Get.put(Splashcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/ic_logo_splash.png'),
        ]),
      ),
    );
  }
}
