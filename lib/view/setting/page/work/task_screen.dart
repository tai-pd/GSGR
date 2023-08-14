import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/task_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';

import 'widget/task_detail.dart';
import 'widget/task_list_item.dart';

class TaskScreen extends StatelessWidget {
  static const String routeName = '/task';
  static final route = GetPage(name: routeName, page: () => TaskScreen());

  final controller = Get.put(TaskController());

  final TextEditingController _idDonhangEditting = TextEditingController();
  final TextEditingController _phoneEditting = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Tab> listTab = [
      Tab(
          iconMargin: EdgeInsets.only(bottom: 4),
          text: controller.roleId == 2 ? 'NHẬN HÀNG' : 'ĐANG XỬ LÝ'),
      Tab(
          iconMargin: EdgeInsets.only(bottom: 4),
          text: controller.roleId == 2 ? 'GIAO HÀNG' : 'CHỜ GIAO'),
    ];
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.kMaincolor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: AppColors.kMainBackground,
                child: Column(children: [
                  WidgetTopNav(title: 'Danh sách công việc'),
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
                      ? formSearch(context, _idDonhangEditting, _phoneEditting)
                      : SizedBox()),
                  SizedBox(height: 12),
                  DefaultTabController(
                    length: 2,
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
                        body: TabBarView(children: [
                          Obx(
                            () => SingleChildScrollView(
                              child: Column(
                                children: List.generate(controller.list1.length,
                                    (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(TaskDetail(
                                        item: controller.list1[index],
                                      ));
                                    },
                                    child: TaskListItem(
                                      item: controller.list1[index],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          Obx(
                            () => SingleChildScrollView(
                              child: Column(
                                children: List.generate(controller.list2.length,
                                    (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(TaskDetail(
                                        item: controller.list2[index],
                                      ));
                                    },
                                    child: TaskListItem(
                                      item: controller.list2[index],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ]),
              ),
              Obx(
                () => controller.isLoadding.value
                    ? Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black12,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ))
                    : SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column formSearch(
      BuildContext context,
      TextEditingController idDonhangEditting,
      TextEditingController phoneEditting) {
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
            controller: idDonhangEditting,
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
            controller: phoneEditting,
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
              onTap: () {
                idDonhangEditting.text = '';
                phoneEditting.text = '';
              },
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
              onTap: () {
                controller.seachDataLocal(
                    _idDonhangEditting.text, _phoneEditting.text);
                FocusScope.of(context).unfocus();
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
      ],
    );
  }
}

// class TaskDetail extends StatelessWidget {
//   const TaskDetail({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
