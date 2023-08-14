import 'package:flutter/material.dart';
import 'package:gsgr/value/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetCarPlace extends StatelessWidget {
  final String address;
  final String phone;
  final String title;
  final String time;
  WidgetCarPlace({
    this.title,
    this.phone,
    this.address,
    this.time,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title ',
          style: TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            if (phone.isNotEmpty) {
              launch("tel://$phone");
            }
          },
          child: Row(
            children: [
              Icon(
                Icons.phone_android_outlined,
                color: AppColors.kMaincolor,
              ),
              SizedBox(width: 8),
              Text(
                '$phone',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.timer, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Thời gian hoạt động : $time',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.place, color: AppColors.kMaincolor),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Địa chỉ : $address',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
