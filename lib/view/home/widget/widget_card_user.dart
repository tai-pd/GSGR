import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/constants.dart';

class WidgetCardUser extends StatelessWidget {
  final controller = Get.find<HomeController>();
  WidgetCardUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 22),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black54, offset: Offset(0, 3), blurRadius: 3)
          ],
        ),
        child: Obx(
          () => Column(
            children: [
              BarCodeImage(
                hasText: true,
                data: controller.phone.value ?? Constants.tell,
                lineWidth: 1.7,
                codeType: BarCodeType.Code128,
                barHeight: 100,
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(vertical: 22),
                decoration: BoxDecoration(
                    color: AppColors.kMaincolor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        controller.name.value ?? Constants.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Obx(
                        () => Text(
                          'Điểm của bạn: ${controller.point.value != 0.0 ? controller.point.value : '0'}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
