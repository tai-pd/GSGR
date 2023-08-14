import 'package:get/get.dart';

import 'controller/home_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
