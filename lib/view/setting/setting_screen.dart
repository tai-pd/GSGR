import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/setting_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/view/setting/page/about/about_screen.dart';
import 'package:gsgr/view/setting/page/contact/contact_screen.dart';
import 'package:gsgr/view/setting/page/faq/faq_screen.dart';
import 'package:gsgr/view/setting/page/history/history_order.dart';
import 'package:gsgr/view/setting/page/mycoupon/mycoupon_screen.dart';
import 'package:gsgr/view/setting/page/notification/notification_screen.dart';
import 'package:gsgr/view/setting/page/notification/setting_notification_screen.dart';
import 'package:gsgr/view/setting/page/profile/profile_screen.dart';
import 'package:gsgr/view/setting/page/rating/rating_screen.dart';

import 'page/work/task_screen.dart';
import 'page/work/work_sreen.dart';
import 'page/work/statistic_screen.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';
  static final route = GetPage(name: routeName, page: () => SettingScreen());
  final controller = Get.put(SettingController());
  final SessionManager sessionManager = SessionManager();
  @override
  Widget build(BuildContext context) {
    controller.getRoleId();
    return Obx(() => Container(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Tiện ích',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(HistoryOrderScreen());
                      },
                      child: WidgetItemCarSetting(
                        title: 'Lịch sử đơn hàng',
                        icon: Icon(
                          Icons.history_edu_outlined,
                          color: AppColors.kMaincolor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AboutScreen.routeName);
                      },
                      child: WidgetItemCarSetting(
                        title: 'Về chúng tôi',
                        icon: Icon(
                          Icons.apartment_rounded,
                          color: AppColors.kMaincolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(FAQScreen.routeName);
                      },
                      child: WidgetItemCarSetting(
                        title: 'Câu hỏi thường gặp',
                        icon: Icon(
                          Icons.question_answer,
                          color: AppColors.kMaincolor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(NotificationScreen.routeName);
                      },
                      child: WidgetItemCarSetting(
                        title: 'Thông báo',
                        icon: Icon(
                          Icons.notifications_on_sharp,
                          color: AppColors.kMaincolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 12),
              Visibility(
                visible: controller.roleId.value != 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nhân viên ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Visibility(
                visible: controller.roleId.value != 1,
                child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(children: [
                      Visibility(
                        visible: controller.roleId.value == 4,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(WorkScreen.routeName);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.wallet_travel_outlined,
                                color: AppColors.kMaincolor,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text('Phân việc'),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: AppColors.kMaincolor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.roleId.value == 4,
                        child: Column(
                          children: [
                            SizedBox(height: 12),
                            Container(
                              height: 1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: (controller.roleId.value == 2 ||
                            controller.roleId.value == 3),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(TaskScreen.routeName);
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    Icons.directions_run_sharp,
                                    color: AppColors.kMaincolor,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text('Công việc'),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColors.kMaincolor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.roleId.value == 4,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(StatisticScreen.routeName);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 1,
                                color: Colors.black12,
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    Icons.addchart,
                                    color: AppColors.kMaincolor,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text('Thống kê'),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColors.kMaincolor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Hỗ trợ ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
              WidgetHelpSetting(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Tài khoản ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),

              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () {
                        Get.toNamed(MycouponScreen.routeName);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/ic_gift.svg'),
                          SizedBox(width: 8),
                          Text('Mời bạn bè'),
                          const Spacer(),
                          Chip(
                            label: Text(
                              '+ 20% Bonus',
                            ),
                            backgroundColor:
                                AppColors.kMaincolor.withOpacity(.5),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.kMaincolor,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 12,
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        Get.to(SettingNotificationScreen());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: AppColors.kMaincolor,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text('Cài đặt thông báo'),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.kMaincolor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Divider(
                      height: 12,
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        Get.toNamed(ProfileScreen.routeName);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: AppColors.kMaincolor,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text('Thông tin cá nhân '),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.kMaincolor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    // SizedBox(height: 12),
                    // InkWell(
                    //   onTap: () {
                    //     Get.toNamed(LocationScreen.routeName);
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.location_history,
                    //         color: AppColors.kMaincolor,
                    //       ),
                    //       SizedBox(width: 8),
                    //       Expanded(
                    //         child: Text('Địa chỉ đã lưu'),
                    //       ),
                    //       Icon(
                    //         Icons.arrow_forward_ios,
                    //         size: 12,
                    //         color: AppColors.kMaincolor,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 12),
                    // Container(
                    //   height: 1,
                    //   color: Colors.black12,
                    // ),

                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        controller.lougOut();
                        // Get.defaultDialog(
                        //     title: 'Xác nhận',
                        //     content: Text(
                        //         'Bạn chắc chắn muốn đăng xuất tài khoản không'),
                        //     // confirm: Text('Đăng xuất'),
                        //     textCancel: 'Huỷ bỏ',
                        //     textConfirm: 'Đăng xuất',
                        //     onConfirm: () {
                        //        controller
                        //       sessionManager.setLogin(false);
                        //       sessionManager.clearData().then(
                        //           (value) => Get.offAllNamed(LoginSreen.routeName));
                        //     },
                        //     onCancel: () {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: AppColors.kMaincolor,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text('Đăng xuất'),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.kMaincolor,
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 12),
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        controller.confirmRemoveAccount();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_forever,
                            color: AppColors.kMaincolor,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text('Xóa Tài Khoản'),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: AppColors.kMaincolor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12)
                  ],
                ),
              )
            ],
          ),
        )));
  }
}

class WidgetHelpSetting extends StatelessWidget {
  const WidgetHelpSetting({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(RatingScreen.routeName);
            },
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.kMaincolor,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Gửi đánh giá và góp ý '),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.kMaincolor,
                )
              ],
            ),
          ),
          SizedBox(height: 12),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              Get.toNamed(ContactScreen.routeName);
            },
            child: Row(
              children: [
                Icon(
                  Icons.contact_page,
                  color: AppColors.kMaincolor,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Liên hệ '),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
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

class WidgetItemCarSetting extends StatelessWidget {
  final String title;
  final Icon icon;

  WidgetItemCarSetting({
    this.title,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                color: AppColors.kMaincolor.withOpacity(.2)),
            child: icon,
          ),
          SizedBox(height: 8),
          Text(
            '$title',
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
