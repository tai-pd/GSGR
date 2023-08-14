import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/models/coupon_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/line_dashed.dart';

class WidgetItemVocher extends StatelessWidget {
  final int index;
  WidgetItemVocher({Key key, @required this.index}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, offset: Offset(0, 2), blurRadius: 3)
              ],
              borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                    padding: EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/images/ic_logo.png',
                      fit: BoxFit.contain,
                    )),
              ),
            ),
            LineDashedPainter(),
            SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${(controller.listCoupon[index] as Coupons).name}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  (controller.listCoupon[index] as Coupons).endDate != null
                      ? SizedBox(height: 12)
                      : SizedBox(),
                  (controller.listCoupon[index] as Coupons).endDate != null
                      ? Text(
                          'Hạn sử dụng : ${(controller.listCoupon[index] as Coupons).endDate}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kMaincolor),
                        )
                      : SizedBox()
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.post_add,
                    color: AppColors.kMaincolor,
                    size: 22,
                  ),
                  Text(
                    '${(controller.listCoupon[index] as Coupons).count}',
                    style: TextStyle(color: AppColors.kMaincolor),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8)
          ]),
        ));
  }
}
