import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/value/colors.dart';

class WidgetNoteOrder extends StatelessWidget {
  WidgetNoteOrder({
    Key key,
  }) : super(key: key);

  final controller = Get.find<OrderController>();

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
              'Ghi chú',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.note,
                color: AppColors.kMaincolor,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    controller.remark.value = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Ghi chú ',
                      hintStyle: TextStyle(color: Colors.black38),
                      enabledBorder: InputBorder.none),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
