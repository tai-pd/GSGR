import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/cart_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/product_model.dart';
import 'package:gsgr/repositories/order_repository.dart';
import 'package:gsgr/repositories/user_repository.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/view/order/widgets/widget_time_order.dart';

class OrderController extends GetxController {
  var currentLocation = null.obs;
  var address = ''.obs;
  var noteFrom = ''.obs;

  var sameAddress = true.obs;

  var addressTo = ''.obs;
  var noteTo = ''.obs;

  var chooseTime = 0.obs;
  var chooseEndTime = 0.obs;

  var idCoupon = ''.obs;
  var idCouponName = ''.obs;

  var isLoadding = false.obs;

  var orderStart =
      '${DateTime.now().year}-${converDateToString(DateTime.now().month)}-${converDateToString(DateTime.now().day)}'
          .obs;
  var orderEnd =
      '${DateTime.now().year}-${converDateToString(DateTime.now().month)}-${converDateToString(DateTime.now().day)}'
          .obs;

  var remark = ''.obs;

  // customer info
  var userId = ''.obs;
  var userName = ''.obs;
  var roleId = ''.obs;
  var checkCustomer = true.obs;
  var selectedUser = ''.obs;

  OrderRepository _orderRepository = OrderRepository();
  SessionManager _sessionManager = SessionManager();
  CartController _cartController = Get.find<CartController>();
  UserRepository _userRepository = UserRepository();

  @override
  void onInit() {
    super.onInit();
    getInfo();
    if (DateTime.now().hour > 17) {
      orderStart.value =
          '${DateTime.now().year}-${converDateToString(DateTime.now().month)}-${converDateToString(DateTime.now().add(Duration(days: 1)).day)}';
      orderEnd.value =
          '${DateTime.now().year}-${converDateToString(DateTime.now().month)}-${converDateToString(DateTime.now().add(Duration(days: 1)).day)}';
    }
  }

  Future<void> getUserByPhone(String phone) async {
    _userRepository.getUserbyPhone(phone).then((value) {
      if (value.data.customer.isNotEmpty) {
        userId.value = value.data.customer[0].id.toString();
        userName.value = value.data.customer[0].name;
      } else {
        userId.value = null;
        userName.value = null;
      }
    });
  }

  Future<void> updateOrder(
      {String staffID,
      String totalPrice,
      Map<String, String> listProduct}) async {
    _orderRepository
        .updateOrder(
            staffID: staffID, totalPrice: totalPrice, listProduct: listProduct)
        .then((value) => null);
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        address.value = '';
        return null;
      }

      Position locationPositon = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          locationPositon.latitude, locationPositon.longitude);
      Placemark placeMark = placemarks[0];
      String _address =
          '${placeMark.name} ${placeMark.subLocality}  ${placeMark.locality}  ${placeMark.country}  ';
      address.value = _address;
      return locationPositon;
    } else {
      Position locationPositon = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          locationPositon.latitude, locationPositon.longitude);
      Placemark placeMark = placemarks[0];
      String _address =
          '${placeMark.name} ${placeMark.subLocality}  ${placeMark.locality}  ${placeMark.country}  ';
      address.value = _address;
      return locationPositon;
    }
  }

  void changeSameAddress() {
    sameAddress.toggle();
  }

  void changeValueChooseTime(int postion) {
    if (postion != chooseTime.value) {
      chooseTime.value = postion;
    }
    if (postion == 0) {
      if (orderStart == orderEnd) {
        chooseEndTime.value = 2;
      }
    } else {
      if (orderStart == orderEnd) {
        orderEnd.value = Helper.converNextEndChoose(orderEnd.value);
      }
    }
  }

  void changeValueChooseEndTime(int postion) {
    if (postion != chooseEndTime.value) {
      chooseEndTime.value = postion;
    }
  }

  void orderProduct() async {
    Map<String, String> listProducts = getStringListProduct();
    if (address.value.isEmpty) {
      Helper.showDialog('Không thành công',
          'Đã xảy ra lỗi tạo đơn hàng, Thông tin địa chỉ không được bỏ trống.',
          onBack: () {});
    } else {
      isLoadding.value = true;
      if (orderEnd.value == orderStart.value &&
          chooseTime.value == chooseEndTime.value) {
        if (DateTime.now().hour > 17) {
          orderEnd.value =
              '${DateTime.now().year}-${converDateToString(DateTime.now().month)}-${converDateToString(DateTime.now().add(Duration(days: 2)).day)}';
        } else {
          orderEnd.value =
              '${DateTime.now().year}-${converDateToString(DateTime.now().month)}-${converDateToString(DateTime.now().add(Duration(days: 1)).day)}';
        }
      }
      await _orderRepository
          .orderProduct(
              customerID: userId.toString(),
              addressFrom: address.value,
              noteFrom: noteFrom.value,
              addressTo: sameAddress.value ? address.value : addressTo.value,
              noteTo: noteTo.value,
              orderStart: orderStart.value,
              rangerTimeStart: chooseTime.value.toString(),
              orderEnd: orderEnd.value,
              rangerTimeEnd: chooseEndTime.value.toString(),
              couponID: idCoupon.value,
              reMark: remark.value,
              listProduct: listProducts)
          .then((value) {
        isLoadding.value = false;
        if (value != null && value.status == 200) {
          Helper.showDialog(
              'Thành công', 'Đơn hàng của bạn đã được tạo thành công!',
              onBack: () {
            Get.back();
          });
          _cartController.listItem.clear();
          listProducts.clear();
          idCoupon.value = '';
          _cartController.countItemQuatity();
          noteFrom.value = '';
          noteTo.value = '';
          chooseTime.value = 0;
          chooseEndTime.value = 0;
          sameAddress.value = true;
        } else {
          Helper.showDialog('Không thành công',
              'Đã xảy ra lỗi tạo đơn hàng, vui lòng kiểm tra lại.',
              onBack: () {});
        }
      });
      isLoadding.value = false;
    }
  }

  Map<String, String> getStringListProduct() {
    Map<String, String> result = {};
    _cartController.listItem.forEach((element) {
      Map<String, String> item = {
        (element as Products).id.toString():
            '${(element as Products).quantity.toString()}'
      };
      result.addAll(item);
    });
    return result;
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getInfo() async {
    await _sessionManager
        .getInt(_sessionManager.userId)
        .then((value) => userId.value = value.toString());

    await _sessionManager
        .getString(_sessionManager.name)
        .then((value) => userName.value = value);

    await _sessionManager.getInt(_sessionManager.roleId).then((value) {
      roleId.value = value.toString();
      if (value != null) {
        bool chheck = roleId.compareTo('1') == 0 ? true : false;
        checkCustomer.value = chheck;
      } else {
        checkCustomer.value = true;
      }
    });
  }
}
