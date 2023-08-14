import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';
import 'package:intl/intl.dart';

class Helper {
  Helper._();

  static String getOSCurrent() {
    String os = '1';
    if (Platform.isIOS) {
      os = '1';
    } else {
      os = '2';
    }
    return os;
  }

  static showDialog(String title, String content, {Function onBack}) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        content: Container(
            child: Column(
          children: [
            Container(width: Get.width, height: 1, color: Colors.black38),
            SizedBox(height: 12),
            Container(width: Get.width, child: Text('$content')),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                onBack();
                Get.back();
              },
              child: Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: AppColors.kMaincolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ))),
            )
          ],
        )));
  }

  static showDialogConfirm(String title, String content, {Function onBack}) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        content: Container(
            child: Column(
          children: [
            Container(width: Get.width, height: 1, color: Colors.black38),
            SizedBox(height: 12),
            Container(width: Get.width, child: Text('$content')),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.kMaincolor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          'Huỷ bỏ',
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.black38,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      onBack();
                      Get.back();
                    },
                    child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.kMaincolor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          'Đồng ý',
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                ),
              ],
            )
          ],
        )));
  }

  static String convertPrice(String price) {
    final formPrice = NumberFormat("#,##0.00", "en_US");
    final s = formPrice.format(double.parse(price ?? '0'));
    return s.endsWith('00') ? s.substring(0, s.length - 3) + '  đ' : s + '  đ';
  }

  static String convertTypeProducts(int idType) {
    return idType == 1 ? 'Kg' : 'Cái';
  }

  static String convertDateTimeFormat(String value) {
    if (value.length == 1) {
      return '0' + value;
    } else {
      return value;
    }
  }

  static String converDateToString(int value) {
    if (value < 10) {
      return '0$value';
    } else {
      return value.toString();
    }
  }

  static String convertRangeTime(int value) {
    switch (value) {
      case 0:
        return '7h-9h';
        break;
      case 1:
        return '11h-12h';
        break;
      case 2:
        return '12h-19h';
        break;
      default:
        return '';
    }
  }

  static String converNextEndChoose(String dateCheck) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(dateCheck);
    return '${tempDate.year}-${converDateToString(tempDate.month)}-${converDateToString(tempDate.add(Duration(days: 1)).day)}';
  }

  static bool checkTimeExpried(String date) {
    try {
      DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(date);
      bool result = tempDate.isAfter(DateTime.now());
      return result;
    } on Exception {
      return false;
    }
  }

  static bool checkTimeChooseEndOrder(
      String date, String dateEnd, int type, int typeEnd) {
    try {
      DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(date);
      DateTime tempDateEnd = new DateFormat("yyyy-MM-dd").parse(dateEnd);
      if (date == dateEnd) {
        if (type == 0) {
          if (typeEnd < 2) {
            return false;
          } else {
            return true;
          }
        } else {
          return false;
        }
      } else {
        if (tempDate.isAfter(tempDateEnd)) {
          return false;
        } else {
          return true;
        }
      }
    } catch (e) {
      return false;
    }
  }

  static bool checkTimeChooseOrder(String dateCheck, int type) {
    try {
      DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(dateCheck);
      if (tempDate.isAfter(DateTime.now())) {
        return true;
      } else {
        switch (type) {
          case 0:
            if (DateTime.now().hour >= 7) {
              return false;
            } else {
              return true;
            }
            break;

          case 1:
            if (DateTime.now().hour >= 11) {
              return false;
            } else {
              return true;
            }
            break;

          case 2:
            if (DateTime.now().hour >= 17) {
              return false;
            } else {
              return true;
            }
            break;
          default:
            return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  static String convertCouponValue({int type, int value}) {
    switch (type) {
      case 1:
        return '$value%';
        break;
      case 2:
        return '$value vnđ';
        break;
      default:
        return '';
    }
  }

  static String convertStatusOrder(int status) {
    switch (status) {
      case 1:
        return 'Mới';
        break;

      case 2:
        return 'Shiper bắt đầu chuyển hàng cho store';
        break;

      case 3:
        return 'Shiper đã giao hàng cho store';
        break;

      case 4:
        return 'Đang giặt';
        break;

      case 5:
        return 'Đã giặt xong';
        break;

      case 6:
        return 'Shiper trả hàng cho khách';
        break;

      case 7:
        return 'Hoàn thành';
        break;

      case 8:
        return 'Huỷ';
        break;

      default:
        return '';
    }
  }
}
