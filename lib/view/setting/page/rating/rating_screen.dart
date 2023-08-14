import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/rating_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';

// ignore: must_be_immutable
class RatingScreen extends StatelessWidget {
  static const String routeName = '/rating';

  static final route = GetPage(name: routeName, page: () => RatingScreen());

  final controller = Get.put(RatingController());
  String name, body, email, phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kMaincolor,
        body: SafeArea(
          child: Container(
            color: AppColors.kMainBackground,
            child: Column(children: [
              WidgetTopNav(title: 'Gửi phản hồi'),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gửi phản hồi, thông báo lỗi.',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18)),
                        SizedBox(height: 8),
                        Text(
                          'Gửi phản hồi về các chức năng của app cho đội ngũ phát triển sản phẩm.',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tên người gởi',
                              ),
                              TextField(
                                onChanged: (value) {
                                  name = value;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nhập tên của bạn'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Địa chỉ email',
                              ),
                              TextField(
                                onChanged: (value) {
                                  email = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nhập địa chỉ email của bạn'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Số điện thoại',
                              ),
                              TextField(
                                onChanged: (value) {
                                  phone = value;
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Nhập số điện thoại của bạn'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nội dung phản hồi',
                              ),
                              TextField(
                                onChanged: (value) {
                                  body = value;
                                },
                                maxLines: 4,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        'Vui lòng mô tả nội dung phản hồi càng chi tiết càng tốt.'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Spacer(),
              Container(
                margin: EdgeInsets.all(12),
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.kMaincolor,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                  onPressed: () {
                    controller.sendMail(
                        body: body, phone: phone, emails: email, name: name);
                  },
                  child: Text(
                    'Gửi phản hồi',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
