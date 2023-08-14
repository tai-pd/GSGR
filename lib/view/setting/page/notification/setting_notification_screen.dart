import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/setting_push_notification_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/roles.dart';
import 'package:gsgr/widget/top_nav.dart';
import 'package:switcher_button/switcher_button.dart';

class SettingNotificationScreen extends StatefulWidget {
  @override
  _SettingNotificationScreen createState() => _SettingNotificationScreen();
}

class _SettingNotificationScreen extends State<SettingNotificationScreen> {
  final controller = Get.put(SettingPushNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Center(
          child: Container(
            color: AppColors.kMainBackground,
            child: Column(
              children: [
                WidgetTopNav(
                  title: 'Cài đặt thông báo',
                ),
                Divider(
                  height: 24,
                  color: AppColors.kMainBackground,
                ),
                Expanded(
                  child: Obx(
                    () => controller.isLoading.isTrue
                        ? Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                ListPNSetting(
                                  controller: controller,
                                  platform: 'App',
                                ),
                                Divider(
                                  height: 24,
                                  color: AppColors.kMainBackground,
                                ),
                                controller.userRole == ROLES.CUSTOMER.value
                                    ? SizedBox()
                                    : ListPNSetting(
                                        controller: controller,
                                        platform: 'Web',
                                      ),
                              ],
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: InkWell(
                    child: Container(
                      height: 48,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppColors.kMainBackground,
                        border: Border.all(color: Colors.blue[200], width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Lưu cài đặt',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      controller.setPushNotificationSetting(
                          id: controller.userId,
                          pnAppp: controller.pnAppArr,
                          pnWebb: controller.pnWebArr);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListPNSetting extends StatelessWidget {
  ListPNSetting({Key key, this.controller, this.platform}) : super(key: key);

  final SettingPushNotificationController controller;
  final String platform;

  @override
  Widget build(BuildContext context) {
    print(context);
    var pnSetting = platform == 'App' ? controller.pnApp : controller.pnWeb;
    var pnRequest =
        platform == 'App' ? controller.pnAppArr : controller.pnWebArr;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kMaincolor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        color: AppColors.kMaincolor,
                        blurRadius: 2)
                  ],
                  border: Border(
                      bottom: BorderSide(color: Colors.amberAccent, width: 1))),
              child: Center(
                child: Text(
                  platform,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ...List.generate(pnSetting.length, (index) {
              var _key = '';
              var _value = false;
              pnSetting[index].forEach((k, v) {
                _key = k;
                _value = v;
              });
              return Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.kMainBackground,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.statusStr[_key] == null
                          ? ''
                          : controller.statusStr[_key]),
                      SwitcherButton(
                        offColor: Colors.grey.withOpacity(.3),
                        value: _value,
                        onChange: (value) {
                          if (value) {
                            pnRequest.add(int.parse(_key));
                          } else {
                            pnRequest.remove(int.parse(_key));
                          }
                          print(pnRequest);
                          print(value);
                        },
                        onColor: Color.fromARGB(255, 166, 89, 75),
                      ),
                    ],
                  ),
                ),
              );
            }),
            Divider(height: 4),
          ],
        ),
      ),
    );
  }
}
