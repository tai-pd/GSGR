import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/history_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';
import 'package:gsgr/models/history_order_model.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = '/history';
  static final route = GetPage(name: routeName, page: () => HistoryScreen());
  final List<Tab> listTab = [
    Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'MỚI'),
    Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'ĐANG ĐẾN'),
    Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'ĐANG GIẶT'),
    Tab(iconMargin: EdgeInsets.only(bottom: 4), text: 'HOÀN THÀNH')
  ];
  final controller = Get.put(HistoryOrderController());

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
                title: 'Lịch sử đơn hàng',
              ),
              DefaultTabController(
                  length: 4,
                  child: Expanded(
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 64,
                        automaticallyImplyLeading: false,
                        backgroundColor: AppColors.kMainBackground,
                        bottom: TabBar(
                          indicatorColor: Colors.lime,
                          labelColor: Colors.black,
                          isScrollable: true,
                          tabs: listTab,
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          Obx(
                            () => Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                      controller.dataNew.length, (index) {
                                    return Container(
                                      width: Get.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: AppColors.kMaincolor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Spacer(),
                                              Text(
                                                (controller.dataNew[index]
                                                        as Products)
                                                    .createdAt,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.network(
                                                (controller.dataNew[index]
                                                        as Products)
                                                    .image,
                                                width: 64,
                                                height: 64,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    (controller.dataNew[index]
                                                            as Products)
                                                        .name,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    Helper.convertPrice(
                                                            (controller.dataNew[
                                                                        index]
                                                                    as Products)
                                                                .price
                                                                .toString()) +
                                                        'đ',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Column(
                                children: List.generate(
                                    controller.datacomming.length, (index) {
                                  return Container(
                                    width: Get.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.kMaincolor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Spacer(),
                                            Text(
                                              (controller.datacomming[index]
                                                      as Products)
                                                  .createdAt,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.network(
                                              (controller.datacomming[index]
                                                      as Products)
                                                  .image,
                                              width: 64,
                                              height: 64,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  (controller.datacomming[index]
                                                          as Products)
                                                      .name,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  (controller.datacomming[index]
                                                              as Products)
                                                          .price
                                                          .toString() +
                                                      'đ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Column(
                                children: List.generate(
                                    controller.dataDoing.length, (index) {
                                  return Container(
                                    width: Get.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.kMaincolor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Spacer(),
                                            Text(
                                              (controller.dataDoing[index]
                                                      as Products)
                                                  .createdAt,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.network(
                                              (controller.dataDoing[index]
                                                      as Products)
                                                  .image,
                                              width: 64,
                                              height: 64,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  (controller.dataDoing[index]
                                                          as Products)
                                                      .name,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  Helper.convertPrice(
                                                          (controller.dataNew[
                                                                      index]
                                                                  as Products)
                                                              .price
                                                              .toString()) +
                                                      'đ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          Obx(
                            () => Container(
                              child: Column(
                                children: List.generate(
                                    controller.dataComplet.length, (index) {
                                  return Container(
                                    width: Get.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.kMaincolor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Spacer(),
                                            Text(
                                              (controller.dataComplet[index]
                                                      as Products)
                                                  .createdAt,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.network(
                                              (controller.dataComplet[index]
                                                      as Products)
                                                  .image,
                                              width: 64,
                                              height: 64,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  (controller.dataComplet[index]
                                                          as Products)
                                                      .name,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  Helper.convertPrice(
                                                          (controller.dataNew[
                                                                      index]
                                                                  as Products)
                                                              .price
                                                              .toString()) +
                                                      'đ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
