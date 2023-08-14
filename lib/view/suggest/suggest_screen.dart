import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/suggest_controller.dart';
import 'package:gsgr/helper/data.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';

// ignore: must_be_immutable
class SuggestScreen extends StatelessWidget {
  static const routeName = '/suggest';
  static final route = GetPage(name: routeName, page: () => SuggestScreen());
  final TYPEINPUT input;
  final controller = Get.put(SuggestController());
  SuggestScreen({this.input});

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(children: [
            WidgetTopNav(title: 'Địa chỉ'),
            Expanded(
                child: Obx(() => Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(flex: 2, child: Text('Quận - Huyện')),
                              Expanded(
                                  flex: 3,
                                  child: DropdownButton<String>(
                                    value: controller.district.value,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      controller.district.value = newValue;
                                      switch (newValue) {
                                        case 'Hải Châu':
                                          controller.ward.value = 'Hải Châu 1';
                                          break;
                                        case 'Thanh Khê':
                                          controller.ward.value = 'An Khê';
                                          break;
                                        case 'Sơn Trà':
                                          controller.ward.value = 'An Hải Bắc';
                                          break;
                                        case 'Ngũ Hành Sơn':
                                          controller.ward.value = 'Hòa Hải';
                                          break;
                                        case 'Liên Chiểu':
                                          controller.ward.value =
                                              'Hòa Hiệp Bắc';
                                          break;
                                        case 'Hòa Vang':
                                          controller.ward.value = 'Hòa Bắc';
                                          break;
                                        case 'Cẩm Lệ':
                                          controller.ward.value = 'Hòa An';
                                          break;
                                        default:
                                      }
                                    },
                                    items: getStringDistrict()
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ))
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(flex: 2, child: Text('Phường - Xã')),
                              Expanded(
                                  flex: 3,
                                  child: DropdownButton<String>(
                                    value: controller.ward.value,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (String newValue) {
                                      controller.ward.value = newValue;
                                    },
                                    items: getStringWardByID(
                                            controller.district.value)
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text('Tên đường'),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            margin: EdgeInsets.only(top: 8),
                            width: Get.width,
                            height: 46,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                              controller: _textEditingController,
                              onChanged: (value) {
                                controller.street.value = value;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Nhập số nhà, tên đường ...'),
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (_textEditingController.text.length > 0) {
                                  controller.saveOrderAddress(input);
                                } else {
                                  Helper.showDialog('Lỗi nhập liệu',
                                      'Vui lòng kiểm tra thông tin nhập.',
                                      onBack: () {});
                                }
                              },
                              child: Container(
                                width: Get.width / 2,
                                height: 46,
                                decoration: BoxDecoration(
                                    color: AppColors.kMaincolor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(
                                  'Xác nhận',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )))
          ]),
        ),
      ),
    );
  }
}

enum TYPEINPUT { form, to, addn }
