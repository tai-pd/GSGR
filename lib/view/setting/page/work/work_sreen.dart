import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/work_controller.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/setting/page/work/detail_order/detail_order.dart';
import 'package:gsgr/view/setting/page/work/widget/work_item_done_wash.dart';
import 'package:gsgr/widget/top_nav.dart';

import 'widget/work_item_new_order.dart';

class WorkScreen extends StatelessWidget {
  static const String routeName = '/work';
  static final route = GetPage(name: routeName, page: () => WorkScreen());

  final TextEditingController _editingIdOrderController =
      TextEditingController();
  final TextEditingController _editingPhoneController = TextEditingController();

  final List<Tab> listTab = [
    Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'MỚI'),
    // Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'ĐANG ĐẾN'),
    Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'GIẶT XONG'),
    // Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'HOÀN THÀNH')
  ];

  final controller = Get.put(WorkController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(
            children: [
              WidgetTopNav(
                title: 'Danh sách đơn hàng',
              ),
              Column(children: [
                Container(
                  height: 42,
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
                          controller.isShowingForm.toggle();
                        },
                        child: Obx(
                          () => Container(
                            margin: EdgeInsets.only(right: 12, top: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(6),
                            child: controller.isShowingForm.isTrue
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
                      )
                    ],
                  ),
                ),
              ]),
              Obx(() => controller.isShowingForm.isTrue
                  ? formSearch(context)
                  : SizedBox()),
              SizedBox(height: 12),
              DefaultTabController(
                length: 2,
                child: Expanded(
                  child: Scaffold(
                    appBar: AppBar(
                      toolbarHeight: 4,
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColors.kMainBackground,
                      bottom: TabBar(
                        indicatorColor: Colors.lime,
                        labelColor: Colors.black,
                        isScrollable: true,
                        tabs: listTab,
                      ),
                    ),
                    body: TabBarView(children: [
                      Obx(
                        () => Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(controller.dataNew.length,
                                  (index) {
                                return WidgetItemNewOrder(
                                  controller: controller,
                                  index: index,
                                  clickID: (id) {
                                    Get.to(DetailOrderScreen(
                                      item:
                                          (controller.dataNew[index] as Order),
                                    ));
                                  },
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                  controller.dataDoneWash.length, (index) {
                                return WidgetItemDoneWashOrder(
                                  controller: controller,
                                  index: index,
                                  clickID: (id) {
                                    Get.to(DetailOrderScreen(
                                      item: (controller.dataDoneWash[index]
                                          as Order),
                                    ));
                                  },
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column formSearch(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
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
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 36,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    border: Border.all(width: 1.0, color: Colors.black26),
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
            SizedBox(width: 8),
            InkWell(
              onTap: () {},
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
      ],
    );
  }
}
