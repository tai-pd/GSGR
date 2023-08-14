import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/register_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/styles.dart';

class RegistScreen extends StatelessWidget {
  static const String routeName = '/regist';
  static final route = GetPage(name: routeName, page: () => RegistScreen());
  static final controller = Get.put(RegisteController());
  final TextEditingController editTexController = TextEditingController();
  final TextEditingController voucherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic argumentData = Get.arguments;

    String phone = argumentData[0];

    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  child: Center(
                child: Text(
                  'Đăng Ký',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 32),
                ),
              ))),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Họ và tên',
                        style: AppStyles.styleTitleLogin,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.fiber_dvr,
                        size: 32,
                        color: Colors.black38,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: editTexController,
                          onChanged: (value) {
                            // companyID(value);
                            controller.name.value = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nhập họ tên..',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 18)),
                        ),
                      ),
                      SizedBox(width: 12)
                    ]),
                  ),
                  SizedBox(height: 22),
                  Row(
                    children: [
                      Text(
                        'Ngày tháng năm sinh',
                        style: AppStyles.styleTitleLogin,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      controller.showDateTimePicker();
                    },
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(children: [
                        SizedBox(width: 12),
                        Icon(
                          Icons.date_range,
                          size: 32,
                          color: Colors.black38,
                        ),
                        SizedBox(width: 12),
                        Obx(
                          () => Expanded(child: Text('${controller.birthDay}')),
                        ),
                        SizedBox(width: 12),
                      ]),
                    ),
                  ),
                  SizedBox(height: 22),
                  Row(
                    children: [
                      Text(
                        'Nhập mã giới thiệu',
                        style: AppStyles.styleTitleLogin,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.code_rounded,
                        size: 32,
                        color: Colors.black38,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: voucherController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nhập mã giới thiệu (Không bắt buộc)..',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 18)),
                        ),
                      ),
                      SizedBox(width: 12)
                    ]),
                  ),
                  SizedBox(height: 8),
                  Obx(
                    () => Row(
                      children: [
                        Text(
                          '${controller.errorInviteCode}',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                    color: AppColors.kMaincolor,
                    onPressed: () {
                      if (controller.name.value.isEmpty) {
                        Helper.showDialog('Lỗi nhập liệu',
                            'Vui lòng kiểm tra dữ liệu nhập vào',
                            onBack: () {});
                      } else {
                        controller.registInfoUser(editTexController.text,
                            voucherController.text ?? '', phone);
                      }
                    },
                    child: Container(
                        height: 54,
                        width: Get.width,
                        child: Center(
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}
