import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/suggest/suggest_screen.dart';

class WidgetAddressOrder extends StatelessWidget {
  WidgetAddressOrder({
    Key key,
  }) : super(key: key);

  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22),
            Container(
              child: Text(
                'Địa chỉ nhận hàng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () {
                Get.to(SuggestScreen(input: TYPEINPUT.form));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.kMaincolor,
                  ),
                  SizedBox(width: 8),
                  Expanded(child: Obx(() => Text(controller.address.value))),
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
                  Icons.note_rounded,
                  color: AppColors.kMaincolor,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      controller.noteFrom.value = value;
                    },
                    decoration: InputDecoration(
                        hintText: 'Ghi chú nhận hàng...',
                        hintStyle: TextStyle(color: Colors.black38),
                        enabledBorder: InputBorder.none),
                  ),
                ),
              ],
            ),
            Obx(
              () => controller.sameAddress.value
                  ? SizedBox()
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Container(
                            child: Text(
                              'Địa chỉ trả hàng',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 12),
                          InkWell(
                            onTap: () {
                              Get.to(SuggestScreen(input: TYPEINPUT.to));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.kMaincolor,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                    child: Obx(() => Text(
                                        controller.addressTo?.value ??
                                            'Chọn địa chỉ trả hàng'))),
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
                                Icons.note_rounded,
                                color: AppColors.kMaincolor,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    controller.noteTo.value = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Ghi chú trả hàng...',
                                      hintStyle:
                                          TextStyle(color: Colors.black38),
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giao hàng đến cùng địa chỉ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Obx(
                  () => Switch(
                    onChanged: (value) {
                      controller.changeSameAddress();
                    },
                    value: controller.sameAddress.value,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
