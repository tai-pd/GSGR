import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/coupon/coupon_screen.dart';

class WidgetAddCodeOrder extends StatelessWidget {
  WidgetAddCodeOrder({
    Key key,
  }) : super(key: key);
  final controller = Get.find<OrderController>();
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 24),
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 22),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Container(
              child: Text(
                'Mã khuyến mãi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 12),
            InkWell(
                onTap: () {
                  homeController.reloadListCoupon();
                  Get.to(CouponScreen());
                },
                child: Obx(
                  () => Row(
                    children: [
                      Icon(
                        Icons.code,
                        color: AppColors.kMaincolor,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: controller.idCoupon.isEmpty
                            ? Text('Chọn mã khuyến mãi')
                            : Text('${controller.idCouponName}'),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.kMaincolor,
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
