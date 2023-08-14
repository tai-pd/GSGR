import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/controller/new_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/home/widget/widget_card_user.dart';
import 'package:gsgr/view/home/widget/widget_item_vocher_dialog.dart';
import 'package:gsgr/view/home/widget/widget_slider_news.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);
  final controller = Get.put(HomeController());
  final controllerSlider = Get.put(NewController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: Stack(children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 700,
            width: Get.width,
            // color: AppColors.kMaincolor,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.kMaincolor, AppColors.kMainBackground])),
            child: SafeArea(
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => controllerSlider.list.length == 0
                    ? SizedBox()
                    : WidgetSliderNews()),
                SizedBox(height: 12),
                WidgetCardUser(),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'Phiếu ưu đãi của bạn',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12),
                Obx(() => Column(
                    children: List.generate(controller.listCoupon.length,
                        (index) => WidgetItemVocherDialog(index: index))))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
