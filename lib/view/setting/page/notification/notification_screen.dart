import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/notification_controller.dart';
import 'package:gsgr/responses/notification_response.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notificationScreen';
  static final route =
      GetPage(name: routeName, page: () => NotificationScreen());

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final controller = Get.put(NotificationController());

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
              title: 'Thông báo',
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 48,
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              onChanged: (text) {
                                if (text.length > 0) {
                                  controller.getNotification(text);
                                } else {
                                  controller.getNotification(null);
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Tìm kiếm',
                                hintStyle: TextStyle(color: Colors.black38),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Obx(
                  () => Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.listData.length,
                          itemBuilder: (BuildContext context, int index) {
                            Push item = controller.listData[index];
                            return NotificationWidget(
                                controller: controller, item: item);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key key,
    @required this.item,
    @required this.controller,
  }) : super(key: key);

  final Push item;
  final NotificationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26, width: 1),
        color: item.status == 0 ? Colors.blue[50] : Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/ic_logo.png',
            fit: BoxFit.contain,
            width: 50,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 8, right: 4, top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${item.pushTitle}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      '  ${item.pushContent}',
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${item.pushedAt}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          )),
          InkWell(
              onTap: () {
                print(item.id);
                Get.bottomSheet(Container(
                  height: item.status == 0 ? 180 : 150,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  AssetImage('assets/images/ic_logo.png'),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '${item.pushContent}',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Divider(color: Colors.black54, height: 18),
                            item.status == 0
                                ? InkWell(
                                    onTap: () {
                                      print(item.id);
                                      controller.updateNotification(item.id);
                                      // controller.listData.firstWhere(
                                      //     (element) =>
                                      //         (element as Push).id == item.id);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.visibility,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                        SizedBox(width: 10),
                                        Text('Đánh dấu đã xem thông báo')
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                controller.deleteNotification(item.id);
                                controller.listData.removeWhere((element) =>
                                    (element as Push).id == item.id);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Xoá thông báo này')
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
              },
              child: Icon(
                Icons.more_horiz,
              )),
        ],
      ),
    );
  }
}
