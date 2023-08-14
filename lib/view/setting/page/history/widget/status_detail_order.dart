import 'package:flutter/material.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/setting/page/history/history_detail.dart';
import 'package:gsgr/view/setting/page/history/widget/status_order_history_process.dart';

class StatusDetailOrder extends StatelessWidget {
  const StatusDetailOrder({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HistoryDetail widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: 120,
                child: Text(
                  'Tình trạng đơn ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            SizedBox(width: 12),
            Text(
              'Ngày cập nhật',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Giờ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text(
              'ID',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 2),
        StatusOrder(widget: widget),
        Divider(color: Colors.black54),
        Row(
          children: [
            Icon(Icons.account_circle, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Khách hàng: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(widget.item.customerName ?? '')
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.phone_android, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Số điện thoại: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(widget.item.customerTel ?? '')
          ],
        ),
        Divider(color: Colors.black54),
        Row(
          children: [
            Icon(Icons.update, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Thời gian gửi: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(widget.item.orderStart ?? '')
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.alarm_on, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Khung giờ: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text('${Helper.convertRangeTime(widget.item.rangeTimeStart)}')
          ],
        ),
        SizedBox(height: 12),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            children: [
              Icon(Icons.location_on, color: AppColors.kMaincolor),
              SizedBox(width: 8),
              Text(
                'Địa chỉ gửi: ',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(widget.item.addressFrom ?? '')
            ],
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.notifications_none, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Ghi chú gửi: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(widget.item.noteFrom ?? '')
          ],
        ),
        Divider(color: Colors.black54),
        Row(
          children: [
            Icon(Icons.history, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Thời gian nhận: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(widget.item.orderEnd ?? '')
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.alarm_on, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Khung giờ: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text('${Helper.convertRangeTime(widget.item.rangeTimeEnd)}')
          ],
        ),
        SizedBox(height: 12),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            children: [
              Icon(Icons.where_to_vote, color: AppColors.kMaincolor),
              SizedBox(width: 8),
              Text(
                'Địa chỉ nhận: ',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(widget.item.addressTo ?? '')
            ],
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.notifications_none, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Text(
              'Ghi chú nhận: ',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(widget.item.noteTo ?? '')
          ],
        ),
        // Divider(color: Colors.black54),
        // Row(
        //   children: [
        //     Icon(Icons.qr_code_2, color: AppColors.kMaincolor),
        //     SizedBox(width: 8),
        //     Text(
        //       'Mã giảm giá: ',
        //       style: TextStyle(fontWeight: FontWeight.w700),
        //     ),
        //     Text(widget.item.couponName ?? '')
        //   ],
        // ),
        // SizedBox(height: 12),
        // Row(
        //   children: [
        //     Icon(Icons.monetization_on, color: AppColors.kMaincolor),
        //     SizedBox(width: 8),
        //     Text(
        //       'Tổng tiền: ',
        //       style: TextStyle(fontWeight: FontWeight.w700),
        //     ),
        //     Text('${Helper.convertPrice(widget.item.totalPrice.toString())}đ'),
        //   ],
        // ),
      ],
    );
  }
}
