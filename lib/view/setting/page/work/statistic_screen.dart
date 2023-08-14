import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/statistic_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';
import 'package:gsgr/helper/data.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gsgr/responses/statistic_order_response.dart';

class StatisticScreen extends StatefulWidget {
  static const String routeName = '/statistic';
  static final route = GetPage(name: routeName, page: () => StatisticScreen());

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  final controller = Get.put(StatisticController());
  TextEditingController _editingIdOrderController = TextEditingController();
  TextEditingController _editingPhoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.pagingController.addPageRequestListener((pageKey) {
      controller.getOrders(
          pageKey: pageKey,
          orderStart: controller.fromDate.value,
          orderEnd: controller.toDate.value,
          status: controller.orderType.value,
          orderId: controller.orderId.value,
          phone: controller.customerPhone.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.pagingController.refresh();

    return Scaffold(
        backgroundColor: AppColors.kMaincolor,
        body: SafeArea(
          child: Container(
            color: AppColors.kMainBackground,
            child: Column(children: [
              WidgetTopNav(
                title: 'Thống kê đơn hàng',
              ),
              Expanded(
                child: Obx(
                  () => Container(
                    margin: EdgeInsets.only(
                        left: 12, top: 12, right: 12, bottom: 0),
                    child: Column(
                      children: [
                        Container(
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                      child: Text(
                                'Tìm kiếm đơn hàng',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ))),
                              InkWell(
                                onTap: () {
                                  _toggle();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.all(6),
                                  child: controller.loading.isTrue
                                      ? Icon(
                                          Icons.expand_less,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.expand_more,
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: controller.loading.isTrue
                              ? Container(
                                  key: UniqueKey(),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: WigetSearch(
                                    editingIdOrderController:
                                        _editingIdOrderController,
                                    editingPhoneController:
                                        _editingPhoneController,
                                  ),
                                )
                              : Container(
                                  key: UniqueKey(),
                                  height: 0,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: _toggle,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          child: PagedListView<int, Order>.separated(
                            pagingController: controller.pagingController,
                            builderDelegate: PagedChildBuilderDelegate<Order>(
                              itemBuilder: (context, item, index) {
                                return WidgetItemNewOrder(
                                  controller: controller,
                                  index: index,
                                  item: item,
                                );
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            color: Colors.blue[300],
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.paid,
                                color: Colors.yellow[700],
                                size: 24,
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Tổng tiền: ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${controller.totalPrice}đ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  _toggle() {
    controller.loading.value = !controller.loading.value;
  }
}

class WidgetItemNewOrder extends StatelessWidget {
  final int index;
  final Order item;
  const WidgetItemNewOrder({
    this.index,
    this.item,
    Key key,
    @required this.controller,
  }) : super(key: key);

  final StatisticController controller;

  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 114,
      margin: EdgeInsets.only(top: 16, right: 2),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Center(
            child: Container(
                width: 110,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kMaincolor, width: .5),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text('${item.id}',
                        style: TextStyle(
                            color: AppColors.kMaincolor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)))),
          ),
          SizedBox(width: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        size: 16,
                        color: Colors.yellow[700],
                      ),
                      Text(' Khách hàng: '),
                      Text('${item.customerName}',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone_android_rounded,
                          size: 16,
                          color: Colors.yellow[700],
                        ),
                        Text(' SĐT: '),
                        Text('${item.customerPhone}',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Row(
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          size: 16,
                          color: Colors.yellow[700],
                        ),
                        Text(' Tổng tiền: '),
                        Text(
                          '${Helper.convertPrice(item.totalPrice.toString())}đ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range_rounded,
                          color: Colors.green[400],
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${item.orderStart}',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                              color: getStatusColor(item.status),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(getStatusContent(item.status)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class WigetSearch extends StatelessWidget {
  final controller = Get.put(StatisticController());
  WigetSearch({this.editingIdOrderController, this.editingPhoneController});
  TextEditingController editingIdOrderController;
  TextEditingController editingPhoneController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2015, 3, 5),
                            maxTime: DateTime.now(), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          var idx = '$date'.indexOf(' ');
                          var value = '$date'.substring(0, idx).trim();
                          controller.fromDate.value = value;
                        }, currentTime: DateTime.now(), locale: LocaleType.vi);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 8),
                            Icon(Icons.date_range_outlined),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(controller.fromDate.value),
                            ),
                            Icon(Icons.arrow_drop_down_sharp)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2015, 3, 5),
                            maxTime: DateTime.now(), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          var idx = '$date'.indexOf(' ');
                          var value = '$date'.substring(0, idx).trim();
                          controller.toDate.value = value;
                        }, currentTime: DateTime.now(), locale: LocaleType.vi);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 8),
                            Icon(Icons.date_range_outlined),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(controller.toDate.value),
                            ),
                            Icon(Icons.arrow_drop_down_sharp)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 48,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    hint: Text(
                      controller.orderType.value,
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    underline: SizedBox(height: 0),
                    isExpanded: true,
                    items: getOrderStatus(0).map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      print(newValue);
                      controller.orderType.value = newValue;
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: editingIdOrderController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'ID đơn hàng '),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: editingPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Số điện thoại'),
                ),
              ),
              SizedBox(height: 12),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.fromDate.value = 'Từ ngày';
                        controller.toDate.value = 'Đến ngày';
                        controller.orderType.value = 'Phân loại';
                        editingIdOrderController.text = '';
                        editingPhoneController.text = '';
                      },
                      child: Container(
                        height: 36,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.white30,
                            border:
                                Border.all(width: 1.0, color: Colors.black26),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.reset_tv),
                            SizedBox(width: 4),
                            Text('Làm mới')
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print(controller.fromDate.value);

                        print(controller.orderType.value);
                        controller.orderId.value =
                            editingIdOrderController.text;
                        controller.customerPhone.value =
                            editingPhoneController.text;

                        controller.searchOrders(
                            orderStart: controller.fromDate.value,
                            orderEnd: controller.toDate.value,
                            status: controller.orderType.value,
                            phone: editingPhoneController.text,
                            orderId: editingIdOrderController.text);
                      },
                      child: Container(
                        height: 36,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 4),
                            Text('Tìm kiếm')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ));
  }
}
