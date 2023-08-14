import 'package:get/get.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/view/suggest/suggest_screen.dart';

class SuggestController extends GetxController {
  var listPlace = [].obs;
  var district = 'Hải Châu'.obs;
  var ward = 'Hải Châu 1'.obs;
  var street = ''.obs;

  OrderController orderController = Get.find<OrderController>();

  saveOrderAddress(TYPEINPUT type) {
    String address = '$street - $ward - $district - Đà nẵng';
    switch (type) {
      case TYPEINPUT.form:
        orderController.address.value = address;
        break;
      case TYPEINPUT.to:
        orderController.addressTo.value = address;
        break;

      default:
    }
    Get.back();
  }
}
