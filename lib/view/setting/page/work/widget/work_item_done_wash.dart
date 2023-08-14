import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/work_controller.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/value/colors.dart';

class WidgetItemDoneWashOrder extends StatelessWidget {
  final index;
  final Function(int) clickID;
  const WidgetItemDoneWashOrder({
    this.clickID,
    this.index,
    Key key,
    @required this.controller,
  }) : super(key: key);

  final WorkController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        clickID((controller.dataDoneWash[index] as Order).id);
      },
      child: Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.kMaincolor,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(),
                Text(
                  (controller.dataDoneWash[index] as Order).createdAt ?? '',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Row(
              children: [
                Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        (controller.dataDoneWash[index] as Order).id.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                SizedBox(width: 12),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID Khách hàng: ${(controller.dataDoneWash[index] as Order).customerId.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Tên Khách hàng: ${(controller.dataDoneWash[index] as Order).customerName.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Số điện thoại: ${(controller.dataDoneWash[index] as Order).tel.toString()} ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Địa chỉ: ${(controller.dataDoneWash[index] as Order).addressFrom}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Visibility(
                      visible:
                          (controller.dataDoneWash[index] as Order).shipId != 0,
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white70),
                            child: Text(
                                '${(controller.dataDoneWash[index] as Order).shipId == 0 ? '' : 'Đã chuyển đơn cho shipper '}'),
                          )
                        ],
                      ),
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
