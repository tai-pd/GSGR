import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/models/coupon_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/styles.dart';
import 'package:gsgr/view/home/widget/widget_item_vocher.dart';

class CouponScreen extends StatelessWidget {
  static const String routeName = '/coupon';
  static final route = GetPage(name: routeName, page: () => CouponScreen());
  final controller = Get.find<HomeController>();
  final orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kMaincolor,
        body: SafeArea(
          child: Container(
            color: AppColors.kMainBackground,
            child: Column(
              children: [
                Container(
                  height: 54,
                  color: AppColors.kMaincolor,
                  child: Row(
                    children: [
                      BackButton(
                        color: Colors.white,
                      ),
                      Text('Mã khuyến mãi', style: AppStyles.kTitleBack)
                    ],
                  ),
                ),
                Expanded(
                    child: Obx(
                  () => Column(
                    children:
                        List.generate(controller.listCoupon.length, (index) {
                      return InkWell(
                        onTap: () {
                          orderController.idCoupon.value =
                              (controller.listCoupon[index] as Coupons)
                                  .id
                                  .toString();
                          orderController.idCouponName.value =
                              (controller.listCoupon[index] as Coupons)
                                  .name
                                  .toString();
                          Get.back();
                        },
                        child: WidgetItemVocher(
                          index: index,
                        ),
                      );
                    }),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
