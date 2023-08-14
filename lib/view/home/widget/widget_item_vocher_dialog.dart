import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/models/coupon_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/line_dashed.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class WidgetItemVocherDialog extends StatelessWidget {
  final int index;
  WidgetItemVocherDialog({Key key, @required this.index}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final SimpleDialog dialog = SimpleDialog(
      title: Center(child: Text('Chi tiết Coupon')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(thickness: 1),
              SizedBox(height: 8),
              Text(
                '${(controller.listCoupon[index] as Coupons).name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Container(
                child: BarCodeImage(
                  data: (controller.listCoupon[index] as Coupons).code,
                  lineWidth: 1.2,
                  codeType: BarCodeType.Code128,
                  barHeight: 100,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '${(controller.listCoupon[index] as Coupons).code}',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2),
              Text(
                'Sao chép',
                style: TextStyle(color: Colors.blue[600].withOpacity(0.8)),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.kMaincolor,
                      borderRadius: BorderRadius.circular(16)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  child: Text(
                    'Bắt đầu đặt hàng',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Container(
                // padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ngày hết hạn:'),
                    Text(
                      '${(controller.listCoupon[index] as Coupons).endDate}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Container(
                child: Text(
                    'Đây là phiếu giảm giá cho khách hàng thân thuộc! Hãy liên hệ với chúng tôi nếu có bất cứ thắc mắc nào nhé. Xin cảm ơn quý khách!'),
              )
            ],
          ),
        )
      ],
    );

    return Obx(() => InkWell(
          onTap: () {
            showDialog<void>(context: context, builder: (context) => dialog);
          },
          child: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 2),
                      blurRadius: 3)
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
                    SizedBox(height: 4),
                    Text(
                      '${(controller.listCoupon[index] as Coupons).name}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Hạn sử dụng : ${(controller.listCoupon[index] as Coupons).endDate}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kMaincolor),
                    )
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
          ),
        ));
  }
}
