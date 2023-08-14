import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/controller/new_controller.dart';
// import 'package:get/get.dart';
// import 'package:gsgr/controller/new_controller.dart';

import 'widget/body.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(NewController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    homeController.reloadListCoupon();
    return Body();
  }
}
