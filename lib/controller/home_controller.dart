import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/helper/dialog.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/repositories/home_repository.dart';
import 'package:gsgr/repositories/login_repository.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  static HomeController to = Get.find();
  var listCoupon = [].obs;
  var listNews = [].obs;
  var phone = ''.obs;
  var name = ''.obs;
  var point = 0.0.obs;
  TabController tabController;
  SessionManager _sessionManager = SessionManager();
  HomeRepository _repository = HomeRepository();
  LoginRepository _loginRepository = LoginRepository();
  QRViewController controllerQRCode;
  bool isCheckQR = false;

  @override
  void onReady() {
    super.onReady();
    reloadListCoupon();
  }

  reloadListCoupon() async {
    await _sessionManager.getString(_sessionManager.phone).then((value) {
      phone.value = value;
    });

    try {
      _repository.getListCoupon().then((value) {
        if (value.status == 200) {
          listCoupon.clear();
          if (value.data.coupons.length > 0) {
            value.data.coupons.forEach((element) {
              if (Helper.checkTimeExpried(element.endDate)) {
                listCoupon.add(element);
              }
            });
          }
        }
      });
    } on Exception {}

    try {
      _sessionManager.getString(_sessionManager.phone).then((value) {
        if (phone.value != '') {
          phone.value = value;
          _loginRepository.login(phone.value).then((value) {
            if (value != null) {
              if (value.status == 200) {
                point.value = value.data.customer.point;
              }
            }
          });
        }
      });
    } on Exception {}

    await _sessionManager
        .getString(_sessionManager.name)
        .then((value) => name.value = value);
    try {
      await _sessionManager
          .getDouble(_sessionManager.point)
          .then((value) => point.value = double.parse('$value'));
    } on Exception {}
  }

  onQRViewCreated(QRViewController controller) async {
    this.controllerQRCode = controller;
    controller.scannedDataStream.first.then((value) async {
      Get.back();
      print(value.code.toString());
      if (value.code != '') {
        await addCoupon(value.code);
      }
    });

    // controller.scannedDataStream.listen((scanData) async {
    //   if (!isCheckQR) {
    //     print('------------' + scanData.code);
    //     isCheckQR = true;
    //     await addCoupon(scanData.code);
    //   } else {
    //     return;
    //   }
    //   // Get.back();
    // }, onDone: () {
    //   controllerQRCode.dispose();
    //   print('------------ DONE');
    // });
  }

  setTapController() {
    refreshCoupon();
    tabController.index = 1;
    tabController.animateTo(1);
  }

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    await FirebaseMessaging.instance
        .getToken()
        .then((value) => _sessionManager.setToken(value));
    final userPhone = _sessionManager.getString(_sessionManager.phone);
    await _loginRepository.login(userPhone.toString());
  }

  Future refreshCoupon() async {
    listCoupon.clear();
    _repository.getListCoupon().then((value) {
      if (value.status == 200) {
        // listCoupon.addAll(value.data.coupons);
        if (value.data.coupons.length > 0) {
          value.data.coupons.forEach((element) {
            if (Helper.checkTimeExpried(element.endDate)) {
              listCoupon.add(element);
            }
          });
        }
      }
    });
  }

  Future addCoupon(String couponCode) async {
    await _repository.addCouponForUser(couponCode).then((value) {
      isCheckQR = false;
      if (value.status == 422) {
        DialogHelper.dialogWarning(
            title: 'Quét mã',
            content: '${value.data}',
            fnc: () => {Get.back()});
      } else {
        DialogHelper.dialogWarning(
            title: 'Thêm Coupon',
            content: 'Bạn đã thêm voucher thành công!',
            fnc: () => {Get.back()});
      }
    }).then((value) {
      refreshCoupon();
    });
  }
}
