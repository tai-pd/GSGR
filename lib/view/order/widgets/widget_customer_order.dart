import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/value/colors.dart';

class WidgetCustomerOrder extends StatelessWidget {
  WidgetCustomerOrder({
    Key key,
  }) : super(key: key);

  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext content) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: Get.width,
      color: Colors.white,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Khách hàng ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 12),
            controller.checkCustomer.isTrue
                ? Row(
                    children: [
                      Text('Tên Khách hàng : ${controller.userName}'),
                      Expanded(
                        child: Text(''),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.userId.value = '';
                                  controller.userName.value = '';
                                  controller.selectedUser.value = '';
                                  Get.bottomSheet(BottomsheetGetCustomer());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.kMaincolor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_pin,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Chọn khách hàng',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      controller.selectedUser.value.isBlank == false
                          ? Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 16, bottom: 6),
                                  child: Text(
                                    '${controller.selectedUser}',
                                    style: TextStyle(
                                        color: Colors.blue[600],
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox()
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class BottomsheetGetCustomer extends StatelessWidget {
  final controller = Get.put(OrderController());
  final TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.phone_android_rounded,
                color: AppColors.kMaincolor,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                      hintText: 'Nhập số điện thoại',
                      hintStyle: TextStyle(color: Colors.black38),
                      enabledBorder: InputBorder.none),
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  controller.getUserByPhone(editingController.text);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Tra cứu',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
          SizedBox(height: 18),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 6),
                controller.userName.value != null
                    ? Text(
                        '${controller.userName}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        'Không tìm thấy khách hàng',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      )
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (controller.userName.value != null) {
                    controller.selectedUser.value = controller.userName.value;
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                  decoration: BoxDecoration(
                      color: AppColors.kMaincolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Xong',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
