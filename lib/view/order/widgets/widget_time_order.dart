import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/value/colors.dart';

class WidgetTimeOrder extends StatefulWidget {
  WidgetTimeOrder({
    Key key,
  }) : super(key: key);

  @override
  _WidgetTimeOrderState createState() => _WidgetTimeOrderState();
}

class _WidgetTimeOrderState extends State<WidgetTimeOrder> {
  final controller = Get.put(OrderController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          Container(
            child: Text(
              'Thời gian nhận hàng',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now().hour > 17
                      ? DateTime.now().add(Duration(days: 1))
                      : DateTime.now(),
                  // maxTime: DateTime(2019, 6, 7),
                  onChanged: (date) {}, onConfirm: (date) {
                controller.orderStart.value =
                    '${date.year}-${converDateToString(date.month)}-${converDateToString(date.day)}';
              }, currentTime: DateTime.now(), locale: LocaleType.vi);
            },
            child: Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: AppColors.kMaincolor,
                ),
                SizedBox(width: 8),
                Obx(() => Expanded(
                      child: Text('${controller.orderStart}'),
                    )),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.kMaincolor,
                )
              ],
            ),
          ),
          SizedBox(height: 12),
          Text('khung giờ'),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      if (Helper.checkTimeChooseOrder(
                          controller.orderStart.value, 0))
                        controller.changeValueChooseTime(0);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: !Helper.checkTimeChooseOrder(
                                controller.orderStart.value, 0)
                            ? AppColors.kMaincolor.withOpacity(.5)
                            : controller.chooseTime.value == 0
                                ? AppColors.kMaincolor
                                : Colors.black12,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                          child: Text(
                        '7h-9h',
                        style: TextStyle(
                            color: !Helper.checkTimeChooseOrder(
                                    controller.orderStart.value, 0)
                                ? Colors.white
                                : controller.chooseTime.value == 0
                                    ? Colors.white
                                    : Colors.black),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      if (Helper.checkTimeChooseOrder(
                          controller.orderStart.value, 1))
                        controller.changeValueChooseTime(1);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: !Helper.checkTimeChooseOrder(
                                controller.orderStart.value, 1)
                            ? AppColors.kMaincolor.withOpacity(.5)
                            : controller.chooseTime.value == 1
                                ? AppColors.kMaincolor
                                : Colors.black12,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                          child: Text(
                        '11h-12h',
                        style: TextStyle(
                            color: !Helper.checkTimeChooseOrder(
                                    controller.orderStart.value, 1)
                                ? Colors.white
                                : controller.chooseTime.value == 1
                                    ? Colors.white
                                    : Colors.black),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      if (Helper.checkTimeChooseOrder(
                          controller.orderStart.value, 2))
                        controller.changeValueChooseTime(2);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: !Helper.checkTimeChooseOrder(
                                controller.orderStart.value, 1)
                            ? AppColors.kMaincolor.withOpacity(.5)
                            : controller.chooseTime.value == 2
                                ? AppColors.kMaincolor
                                : Colors.black12,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                          child: Text(
                        '17h-19h',
                        style: TextStyle(
                            color: !Helper.checkTimeChooseOrder(
                                    controller.orderStart.value, 2)
                                ? Colors.white
                                : controller.chooseTime.value == 2
                                    ? Colors.white
                                    : Colors.black),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 22),
          Container(
            child: Text(
              'Thời gian trả hàng ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 12),
          Text('khung giờ'),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      if (Helper.checkTimeChooseEndOrder(
                          controller.orderStart.value,
                          controller.orderEnd.value,
                          controller.chooseTime.value,
                          0)) controller.changeValueChooseEndTime(0);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: !Helper.checkTimeChooseEndOrder(
                                controller.orderStart.value,
                                controller.orderEnd.value,
                                controller.chooseTime.value,
                                0)
                            ? AppColors.kMaincolor.withOpacity(.5)
                            : controller.chooseEndTime.value == 0
                                ? AppColors.kMaincolor
                                : Colors.black12,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                          child: Text(
                        '7h-9h',
                        style: TextStyle(
                            color: !Helper.checkTimeChooseEndOrder(
                                    controller.orderStart.value,
                                    controller.orderEnd.value,
                                    controller.chooseTime.value,
                                    0)
                                ? Colors.white
                                : controller.chooseEndTime.value == 0
                                    ? Colors.white
                                    : Colors.black),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      if (Helper.checkTimeChooseEndOrder(
                          controller.orderStart.value,
                          controller.orderEnd.value,
                          controller.chooseTime.value,
                          1)) controller.changeValueChooseEndTime(1);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: !Helper.checkTimeChooseEndOrder(
                                controller.orderStart.value,
                                controller.orderEnd.value,
                                controller.chooseTime.value,
                                1)
                            ? AppColors.kMaincolor.withOpacity(.5)
                            : controller.chooseEndTime.value == 1
                                ? AppColors.kMaincolor
                                : Colors.black12,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                          child: Text(
                        '11h-12h',
                        style: TextStyle(
                            color: !Helper.checkTimeChooseEndOrder(
                                    controller.orderStart.value,
                                    controller.orderEnd.value,
                                    controller.chooseTime.value,
                                    1)
                                ? Colors.white
                                : controller.chooseEndTime.value == 1
                                    ? Colors.white
                                    : Colors.black),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      if (Helper.checkTimeChooseEndOrder(
                          controller.orderStart.value,
                          controller.orderEnd.value,
                          controller.chooseTime.value,
                          2)) controller.changeValueChooseEndTime(2);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: !Helper.checkTimeChooseEndOrder(
                                controller.orderStart.value,
                                controller.orderEnd.value,
                                controller.chooseTime.value,
                                2)
                            ? AppColors.kMaincolor.withOpacity(.5)
                            : controller.chooseEndTime.value == 2
                                ? AppColors.kMaincolor
                                : Colors.black12,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                          child: Text(
                        '17h-19h',
                        style: TextStyle(
                            color: !Helper.checkTimeChooseEndOrder(
                                    controller.orderStart.value,
                                    controller.orderEnd.value,
                                    controller.chooseTime.value,
                                    2)
                                ? Colors.white
                                : controller.chooseEndTime.value == 2
                                    ? Colors.white
                                    : Colors.black),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now().hour > 17
                      ? DateTime.now().add(Duration(days: 1))
                      : DateTime.now(),
                  // maxTime: DateTime(2019, 6, 7),
                  onChanged: (date) {}, onConfirm: (date) {
                controller.orderEnd.value =
                    '${date.year}-${converDateToString(date.month)}-${converDateToString(date.day)}';
              }, currentTime: DateTime.now(), locale: LocaleType.vi);
            },
            child: Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: AppColors.kMaincolor,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Obx(() => Text('${controller.orderEnd}')),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.kMaincolor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String converDateToString(int value) {
  if (value < 10) {
    return '0$value';
  } else {
    return value.toString();
  }
}
