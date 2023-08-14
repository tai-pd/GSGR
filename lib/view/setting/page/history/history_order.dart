import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/history_controller.dart';
import 'package:gsgr/helper/data.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/setting/page/history/history_detail.dart';
import 'package:gsgr/widget/top_nav.dart';

class HistoryOrderScreen extends StatefulWidget {
  static const String routeName = '/historyOrder';
  static final route =
      GetPage(name: routeName, page: () => HistoryOrderScreen());
  @override
  _HistoryOrderScreen createState() => _HistoryOrderScreen();
}

class _HistoryOrderScreen extends State<HistoryOrderScreen> {
  final controller = Get.put(HistoryOrderController());
  ScrollController scrController;

  @override
  void initState() {
    super.initState();
    controller.getHistoryOrder();
    scrController = ScrollController()..addListener(_srollListener);
  }

  @override
  void dispose() {
    scrController.removeListener(_srollListener);
    super.dispose();
  }

  void _srollListener() {
    if (scrController.position.atEdge) {
      if (scrController.position.pixels == 0) {
      } else {
        if (Get.isDialogOpen ?? false) {
        } else {
          controller.getHistoryOrderMore();
          scrController.animateTo(1000,
              duration: Duration(seconds: 1), curve: Curves.easeOut);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kMaincolor,
        body: SafeArea(
            child: Container(
          color: AppColors.kMainBackground,
          child: Column(children: [
            WidgetTopNav(
              title: 'Lịch sử đơn hàng',
            ),
            Expanded(
                child: Stack(
              children: [
                Column(
                  children: [
                    Obx(
                      () => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ))),
                                  InkWell(
                                    onTap: () {
                                      _toggle();
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue[400],
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                              )),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Text(
                                  'Đã tìm kiếm được ${controller.listHistory.length} kết quả'),
                            ),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: controller.loading.isTrue
                                  ? Container(
                                      key: UniqueKey(),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      child: WigetSearch(),
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
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrController,
                        child: Obx(() => controller.listHistory.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(top: 16),
                                child: Center(
                                    child: Text(
                                  'Không có dữ liệu',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )))
                            : Column(
                                children: List.generate(
                                    controller.listHistory.length, (index) {
                                Order item = controller.listHistory[index];
                                return InkWell(
                                  onTap: () {
                                    var sum =
                                        controller.sumPriceProductions(item);
                                    Get.to(HistoryDetail(
                                      item: item,
                                      sum: sum,
                                    ));
                                  },
                                  child: ItemHistoryCustomer(
                                    order: item,
                                  ),
                                );
                              }))),
                      ),
                    ),
                  ],
                ),
                Obx(() => controller.isLoading.value
                    ? Container(
                        color: Colors.grey.withOpacity(.4),
                        width: Get.width,
                        height: Get.height - 64,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox())
              ],
            )),
          ]),
        )));
  }

  _toggle() {
    controller.loading.value = !controller.loading.value;
  }
}

class HistoriesOrder extends StatelessWidget {
  const HistoriesOrder({
    Key key,
    @required this.scrController,
    @required this.controller,
  }) : super(key: key);

  final ScrollController scrController;
  final HistoryOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          controller: scrController,
          child: Obx(
            () => controller.listHistory.isEmpty
                ? Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Center(
                        child: Text(
                      'Không có dữ liệu',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )))
                : ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.listHistory.length,
                    itemBuilder: (BuildContext bc, int index) {
                      Order item = controller.listHistory[index];
                      return InkWell(
                        onTap: () {
                          var sum = controller.sumPriceProductions(item);
                          Get.to(HistoryDetail(
                            item: item,
                            sum: sum,
                          ));
                        },
                        child: ItemHistoryCustomer(
                          order: item,
                        ),
                      );
                    }),
          ),
        ),
      ),
    );
  }
}

class ItemHistoryCustomer extends StatelessWidget {
  final Order order;
  ItemHistoryCustomer({
    @required this.order,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.kMaincolor, width: 1)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                '${order.id}',
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.kMaincolor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          VerticalDivider(
            width: 3,
            color: AppColors.kMaincolor,
          ),
          Expanded(
            flex: 5,
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
                      Text('${order.customerName}',
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
                        Text('${order.customerTel}',
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
                          '${Helper.convertPrice(order.totalPrice.toString())}',
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
                            '${order.orderStart}',
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
                              color: getStatusColor(order.status),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(getStatusContent(order.status)),
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
    );
  }
}

// ignore: must_be_immutable
class WigetSearch extends StatelessWidget {
  final controller = Get.put(HistoryOrderController());
  TextEditingController _editingIdOrderController = TextEditingController();
  TextEditingController _editingPhoneController = TextEditingController();

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
                width: MediaQuery.of(context).size.width,
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
                    items:
                        getOrderStatus(controller.roleId).map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      print(newValue);
                      print(controller.roleId);
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
                  controller: _editingIdOrderController,
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
                  controller: _editingPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Số điện thoại'),
                ),
              ),
              SizedBox(height: 12),
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
                        _editingIdOrderController.text = '';
                        _editingPhoneController.text = '';
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
                        print(controller.toDate.value);
                        print(controller.orderType.value);

                        controller.searchHistoryOrder(
                            orderStart: controller.fromDate.value,
                            orderEnd: controller.toDate.value,
                            status: controller.orderType.value,
                            orderId: _editingIdOrderController.text,
                            customerTel: _editingPhoneController.text);
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
