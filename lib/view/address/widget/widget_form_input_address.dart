import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/address_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/suggest/suggest_screen.dart';

class WidgetFormInputAddress extends StatelessWidget {
  WidgetFormInputAddress({
    Key key,
  }) : super(key: key);

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black45, offset: Offset(2, 0), blurRadius: 5),
          ]),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chi tiết địa chỉ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () => Get.toNamed(SuggestScreen.routeName),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.kMaincolor,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Obx(() => Text(controller.address.value.isNotEmpty
                      ? ' ${controller.address.value}'
                      : 'Chọn địa chỉ')),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.kMaincolor,
                )
              ],
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
