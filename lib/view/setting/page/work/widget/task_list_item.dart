import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/responses/task_order_response.dart';
import 'package:gsgr/value/colors.dart';

class TaskListItem extends StatelessWidget {
  final Order item;
  const TaskListItem({
    this.item,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.kMaincolor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),
              Text(
                item.createdAt ?? '',
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
                      item.id.toString(),
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
                    'Địa chỉ cửa hàng: ${item.storeAddress ?? ''}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Tên Khách hàng: ${item.customerName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Số điện thoại:  ${item.tel}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Địa chỉ: ${item.addressFrom}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      item.totalPrice == null || item.totalPrice == 0
                          ? Text('Chưa cập nhật giá')
                          : Text(
                              Helper.convertPrice(item.totalPrice.toString()) +
                                  'đ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                            color: item.status == 1 ||
                                    item.status == 3 ||
                                    item.status == 5
                                ? Colors.red[300]
                                : Colors.blue[300],
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          item.status == 1 ||
                                  item.status == 3 ||
                                  item.status == 5
                              ? 'Chưa nhận'
                              : 'Đã nhận',
                          style: TextStyle(
                              color: item.status == 3
                                  ? Colors.white
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.kMaincolor,
                        ),
                      )
                    ],
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
